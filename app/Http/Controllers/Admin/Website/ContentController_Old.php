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
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ContentController extends BaseController
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Content::with('contentFiles')->latest();
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
        if ($request->slug !== '' && $request->slug !== 'undefined' && $request->slug !== null) {
            $content = Content::where('slug', $request->slug)->first();
            if (empty($request->slug)) {
                return response()->json(['error' => 'Slug is Missing!'], 200);
            }
        }
        try {
            if (!empty($content)) {
                return (new ContentController())->update($data, $content, $delete);
            } else {
                if (!empty($image)) {
                    $data['image'] = cloudflare(file: $image, folder: 'content', resizeSize: '600x600,200x200', base64: true);
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
                return response()->json([
                    'message' => 'Save Successfully!',
                    'slug' => $data['slug'],
                ], 201);
            }
            $res = ($type === 'update') ? $content : $store;
            return $this->responseReturn($type, $res);
        } catch (Exception $ex) {
            return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
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
        $content_files = $data['content_files'];
        $content_data = Content::with('contentFiles')->where('slug', $data['slug'])->get();

        if (empty($image)) {
            $data['image'] = null;
        }
        if (!empty($image)) {
            if (!is_base64($image)) {
                $data['image'] = $content->image;
            } else {
                $data['image'] = cloudflare(file: $image, folder: 'content', resizeSize: '600x600,200x200', base64: true);
            }
        }
        @$delete->arrayImages($content->image);
        $data['slug'] = (new ContentController())->generateSlug($data['title']);
        // $oldMenu = Menu::where('params', $content->slug)->delete();
        $update = $content->fill($data)->save();


        // $menu = (new ContentController())->generateMenu(slug: $data['slug'], title: $data['title']);
        return $this->responseReturn(null, $content->wasChanged(), $data['slug']);
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

        // It was only meant to be delete the file not the model.
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
        return $request->validate([
            'title' => 'required',
            // 'file' => 'required',
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

    /* public function storeFile(Request $request, Content $content)
    {
    if ($this->validateCheck($request)) {
    $data = $request->all();
    $file = $request->file('file');
    if (!empty($file)) {
    $data['file'] = $this->upload($file, 'content-file');
    }

    $content->contentFiles()->create($data);

    return response()->json(['message' => 'Create Successfully!'], 200);
    }
    } */

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
