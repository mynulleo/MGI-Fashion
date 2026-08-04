<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin\Website\Gallery;

use App\Action\Util\DeleteAction;
use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Website\Gallery\Album;
use App\Models\Website\Gallery\Photo;
use App\Traits\ResizeTrait;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;

class PhotoController extends BaseController
{
    use ResizeTrait;

    protected $resizeArr = [
        ['width' => 50, 'height' => 50],
        ['width' => 300, 'height' => 300],
        ['width' => 600, 'height' => 600],
    ];

    protected $resize_type = 'perfect';

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Photo::with(['album:id,name'])->select('id', 'images', 'title', 'album_id', 'sorting', 'status', 'created_at')
            ->latest()
            ->whereHas('album', function ($query) use ($request) {
                $query->whereLike($request->field_name, $request->value);
            })->oldest('sorting');
        if ($request->field_name !== 'album_name') {
            $query->whereLike($request->field_name, $request->value);
        }

        $query->whereLike($request->field_name, $request->value);
        $query->whereAny('status', $request->status);

        if (!empty($request->album_id)) {
            $query->whereAny('album_id', $request->album_id);
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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Cache::forget('website_cache');
        if ($this->validateCheck($request)) {
            try {
                $data = $this->uploadImages($request);

                if (!empty($data['errors'])) {
                    return response()->json(['exception' => $data['errors']], 422);
                }

                $res = Photo::insert($data);

                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    private function uploadImages($request)
    {
        $info = $request->uploaded_images;
        $files = $request->file('files');
        $data = [];
        $album = Album::find($request->album_id);
        foreach ($files ?? [] as $key => $file) {
            // $upload = json_encode(cloudflare(file: $file, folder: 'photos', resizeSize: '600x600,300x300,50x50', base64: true));
            $upload = $this->resizer($file, ['photos'], false, resize: true);
            if (!empty($upload['errors'])) {
                return $upload;
            }
            // dd($upload);
            if (!empty($upload)) {
                $arr = [
                    'status' => $info[$key]['status'] ?? 'deactive',
                    'sorting' => $info[$key]['sorting'] ?? 0,
                    'title' => $info[$key]['title'] ?? null,
                    'album_id' => $request->album_id,
                    'images' => json_encode($upload),
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ];
                array_push($data, $arr);
            }
        }
        return $data;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Photo $photo)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }

        $photo->load('album');

        return $photo;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function edit(Photo $photo)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DeleteAction $deleteAction, Photo $photo)
    {
        Cache::forget('website_cache');
        $data = $request->all();
        $file = $request->file('thumb');

        try {
            if (!empty($file)) {
                // $album = Album::find($request->album_id);
                // $upload = $this->resizer($file, ['photos', $album->name], false, true);
                $upload = $this->resizer($file, ['photos'], false, resize: true);
                $data['images'] = json_encode($upload);
                @$deleteAction->arrayImages($photo->images);
            } else {
                $data['images'] = json_encode($photo->images);
            }

            $photo->update($data);

            return $this->responseReturn('update', $photo);
        } catch (Exception $ex) {
            return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Photo $photo)
    {
        Cache::forget('website_cache');

        foreach ($photo->images as $key => $file) {
            if (Storage::disk('public')->exists($file)) {
                Storage::delete($file);
            }
        }

        $res = $photo->delete();

        return $this->responseReturn('delete', $res);
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
            'uploaded_images' => 'required',
            'album_id' => 'required|integer',
            'files' => 'required',
            'files.*' => 'file|mimes:jpeg,png,jpg,gif|max:10240',
        ]);
    }
}
