<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Faq;
use App\Models\Career;
use App\Models\Client;
use App\Models\Events;
use App\Models\Feature;
use App\Models\Package;
use App\Models\Project;
use App\Models\Service;
use App\Models\Category;
use App\Models\Contacts;
use App\Traits\MailTrait;
use App\Models\Partnership;
use App\Models\Testimonial;
use App\Models\Website\News;
use Illuminate\Http\Request;
use App\Models\Website\Notice;
use App\Models\Website\FrontMenu;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Mail;
use App\Models\Website\Gallery\Album;
use App\Models\Website\Gallery\Photo;
use App\Models\Website\Gallery\Video;
use App\Models\Website\Gallery\Slider;
use App\Models\Website\Content\Content;

class WebsiteController extends Controller
{
    use MailTrait;

    public function index()
    {
        $slider = Slider::query()
            ->with('details')
            ->active()
            ->orderBy('sorting', 'asc')
            ->where('position', 'Header')
            ->first();

        $about = Content::query()
            ->with('files')
            ->active()
            ->where('slug', 'about-us')
            ->first();

        $testimonials = Testimonial::where('status', 'active')->get();
        $packages = Package::where('status', 'active')->where('display_web', 1)->get();
        $featurres = Feature::where('status', 'active')->orderBy('sorting', 'ASC')->take(4)->get();
        $services = Service::where('status', 'active')->orderBy('sorting', 'ASC')->take(4)->get();
        $categories = Category::where('module_name', 'project')
            ->where('status', 'active')
            ->orderBy('sorting', 'asc')
            ->get();
        $projects = Project::where('status', 'active')->orderBy('id', 'desc')->get();

        return view(themeBlade('home'), [
            'slider' => $slider,
            'about' => $about,
            'testimonials' => $testimonials,
            'packages' => $packages,
            'featurres' => $featurres,
            'services' => $services,
            'categories' => $categories,
            'projects' => $projects
        ]);
    }




    public function content($slug = null)
    {
        // Initialize data array
        $data = [
            'content' => null,
        ];

        // Check if slug is provided
        if ($slug) {
            // Load content by slug
            $menu = FrontMenu::with('content')->where('slug', $slug)->first();
            if ($menu->content) {
                $data['content'] = $menu->content;
                $data['menu_title'] = $menu->title;
            }

            // Handle not found
            if (!$data['content']) {
                abort(404);
            }

            // For other slugs
            return view(themeBlade('pages.content.content-page'), $data);
        }

        // If no slug is provided
        abort(404);
    }

    public function contact()
    {
        return view(themeBlade('pages.contact.contact-page'));
    }

    public function contactStore(Request $request)
    {

        $validated = $request->validate([
            'name'      => 'required|string|min:2|max:30|regex:/^[a-zA-Z-. ]+$/',
            'email'     => 'required|email',
            'phone'     => 'required|string',
            'subject'   => 'required|string|min:2|max:100|regex:/^[a-zA-Z-. ]+$/',
            'message'   => 'required|string|min:10|max:500',
        ]);


        $contact = Contacts::create($validated);

        Mail::send(themeBlade('mail.contact-mail'), ['data' => $validated], function ($message) use ($request) {
            $message->to($request->email)
                ->subject('Thanks for contacting us!');
        });

        \Brian2694\Toastr\Facades\Toastr::success('Your mail has been submitted successfully');
        return redirect()->back();
    }

    public function faq()
    {
        $faq_datas = Faq::where('status', 'active')->get();
        return view(themeBlade('pages.faq'), [
            'faq_datas' => $faq_datas
        ]);
    }

    public function projectlist()
    {
        $content = Content::where('status', 'active')->where('slug', 'project')->first();
        $projects = Project::with('category:id,title')->where('status', 'active')->get();

        return view(themeBlade('pages.projectlist'), [
            'content' => $content,
            'projects' => $projects,
        ]);
    }

    public function project($slug)
    {
        $project = Project::where('slug', $slug)->first();

        return view(themeBlade('pages.project'), [
            'project' => $project
        ]);
    }
}
