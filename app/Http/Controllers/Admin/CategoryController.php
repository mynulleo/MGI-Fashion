<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Category;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Storage;

class CategoryController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Category::select('id', 'module_name', 'title', 'sorting', 'status')->latest();
        $query->whereLike($request->field_name, $request->value);
        $query->whereAny('status', $request->status);

        if ($request->allData) {
            if (!empty($request->module_name)) {
                $query->where('module_name', $request->module_name);
            }

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
        if ($this->validateCheck($request)) { // Validation check passed
            try {
                $data = $request->all();
                if (empty($data['slug']) && !empty($data['title'])) {
                    $data['slug'] = Category::createSlug($data['title']);
                }
                $res = Category::create($data);
                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Category $category)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }

        return $category;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        if ($this->validateCheck($request, $category->id)) {
            try {
                $data = $request->all();
                if (empty($data['slug']) && !empty($data['title'])) {
                    $data['slug'] = Category::createSlug($data['title'], $category->id);
                }
                $category->fill($data)->save();

                return $this->responseReturn('update', $category);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $res = $category->delete();

        return $this->responseReturn('delete', $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    /*  */
    public function validateCheck($request, $id = null)
    {
        return $request->validate([
            'title' => [
                'required',
                'max:191',
                // take unique value for category
                Rule::unique('categories')->where(function ($query) use ($request, $id) {
                    $query->where('module_name', $request->module_name);
                    if ($id) {
                        $query->where('id', '!=', $id);
                    }
                }),
            ],
            'module_name' => 'required|max:191',
            'status' => 'required',
        ]);
    }

    /**
     * Get all the list of category
     *
     * @return array
     */
    public function getCategory($type)
    {
        $categories = Category::where('module_name', $type)
            ->where('status', 'active')
            ->get();

        return $categories;
    }
}
