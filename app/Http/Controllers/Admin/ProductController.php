<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Models\Category;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;
use Illuminate\Support\Facades\Storage;
use App\Action\Util\DeleteAction;

class ProductController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function getcategory()
    {
        $data = Category::active()->orderBy('sorting', 'desc')->whereIn('module_name', ['Product'])->get();
        return response()->json($data);
    }

    public function index(Request $request)
    {
        $query = Product::with('category')->latest();

        $query->whereLike($request->field_name, $request->website);
        $query->whereAny('status', $request->status);
        $query->whereAny('category_id', $request->category_id);


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

                $data['slug'] = Product::createSlug($data['title']);

                // push the insert text
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '856x526,416x256';
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: $resizeValue, base64: true);
                }
                $res = Product::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $product = Product::find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $product;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id, DeleteAction $delete)
    {
        $product = Product::find($id);
        if ($this->validateCheck($request, $product->id)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;

                if ($data['title'] !== $product->title) {
                    $data['slug'] = Product::createSlug($data['title']);
                }
                // push the update text
                if (!empty($image) && is_base64($image)) {
                    @$delete->arrayImages($product->image);
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: '856x526,416x256', base64: true);
                }
                $product->fill($data)->save();
                return $this->responseReturn("update", $product);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        // delete
        app("deleteAction")->arrayImages($product->image);
        $old = $this->oldFile($product->image);
        if (Storage::disk("public")->exists($old)) {
            Storage::delete($old);
        }

        $res = $product->delete();
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
    }
}
