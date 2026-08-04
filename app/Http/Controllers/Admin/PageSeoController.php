<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\PageSeo;
use App\Rules\Base64Image;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Base\BaseController;

class PageSeoController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = PageSeo::with(['page:id,title'])->select('id', 'page_id', 'image', 'meta_description', 'status', 'sorting')->latest();
        $query->whereLike($request->field_name, $request->value);
        if ($request->filled('status')) {
            $query->whereAny('status', $request->status);
        }
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
            DB::beginTransaction();
            try {
                $data = $request->all();

                $image = $request->image_base64;

                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'pageSeo', resizeSize: $resizeValue, base64: true);
                }
                $res = PageSeo::create($data);
                DB::commit();
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                DB::rollBack();

                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PageSeo  $pageSeo
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $pageSeo = PageSeo::with('page')->find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $pageSeo;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PageSeo  $pageSeo
     * @return \Illuminate\Http\Response
     */
    public function edit(PageSeo $pageSeo)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PageSeo  $pageSeo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $pageSeo = PageSeo::find($id);
        if ($this->validateCheck($request, $pageSeo->id)) {
            try {
                $data = $request->all();

                $image = $request->image_base64;
                if (!empty($image) && is_base64($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'pageSeo', resizeSize: $resizeValue, base64: true);
                    $oldFile = $this->oldFile($pageSeo->image);
                    Storage::delete($oldFile);
                } else {
                    unset($data['image_base64']);
                }

                $pageSeo->fill($data)->save();
                return $this->responseReturn("update", $pageSeo);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PageSeo  $pageSeo
     * @return \Illuminate\Http\Response
     */
    public function destroy(PageSeo $pageSeo)
    {
        $res = $pageSeo->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return $request->validate([
            'image_base64' => ['required', 'string', new Base64Image()],
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
