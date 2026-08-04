<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Rules\Base64Image;
use App\Models\PageSection;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Base\BaseController;

class PageSectionController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = PageSection::with(['page:id,title'])->select('id', 'image', 'sorting', 'status', 'title', 'page_id')->latest();

        $query->whereLike($request->field_name, $request->value);
        $query->whereAny('status', $request->status);
        if ($request->filled('page_id')) {
            $query->where('page_id', $request->page_id);
        }
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
    public function create()
    {
        return view('layouts.backend_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();
                if ($data['type'] === 'video') {
                    unset($data['url'], $data['description']);
                } elseif ($data['type'] === 'url') {
                    unset($data['video_url'], $data['description']);
                } elseif ($data['type'] === 'description') {
                    unset($data['video_url'], $data['url']);
                }

                $image = $request->image_base64;
                /* if (!empty($request->file("icon"))) {
                    $data["icon"] = $this->upload($request->icon, "pageSection");
                } */
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'pageSection', resizeSize: $resizeValue, base64: true);
                }
                $res = PageSection::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PageSection  $pageSection
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $pageSection = PageSection::with('page')->find($id);
        // dd($pageSection);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $pageSection;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PageSection  $pageSection
     * @return \Illuminate\Http\Response
     */
    public function edit(PageSection $pageSection)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PageSection  $pageSection
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PageSection $pageSection)
    {
        if ($this->validateCheck($request, $pageSection->id)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;
                /* if ($request->hasFile("icon")) {
                    $oldFile = $this->oldFile($pageSection->icon);
                    Storage::delete($oldFile);
                    $data["icon"] = $this->upload($request->icon, "pageSection");
                } else {
                    unset($data['icon']);
                } */
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'pageSection', resizeSize: $resizeValue, base64: true);
                }
                if ($data['type'] === 'video') {
                    $data['url'] = '';
                    $data['description'] = '';
                } elseif ($data['type'] === 'url') {
                    $data['video_url'] = '';
                    $data['description'] = '';
                } elseif ($data['type'] === 'description') {
                    $data['video_url'] = '';
                    $data['url'] = '';
                }

                $pageSection->update($data);
                return $this->responseReturn("update", $pageSection);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PageSection  $pageSection
     * @return \Illuminate\Http\Response
     */
    public function destroy(PageSection $pageSection)
    {
        $res = $pageSection->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return $request->validate(
            [
                'image_base64' => ['required', 'string', new Base64Image()],
            ],
            [
                //ex: 'name' => "This name is required" (custom message)
            ]
        );
    }
}
