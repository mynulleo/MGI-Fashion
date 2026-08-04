<?php

/**
 * @Quill Information Technology
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Theme;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Http\Resources\Resource;
use Illuminate\Validation\Rules\File;
use App\Http\Controllers\Base\BaseController;
use App\Services\ThemeService;

class ThemeController extends BaseController
{

    public function __construct(public ThemeService $themeService) {}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query  = Theme::latest();
        $query->whereLike($request->field_name, $request->value);

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
        try {
            $validated = $this->validateCheck($request);
            $validated['slug'] = Str::slug($validated['title']);
            $this->themeService->extractTheme($validated['theme'], $validated['slug']);

            unset($validated['theme']);

            // push the insert text
            $theme = Theme::create($validated);

            if ($theme->status == 'active') {
                $this->themeService->activeTheme($theme->slug, $theme->id);
            }

            return $this->responseReturn("create", $theme);
        } catch (Exception $ex) {
            return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Theme  $theme
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Theme $theme)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $theme;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Theme  $theme
     * @return \Illuminate\Http\Response
     */
    public function edit(Theme $theme)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Theme  $theme
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Theme $theme)
    {
        try {
            $validated = $this->validateCheck($request, $theme->id);
            if (@$validated['theme']) {
                $this->themeService->extractTheme($validated['theme'], $theme->slug);
            }

            // push the update text
            $theme->fill(['status' => $validated['status']])->save();

            if ($theme->status == 'active') {
                $this->themeService->activeTheme($theme->slug, $theme->id);
            } else if (Theme::where('status', 'active')->count() == 0) {
                $this->themeService->activeTheme();
            }

            return $this->responseReturn("update", $theme);
        } catch (Exception $ex) {
            return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
        }
    }

    public function syncActiveTheme(Request $request)
    {
        $this->themeService->syncTheme();

        $message = 'Successfully sync active theme. Please, build your assets. Thank you!';

        if ($request->format() == 'html') {
            session()->flash('successMessage', $message);
            return back();
        }

        return response()->json(['message' => $message]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Theme  $theme
     * @return \Illuminate\Http\Response
     */
    public function destroy(Theme $theme)
    {
        $res = $theme->delete();
        $this->themeService->deleteTheme($theme);

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
            'title' => ['required', 'string', 'min:3', 'max:190', Rule::notIn(['Default', 'default'])],
            'theme' => ['nullable', Rule::requiredIf(!$id), File::types('zip')->max(1024 * 20)],
            'status' => ['required', 'string', 'in:active,deactive'],
        ]);
    }
}
