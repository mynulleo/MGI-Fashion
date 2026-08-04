<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Website\News;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function news(Request $request)
    {
        $news = News::where('status', 'active');
        if ($request->search) {
            $news->where('title', 'Like', '%' . $request->search . '%');
        }
        if ($request->tag) {
            $news->where('tag', 'Like', '%' . $request->tag . '%');
        }
        $keyword = $request->search ?? '';
        $tag = $request->tag ?? "";
        $news = $news->get();
        $recent_post = News::where('status', 'active')->latest()->limit(4)->get();
        $allTags = News::where('status', 'active')->get()->flatMap(function ($news) {
            $tags = is_array($news->tag) ? $news->tag : explode(',', $news->tag);
            return array_map('trim', $tags);
        })->countBy();

        return view(themeBlade('pages.news.news-list'), compact('news', 'recent_post', 'allTags', 'keyword', 'tag'));
    }


    public function newsDetails(Request $request, $slug)
    {
        $news = News::where('status', 'active')->get();
        if ($request->search) {
            $news->where('title', 'Like', '%' . $request->search . '%');
        }
        if ($request->tag) {
            $news->where('tag', 'Like', '%' . $request->tag . '%');
        }
        $keyword = $request->search ?? '';
        $tag = $request->tag ?? "";

        $recent_post = News::where('status', 'active')->latest()->limit(4)->get();
        $allTags = News::where('status', 'active')->get()->flatMap(function ($news) {
            $tags = is_array($news->tag) ? $news->tag : explode(',', $news->tag);
            return array_map('trim', $tags);
        })->countBy();

        $news_details = News::where('slug', $slug)->firstOrFail();

        return view(themeBlade('pages.news.news-details'), compact('news_details', 'recent_post', 'tag', 'news', 'keyword', 'allTags'));
    }
}
