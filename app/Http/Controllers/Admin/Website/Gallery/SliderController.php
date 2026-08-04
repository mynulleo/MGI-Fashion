<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin\Website\Gallery;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\SliderDetails;
use App\Models\Website\Gallery\Slider;
use App\Support\Collection\Pagination;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;

class SliderController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Slider::with(['details:slider_id'])->select('id', 'title', 'position', 'height', 'width', 'status', 'sorting', 'max_image', 'created_at')->latest();
        if ($request->filled('field_name') && $request->filled('value')) {
            $query->whereLike($request->field_name, $request->value);
        }
        if ($request->filled('status')) {
            $query->whereAny('status', $request->status);
        }
        $sliders = $query->get()->each(function ($data) {
            $count = SliderDetails::where('slider_id', $data->id)->count();
            $data->max_image = $count . '/' . $data->max_image;
        });
        if ($request->allData) {
            return $query->get();
        } else {
            $datas = Pagination::paginate($sliders, $request->pagination ?? 10);
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
            $data = $request->all();
            try {
                $res = Slider::create($data);

                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }

        $slider = Slider::query()
            ->with('details')
            ->where('id', $id)
            ->first();

        return $slider;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $slug)
    {
        Cache::forget('website_cache');

        try {
            $slider = Slider::where('slug', $slug)->first();
            $data = $request->except('details');
            unset($data['created_at']);
            unset($data['updated_at']);
            // dd($data);
            $slider->update($data);

            return $this->responseReturn('update', $slider);
        } catch (Exception $ex) {
            return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        Cache::forget('website_cache');

        //$sliderDetails = SliderDetails::where('id', $slider->id)->first();

        // File::deleteDirectory(base_path('storage/app/public/upload/slider/' . $slider->slug));

        // $sliderDetails->delete();

        $sliderDetails = SliderDetails::where('slider_id', $slider->id)->delete();

        $res = $slider->delete();

        return $this->responseReturn('delete', $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request)
    {
        return $request->validate([
            'title' => 'required|max:200',
            'position' => 'required',
            'height' => 'required|numeric',
            'width' => 'required|numeric',
            'status' => 'required',
            'sorting' => 'required',
        ]);
    }
}
