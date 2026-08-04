<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Application;
use App\Models\Career;
use App\Http\Controllers\Base\BaseController;


use Illuminate\Http\Request;

class CareerController extends BaseController
{
    public function career()
    {
        $career = Career::active()->orderBy('sorting', 'asc')->get();
        return view(themeBlade('pages.career.career-list'), compact('career'));
    }

    public function careerDetails($slug)
    {
        $careerDetails = Career::active()->where('slug', $slug)->firstOrFail();
        return view(themeBlade('pages.career.career-details'), compact('careerDetails'));
    }

    public function applyForm($slug)
    {
        $career = Career::where('slug', $slug)->firstOrFail();

        return view(themeBlade('pages.career.apply-form'), compact('career'));
    }

    public function jobApply(Request $request)
    {

        $request->validate([
            'cv' => 'required|file|mimes:pdf',
        ]);

        $file = $request->cv;
        $cvPath = $this->upload($file, 'cv');
        $data = [
            'cv' => $cvPath,
            'career_id' => $request->career_id,

        ];

        Application::create($data);
        \Brian2694\Toastr\Facades\Toastr::success('Your CV has been submitted successfully');
        return redirect()->back();

    }
}
