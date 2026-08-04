<?php

namespace App\Http\Controllers;

use App\Services\SitemapService;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Storage;

class
SitemapController extends Controller
{
    protected $sitemapService;

    public function __construct(SitemapService $sitemapService)
    {
        $this->sitemapService = $sitemapService;
    }

    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $xmlFilename = 'dynamic_sitemap.xml';

        // update sitemap because file not exist
        Storage::put($xmlFilename, $this->sitemapService->generateSitemap());

        return response(Storage::get($xmlFilename), 200)->header('Content-Type', 'application/xml');
    }
}
