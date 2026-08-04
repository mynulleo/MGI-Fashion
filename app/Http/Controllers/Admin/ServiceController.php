<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Service;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Action\Util\DeleteAction;
use App\Http\Controllers\Base\BaseController;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Artisan;
use App\Rules\Base64Image;



class ServiceController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query  = Service::latest();
        // dd($query);
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
                $image = $request->image_base64;
                $image_small = $request->image_small_base64;
                // dd($image_small);
                $data['slug'] = Service::createSlug($data['title']);

                // push the insert text
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '1076x541,600x302';
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: $resizeValue, base64: true);
                }
                if (!empty($image_small)) {
                    $resizeValue = $data['image_small_resize_value'] ?? '52x52,40x40';
                    $data['image_small'] = cloudflare(file: $image_small, folder: 'image_small', resizeSize: $resizeValue, base64: true);
                }
                // dd($data);

                $res = Service::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $service = Service::find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $service;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id, DeleteAction $delete)
    {
        $service = Service::find($id);
        if ($this->validateCheck($request, $service->id)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;
                $image_small = $request->image_small_base64;

                if ($data['title'] !== $service->title) {
                    $data['slug'] = Service::createSlug($data['title']);
                }
                // push the update text
                if (!empty($image) && is_base64($image)) {
                    @$delete->arrayImages($service->image);
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: '1076x541,600x302', base64: true);
                }
                if (!empty($image_small) && is_base64($image_small)) {
                    @$delete->arrayImages($service->image_small);
                    $data['image_small'] = cloudflare(file: $image_small, folder: 'image_small', resizeSize: '52x52,40x40', base64: true);
                }

                $service->fill($data)->save();

                return $this->responseReturn("update", $service);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $service = Service::find($id);
        // delete
        app("deleteAction")->arrayImages($service->image);
        $old = $this->oldFile($service->image);
        if (Storage::disk("public")->exists($old)) {
            Storage::delete($old);
        }


        $res = $service->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return true;
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
