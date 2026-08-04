<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Project;
use Illuminate\Http\Request;
use App\Http\Resources\Resource;
use App\Models\Category;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Base\BaseController;
use Illuminate\Support\Facades\Storage;
use App\Action\Util\DeleteAction;
use App\Models\Client;
use App\Models\Testimonial;

class ProjectController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function getcategory()
    {
        $data = Category::active()->orderBy('sorting', 'desc')->where('module_name', 'Project')->get();
        return response()->json($data);
    }

    // public function getclient()
    // {
    //     $data = Client::active()->orderBy('sorting', 'asc')->get();
    //     return response()->json($data);
    // }


    public function index(Request $request)
    {
        $query = Project::with('category')->latest();

        $query->whereLike($request->field_name, $request->website);
        $query->whereAny('status', $request->status);
        $query->whereAny('category_id', $request->category_id);

        // Start Date Range Filter
        if (!empty($request->start_from_date) && !empty($request->start_to_date)) {
            $startFrom = vue_to_server_date($request->start_from_date);
            $startTo = vue_to_server_date($request->start_to_date);

            $query->whereBetween('start_date', [$startFrom, $startTo]);
        }

        // End Date Range Filter
        if (!empty($request->end_from_date) && !empty($request->end_to_date)) {
            $endFrom = vue_to_server_date($request->end_from_date);
            $endTo = vue_to_server_date($request->end_to_date);

            $query->whereBetween('end_date', [$endFrom, $endTo]);
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
            try {
                $data = $request->all();
                $image = $request->image_base64;

                $data['slug'] = Project::createSlug($data['title']);

                // push the insert text
                if (!empty($image)) {
                    $resizeValue = $data['image_resize_value'] ?? '856x526,416x256';
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: $resizeValue, base64: true);
                }
                $res = Project::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $project = Project::find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $project;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Project  $project
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
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id, DeleteAction $delete)
    {

        $project = Project::find($id);
        if ($this->validateCheck($request, $project->id)) {
            try {
                $data = $request->all();
                $image = $request->image_base64;

                if ($data['title'] !== $project->title) {
                    $data['slug'] = Project::createSlug($data['title']);
                }
                // push the update text
                if (!empty($image) && is_base64($image)) {
                    @$delete->arrayImages($project->image);
                    $data['image'] = cloudflare(file: $image, folder: 'image', resizeSize: '856x526,416x256', base64: true);
                }
                $project->fill($data)->save();
                return $this->responseReturn("update", $project);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $project = Project::find($id);
        // delete
        app("deleteAction")->arrayImages($project->image);
        $old = $this->oldFile($project->image);
        if (Storage::disk("public")->exists($old)) {
            Storage::delete($old);
        }


        $res = $project->delete();
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
            'image' => 'mimes:png,jeg,JPEG|max:10240',
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
