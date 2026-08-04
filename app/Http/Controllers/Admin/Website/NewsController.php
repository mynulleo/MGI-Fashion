<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin\Website;

use App\Action\Util\DeleteAction;
use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Website\News;
use App\Rules\Base64Image;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class NewsController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = News::with(['category:id,title'])->select('id', 'title', 'category_id', 'date', 'created_at', 'image', 'sorting', 'status')->latest();
        $query->whereLike($request->field_name, $request->value);
        $query->whereAny('status', $request->status);

        // News date wise search.
        $startDate = $request->from_date;
        $endDate = $request->to_date;

        if (!empty($startDate) || !empty($endDate)) {
            $startDate = $request->from_date ?? '1900-01-01';
            $endDate = $request->to_date ?? $startDate;

            $startDate = vue_to_server_date($startDate);
            $endDate = vue_to_server_date($endDate);

            $query->whereBetween('date', [$startDate, $endDate]);
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

        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;

                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '856x526,416x256,110x67';
                    $data['image'] = cloudflare(file: $image, folder: 'news', resizeSize: $resizeValue, base64: true);
                }
                $res = News::create($data);

                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\News  $news
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return News::with('category')->find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\News  $news
     * @return \Illuminate\Http\Response
     */
    public function edit($news)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Models\News  $news
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, News $news, DeleteAction $delete)
    {
        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;

                if (!empty($image) && is_base64($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '856x526,416x256,110x67';
                    @$delete->arrayImages($news->image);
                    $data['image'] = cloudflare(file: $image, folder: 'news', resizeSize: $resizeValue, base64: true);
                } else {
                    $data['image'] = $news->image;
                }
                $news->update($data);

                return $this->responseReturn('update', $news);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\News  $news
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, DeleteAction $delete)
    {
        $news = News::where('id', $id)->firstOrFail();

        @$delete->arrayImages($news->image);
        $res = $news->delete();

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
            'sorting' => 'required',
            'status' => 'required',
            'date' => 'required',
            'image_base64' => ['required', 'string', new Base64Image()],
            'image_resize_value' => ['nullable', 'string'],
            'title' => 'required|max:200',

        ]);
    }
}
