<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Testimonial;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use Illuminate\Support\Facades\Storage;
use App\Action\Util\DeleteAction;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;


class TestimonialController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query  = Testimonial::latest();
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
                $data['slug'] = Testimonial::createSlug($data['name']);

                // push the insert text
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '90x90,30x30';
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: $resizeValue, base64: true);
                }
                $res = Testimonial::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /*
     * Display the specified resource.
     *
     * @param  \App\Models\Testimonial  $testimonial
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $testimonial = Testimonial::find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $testimonial;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Testimonial  $testimonial
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
     * @param  \App\Models\Testimonial  $testimonial
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id, DeleteAction $delete)
    {
        $testimonial = Testimonial::find($id);

        if ($this->validateCheck($request, $testimonial->id)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;
                if ($data['name'] !== $testimonial->name) {
                    $data['slug'] = Testimonial::createSlug($data['name']);
                }
                // push the update text
                if (!empty($image) && is_base64($image)) {
                    @$delete->arrayImages($testimonial->image);
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: '90x90,30x30', base64: true);
                }
                $testimonial->fill($data)->save();

                return $this->responseReturn("update", $testimonial);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Testimonial  $testimonial
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $testimonial = Testimonial::find($id);
        // delete
        app("deleteAction")->arrayImages($testimonial->image);
        $old = $this->oldFile($testimonial->image);
        if (Storage::disk("public")->exists($old)) {
            Storage::delete($old);
        }


        $res = $testimonial->delete();
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
