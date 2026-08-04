<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function clients()
    {

        $client = Client::active()->orderBy('sorting', 'asc')->get();
        return view(themeBlade('pages.client.client-list'), compact('client'));
    }

    public function clientsDetails($slug)
    {

        $data['client_details'] = Client::active()->where('slug', $slug)->firstOrFail();
        // dd($data);
        return view(themeBlade('pages.client.client-details'), $data);
    }
}
