@php
    $seo = GlobalHelper::get_page_seo('About');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "About | $siteSetting->title")
@section('image', $seo->image_three ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')
@section('content')
    <!-- main area start -->
    <main>
        <!-- Page header area start -->
        <section class="ep-page-header-section gray-bg position-relative z-1">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="text text-center">
                            <h1 class="page-title text-white">About Us</h1>
                            <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li>About Us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Page header area end -->
        <!-- about us area start -->
        <section class="about_us_page pt_120">
            <div class="container">
                <div class="main">
                    <div class="section_title mb-3">
                        <h2 class="title">{{ $content->title ?? '' }}</h2>
                    </div>
                    <div class="about_content">
                        <div class="img float-image">
                            <img src="{{ $content->image_one ?? '' }}" alt="ienet">
                        </div>
                        <div class="text">
                            <p> {!! $content->description ?? '' !!} </p>


                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- about us area end -->
        <!-- counter area start -->

        @php
            $first_counter_image = GlobalHelper::get_page_section('Home', 'Counter section one', 'image_one');
            $second_counter_image = GlobalHelper::get_page_section('Home', 'Counter section two', 'image_one');
            $third_counter_image = GlobalHelper::get_page_section('Home', 'Counter section three', 'image_one');
            $fourth_counter_image = GlobalHelper::get_page_section('Home', 'Counter section four', 'image_one');

            $first_counter_amount = GlobalHelper::get_page_section('Home', 'Counter section one', 'amount');
            $second_counter_amount = GlobalHelper::get_page_section('Home', 'Counter section two', 'amount');
            $third_counter_amount = GlobalHelper::get_page_section('Home', 'Counter section three', 'amount');
            $fourth_counter_amount = GlobalHelper::get_page_section('Home', 'Counter section four', 'amount');

            $first_counter_title = GlobalHelper::get_page_section('Home', 'Counter section one', 'title');
            $second_counter_title = GlobalHelper::get_page_section('Home', 'Counter section two', 'title');
            $third_counter_title = GlobalHelper::get_page_section('Home', 'Counter section three', 'title');
            $fourth_counter_title = GlobalHelper::get_page_section('Home', 'Counter section four', 'title');
        @endphp
        <section class="counter_area mt_120 position-relative style2">
            <div class="container">
                <div class="counter_main">
                    <div class="row g-4 gy-5">
                        <div class="col-lg-3 col-md-6">
                            <div class="counter_item text-center">

                                <h5 class="number text-white d-flex align-items-center justify-content-center">
                                    <span class="odometer" data-count="{{ $first_counter_amount }}"></span>k
                                </h5>
                                <span class="text-white sub_title">{{ $first_counter_title }}</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="counter_item text-center">

                                <h5 class="number text-white d-flex align-items-center justify-content-center">
                                    <span class="odometer" data-count="{{ $second_counter_amount }}"></span>k
                                </h5>
                                <span class="text-white sub_title">{{ $second_counter_title }}</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="counter_item text-center">

                                <h5 class="number text-white d-flex align-items-center justify-content-center">
                                    <span class="odometer" data-count="{{ $third_counter_amount }}"></span>k
                                </h5>
                                <span class="text-white sub_title">{{ $third_counter_title }}</span>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="counter_item text-center">

                                <h5 class="number text-white d-flex align-items-center justify-content-center">
                                    <span class="odometer" data-count="{{ $fourth_counter_amount }}"></span>k
                                </h5>
                                <span class="text-white sub_title">{{ $fourth_counter_title }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- counter area end -->
        <!-- news area start -->
        <section class="news_area pt_120">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-8 mx-auto">
                        <div class="section_title text-center">
                            <h4 class="sub_title"> {!! GlobalHelper::get_page_section('Home', 'News section', 'sub_title') !!}</h4>
                            <h2 class="title mb-2"> {!! GlobalHelper::get_page_section('Home', 'News section', 'title') !!} </h2>
                            <p>{!! GlobalHelper::get_page_section('Home', 'News section', 'description') !!}</p>
                        </div>
                    </div>
                </div>
                <div class="news_slider">

                    @foreach ($news as $item)
                        @php
                            $day = \Carbon\Carbon::parse($item->date)->format('d');
                            $month = \Carbon\Carbon::parse($item->date)->format('M');
                        @endphp
                        <div class="news_item">
                            <a href="{{ route('news.details', ['slug' => $item->slug ?? '']) }}" class="d-block w-100">
                                <div class="image position-relative">
                                    <img src="{{ $item->image_two ?? '' }}" alt="news" class="img-fluid w-100">
                                    <span class="date d-block text-center">
                                        {{ $day }} <small>{{ $month }}</small>
                                    </span>
                                </div>
                                <div class="text">
                                    <div class="blog_meta">

                                    </div>
                                    <h4 class="title mb-4">{{ Str::limit($item->title ?? '', 30, '...') }}</h4>
                                    <span class="theme_btn">Read More</span>
                                </div>
                            </a>
                        </div>
                    @endforeach

                </div>
            </div>
        </section>
        <!-- news area end -->
    </main>
    <!-- main area end -->
@endsection
