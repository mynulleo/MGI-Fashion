<?php

namespace App\Http\Controllers\Admin\Website\Gallery;

use Exception;
use App\Rules\Base64Image;
use Illuminate\Http\Request;
use App\Models\SliderDetails;
use App\Action\Util\DeleteAction;
use Illuminate\Support\Facades\Cache;
use App\Models\Website\Gallery\Slider;
use App\Http\Controllers\Base\BaseController;

class SliderDetailsController extends BaseController
{
    /**
     * Create page of slider details
     *
     * @return bool
     */
    public function create()
    {
        return true;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                Cache::forget('website_cache');
                $slider = Slider::where('id', $request->slider_id)->firstOrFail();

                if (! empty($slider)) {
                    $count = SliderDetails::where('slider_id', $slider->id)->count();

                    if ($slider->max_image <= $count) {
                        return response()->json([
                            'message' => 'Sorry, The maximum number of images for this slider has been reached.',
                        ], 203);
                    }
                }

                $path = 'slider/'.$slider->slug;
                $data = $request->all();
                $image = $request->original_image;
                $sizes = '200x200,'.$slider->height.'x'.$slider->width;

                if (! empty($image)) {
                    $data['image'] = cloudflare(file: $image, folder: $path, resizeSize: $sizes, base64: true);
                }

                $res = SliderDetails::create($data);

                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id, DeleteAction $delete)
    {
        if ($this->validateCheck($request)) {
            try {
                Cache::forget('website_cache');
                $sliderDetails = SliderDetails::where('id', $id)->firstOrFail();
                $data = $request->all();
                $image = $request->original_image;

                $slider = Slider::where('id', $request->slider_id)->firstOrFail();
                $path = 'slider/'.$slider->slug;

                $slider = Slider::where('id', $sliderDetails->slider_id)->first();
                $sizes = '600x600,200x200'.$slider->height.'x'.$slider->width;

                if (! empty($image) && is_base64($image)) {
                    @$delete->arrayImages($sliderDetails->image);
                    $data['image'] = cloudflare(file: $image, folder: $path, resizeSize: '600x600,200x200', base64: true);
                } else {
                    $data['image'] = $sliderDetails->image;
                }

                $sliderDetails->update($data);

                return $this->responseReturn('update', $sliderDetails);
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

        $details = SliderDetails::query()
            ->where('id', $id)
            ->firstOrFail();
        return $details;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, DeleteAction $delete)
    {
        // dd($id);
        $details = SliderDetails::where('id', $id)->first();

        @$delete->arrayImages($details->image);

        $res = $details->delete();

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
            'original_image' => ['required', 'string', new Base64Image()],
            'status' => 'required',
            'sorting' => 'required',
            'button_name' => 'max:200',
        ]);
    }

    /**
     * Get slider height and width
     *
     * @param [type] $id
     * @return array
     */
    public function heightWidth($id)
    {
        $slider = Slider::query()
            ->where('id', $id)
            ->FirstOrFail();

        return [
            'height' => $slider->height,
            'width' => $slider->width,
        ];
    }
}
