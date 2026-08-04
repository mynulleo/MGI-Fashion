<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin\Website;

use App\Action\Util\DeleteAction;
use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\System\Menu;
use App\Models\Website\Content\Content;
use App\Models\Website\Content\ContentFile;
use App\Rules\Base64Image;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules\File;

class ContentController extends BaseController
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Content::with(['contentFiles:content_id,title'])
            ->select('id', 'title', 'image', 'slug', 'sorting', 'status', 'created_at')
            ->latest();

        $query->whereLike($request->field_name, $request->value);
        $query->whereAny('status', $request->status);
        if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination);
            return new Resource($datas);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($slug = null)
    {
        return view('layouts.backend_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, DeleteAction $delete)
    {
        $data = $request->all();
        $image = $request->image_base64;
        $content = null;
        if ($this->validateCheck($request)) {
            if ($request->slug !== '' && $request->slug !== 'undefined' && $request->slug !== null) {
                $content = Content::where('slug', $request->slug)->first();
                if (empty($request->slug)) {
                    return response()->json(['error' => 'Slug is Missing!'], 200);
                }
            }

            DB::beginTransaction();
            try {
                if (!empty($content)) {
                    DB::commit();

                    return (new ContentController())->update($data, $content, $delete);
                } else {
                    if (!empty($image)) {
                        $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                        $data['image'] = cloudflare(file: $image, folder: 'content', resizeSize: $resizeValue, base64: true);
                    } else {
                        $data['image'] = null;
                    }

                    $data['slug'] = (new ContentController())->generateSlug($request->title);
                    $store = Content::create($data);
                    // $menu = (new ContentController())->generateMenu(slug: $store->slug, title: $store->title);
                }
                $type = empty($content) ? 'create' : 'update';
                if ($type == 'create') {
                    if ($request->has('content_files')) {
                        foreach ($request->content_files as $fileData) {
                            if (!empty($fileData['title']) && !empty($fileData['file'])) {
                                $file = $fileData['file'];
                                $filePath = $this->upload($file, 'content-files');
                                $dataFile = [
                                    'title' => $fileData['title'],
                                    'file' => $filePath,
                                ];
                                $store->contentFiles()->create($dataFile);
                            }
                        }
                    }
                    DB::commit();

                    return response()->json([
                        'message' => 'Save Successfully!',
                        'slug' => $data['slug'],
                    ], 201);
                }
                $res = ($type === 'update') ? $content : $store;
                DB::commit();

                return $this->responseReturn($type, $res);
            } catch (Exception $ex) {
                DB::rollBack();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], status: 422);
            }
        }
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $slug)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }

        $content = Content::with('contentFiles')->where('slug', $slug)->firstOrFail();

        return $content;
    }

    /**
     * Edit document
     *
     * @return void
     */
    public function edit($slug)
    {
        $content = Content::with('contentFiles')->where('slug', $slug);
        return view('layouts.backend_app');
    }

    /**
     * Update content
     *
     * @param [type] $data
     * @param [type] $content
     * @param [type] $delete
     * @return Json
     */
    public function update($data, $content, $delete)
    {
        DB::beginTransaction();
        try {
            $contentFiles = array_key_exists('content_files', $data) ? $data['content_files'] : [];
            $image = $data['image_base64'];

            if (!is_base64($image)) {
                $data['image'] = $content->image;
            } else {
                $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                $data['image'] = cloudflare(file: $image, folder: 'content', resizeSize: $resizeValue, base64: true);
                @$delete->arrayImages($content->image);
            }
            $content->fill($data)->save();

            $contentFileIds = [];
            $extraUpdate = false;
            foreach ($contentFiles as $fileData) {
                $oldContentFile = ContentFile::where('content_id', $content->id)->where('id', $fileData['id'])->first();

                if ($oldContentFile) {
                    $contentFileIds[] = $oldContentFile->id;
                    $dataFile = [
                        'title' => $fileData['title'],
                    ];

                    $file = @$fileData['file'];
                    if ($file) {
                        $filePath = $this->upload($file, 'content-files');
                        @$delete->arrayImages([$oldContentFile->file]);
                        $dataFile['file'] = $filePath;
                    }

                    $oldContentFile->fill($dataFile)->save();
                    // extra update status
                    if ($extraUpdate == false) {
                        $extraUpdate = $oldContentFile->wasChanged();
                    }
                } else if (!empty($fileData['title']) && !empty($fileData['file'])) {
                    $file = $fileData['file'];
                    $filePath = $this->upload($file, 'content-files');
                    $dataFile = [
                        'title' => $fileData['title'],
                        'file' => $filePath,
                        'content_id' => $content->id,
                    ];
                    $newContentFile = $content->contentFiles()->create($dataFile);
                    // extra update status
                    $extraUpdate = true;
                    $contentFileIds[] = $newContentFile->id;
                }
            }

            $deselectedContentFiles = ContentFile::where('content_id', $content->id)->whereNotIn('id', $contentFileIds)->get();
            foreach ($deselectedContentFiles as $deselectedContentFile) {
                @$delete->arrayImages([$deselectedContentFile->file]);
                $deselectedContentFile->delete();
                $extraUpdate = true;
            }

            DB::commit();
            return $this->responseReturn(null, $content->wasChanged(), $data['slug'], $extraUpdate);
        } catch (\Throwable $th) {
            DB::rollBack();

            return response()->json(['exception' => $th->getMessage()], 422);
        }
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request, DeleteAction $delete)
    {
        $isFile = $request->file;
        if ($isFile == true || $isFile == 'true') {
            $contentFile = ContentFile::where('id', $id)->first();
            $old = $contentFile->file;

            if (Storage::disk('public')->exists($old)) {
                Storage::delete($old);
            }
            $contentFile->delete();
            return $this->responseReturn('delete', $contentFile);
        }

        $content = Content::where('id', $id)->first();

        if (!empty($content)) {
            $contentFiles = ContentFile::where('content_id', $content->id)->get();

            foreach ($contentFiles ?? [] as $contentFile) {
                $old = $this->oldFile($contentFile->file);
                if (Storage::disk('public')->exists($old)) {
                    Storage::delete($old);
                }
            }
            $files = ContentFile::where('content_id', $content->id)->delete();
            $slug = $content->slug;
            $menu = Menu::where('params', $content->slug)->delete();
            @$delete->arrayImages($content->image);
            $content = $content->delete();
            return $this->responseReturn('delete', $content);
        } else {
            return response()->json(['message' => 'Delete Unsuccessful!'], 200);
        }
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request)
    {
        // dd($request->all());
        return $request->validate([
            'title' => 'required',
            'image_base64' => ['nullable', 'string', new Base64Image()],
            'content_files.*.file' => ['nullable', File::types(['doc', 'docx', 'pdf', 'xls', 'xlsx', 'ppt', 'pptx'])->max(1024 * 5)],
        ]);
    }

    /**
     * Generate slug for content
     *
     * @param [type] $title
     * @return string
     */
    public function generateSlug($title)
    {
        $slug = Str::slug($title);
        $count = Content::where(['slug' => $slug])->count();
        if ($count > 0) {
            $slug = $slug . '-' . $count;
        }
        return $slug;
    }

    /**
     * Generate menu for content
     *
     * @param [type] $slug
     * @param [type] $title
     * @return array
     */
    public function generateMenu($slug, $title)
    {
        $lastMenu = Menu::orderBy('sorting', 'desc')->first();
        $sorting = $lastMenu ? ($lastMenu->sorting + 1) : 1;

        return Menu::create([
            'parent_id' => 5,
            'params' => $slug,
            'menu_name' => $title,
            'route_name' => 'content.edit',
            'sorting' => $sorting,
            'icon' => "<i class='fa fa-list text-aqua'></i>",
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */

    public function storeFile(Request $request, Content $content)
    {
        if ($this->validateCheck($request)) {
            $files = $request->file('content_files');
            foreach ($files as $fileData) {
                $file = $fileData['file'];
                $filePath = $this->upload($file, 'content-files');
                $data = [
                    'title' => $fileData['title'],
                    'file' => $filePath,
                ];
                $content->contentFiles()->create($data);
            }
            return response()->json(['message' => 'Create Successfully!'], 200);
        }
    }
}
