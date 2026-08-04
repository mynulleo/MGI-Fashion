<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin\Website;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Website\Notice;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\File;

class NoticeController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Notice::with(['category:id,title'])->select('id', 'category_id', 'title', 'notice_date', 'notice_end', 'file', 'sorting', 'status')->latest();
        $query->whereLike($request->field_name, $request->value);
        $query->whereAny('status', $request->status);

        if (! empty($request->type)) {
            $query->whereAny('type', $request->type);
        }

        // Notice date wise search.
        $startDate = $request->from_date;
        $endDate = $request->to_date;

        if (! empty($startDate) || ! empty($endDate)) {
            $startDate = $request->from_date ?? '1900-01-01';
            $endDate = $request->to_date ?? $startDate;

            $startDate = vue_to_server_date($startDate);
            $endDate = vue_to_server_date($endDate);

            $query->whereBetween('notice_date', [$startDate, $endDate]);
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
                // push the insert text
                if (! empty($request->file('file'))) {
                    $data['file'] = $this->upload($request->file, 'notice');
                }

                $res = Notice::create($data);

                return $this->responseReturn('create', $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }

        return Notice::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Models\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($this->validateCheck($request, $id)) {
            $notice = Notice::findOrFail($id);
            try {
                $data = $request->all();
                // push the update text
                if ($data['type'] == 'file' && !empty($request->file('file'))) {
                    $data['file'] = $this->upload($request->file, 'notice');
                    $oldFile = $this->oldFile($notice->file);
                    Storage::delete($oldFile);
                }

                if ($data['type'] != 'file') {
                    if ($notice->file) {
                        $oldFile = $this->oldFile($notice->file);
                        Storage::delete($oldFile);
                    }
                    $data['file'] = null;
                }

                $notice->fill($data)->save();

                return $this->responseReturn('update', $notice);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Notice  $notice
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $notice = Notice::find($id);

        if (! empty($notice->file)) {
            $old = $this->oldFile($notice->file);

            if (Storage::disk('public')->exists($old)) {
                Storage::delete($notice->file); // God knows, Why it is doesn't work.
            }

            $filePath = Storage::disk('public')->path($old);

            if (file_exists($filePath)) {
                unlink($filePath);
            }
        }

        $res = $notice->delete();

        return $this->responseReturn('delete', $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return $request->validate([
            'type' => 'required|max:191',
            'title' => 'required|max:191',
            'notice_date' => 'required',
            'status' => 'required',
            'file' => ['nullable', Rule::requiredIf($request->type == 'file' && empty($id)), File::types(['doc', 'docx', 'pdf', 'xls', 'xlsx', 'ppt', 'pptx'])->max(1024 * 10)],
            'description' => 'max:2000',
        ], []);
    }
}
