<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin\Website\Gallery;

use Exception;
use App\Rules\Base64Image;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Action\Util\DeleteAction;
use App\Models\Website\Gallery\Album;
use App\Models\Website\Gallery\Photo;
use App\Models\Website\Gallery\Video;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Base\BaseController;

class AlbumController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Album::query()->withCount(['photos', 'videos'])->select('id', 'name', 'image', 'type', 'status')->latest();
        if ($request->filled('field_name') && $request->filled('value')) {
            $query->whereLike($request->field_name, $request->value);
        }
        if ($request->filled('status')) {
            $query->whereAny('status', $request->status);
        }
        if ($request->filled('type')) {
            $query->whereAny('type', $request->type);
        }
        if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination ?? 8);
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
        $data = $request->all();
        $image = $request->image_base64;
        if ($this->validateCheck($request)) {
            try {
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '600x600,340x340,242x242,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'album', resizeSize: $resizeValue, base64: true);
                }

                $res = Album::create($data);

                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $album = Album::withCount(['photos', 'videos'])->find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        if ($request->view != null) {
            return Photo::where('album_id', $album->id)->get();
        }

        if ($album->type == Album::PHOTOS) {
            $album->load('photos');
            $album->total_photos = $album->photos->count();
        } else {
            $album->load('videos');
        }

        return $album;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function edit($album)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Model\Album  $album
     * @return \Illuminate\Http\Response
     */
    /* public function update(Request $request, Album $album, DeleteAction $delete)
    {
    $data = $request->all();
    $image = $request->image_base64;

    try {
    if (!empty($image) && is_base64($image)) {
    @$delete->arrayImages($album->image);
    $resizeValue = $data['image_resize_value'] ?? '600x600,340x340,242x242,50x50';
    $data['image'] = cloudflare(file: $image, folder: 'album', resizeSize: $resizeValue, base64: true);
    } else {
    $data['image'] = $album->image;
    }

    $album->update($data);

    return $this->responseReturn('update', $album);
    } catch (Exception $ex) {
    return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
    }
    } */

    public function update(Request $request, Album $album, DeleteAction $delete)
    {
        $data = $request->all();
        $image = $request->image_base64;
        if ($this->validateCheck($request)) {
            try {
                if (!empty($image) && is_base64($image)) {
                    @$delete->arrayImages($album->image);
                    $resizeValue = $data['image_resize_value'] ?? '600x600,340x340,242x242,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'album', resizeSize: $resizeValue, base64: true);
                } else {
                    $data['image'] = $album->image;
                }
                if ($data['name'] !== $album->name) {
                    $data['slug'] = Album::createSlug($data['name']);
                }
                $album->update($data);

                return $this->responseReturn('update', $album);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Album  $album
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, DeleteAction $delete)
    {
        $album = Album::where('id', $id)->firstOrFail();
        @$delete->arrayImages($album->image);

        if ($album->type === 'Videos') {

            $videos = Video::where('album_id', $album->id)->get();

            foreach ($videos as $video) {
                @$delete->arrayImages($video->thumbnail);
            }

            $delete = Video::where('album_id', $album->id)->delete();
        } else {
            $photos = Photo::where('album_id', $album->id)->get();
            foreach ($photos as $key => $photo) {
                foreach ($photo->images as $key1 => $value) {
                    $old = $this->oldFile($value);
                    if (Storage::disk('public')->exists($old)) {
                        Storage::delete($old);
                    }
                }
            }
            Photo::where('album_id', $album->id)->delete();
        }

        $res = $album->delete();

        return $this->responseReturn('delete', $res);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function album($type)
    {
        return Album::oldest('sorting')
            ->where('type', $type)
            ->where('status', 'active')
            ->get(['name', 'id']);
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
            'name' => 'required|max:200',
            'image_base64' => ['required', 'string', new Base64Image()],

        ]);
    }
}
