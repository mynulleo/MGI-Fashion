<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function services()
    {
        $service = Service::active()->orderBy('sorting', 'asc')->paginate(9);

        return view(themeBlade('pages.service.service-list'), compact('service'));
    }

    public function serviceDetails($slug)
    {
        $data['service_details'] = Service::active()->where('slug', $slug)->firstOrFail();

        return view(themeBlade('pages.service.service-details'), $data);
    }
}
