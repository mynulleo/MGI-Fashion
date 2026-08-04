@php
    $seo = GlobalHelper::get_page_seo('News');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "News & Events | $siteSetting->title")
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
                            <h1 class="page-title text-white">News & Events</h1>
                            <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li>News & Events</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Page header area end -->
        @if (!empty($keyword))
            @php $searched = true; @endphp
        @endif
        <!-- news area start -->
        @if ($news->isNotEmpty())
            <section class="news_area style2 pt_120">
                <div class="container">
                    <div class="row g-4">
                        @foreach ($news as $item)
                            <div class="col-lg-4 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('news.details', ['slug' => $item->slug ?? '']) }}"
                                        class="d-block w-100">
                                        <div class="image position-relative">
                                            <img src="{{ $item->image_two ?? '' }}" alt="{{ $item->title ?? '' }}"
                                                class="img-fluid w-100">
                                            @php
                                                $day = \Carbon\Carbon::parse($item->date)->format('d');
                                                $month = \Carbon\Carbon::parse($item->date)->format('M');
                                            @endphp
                                            <span class="date d-block text-center">
                                                {{ $day }} <small>{{ $month }}</small>
                                            </span>
                                        </div>
                                        <div class="text">
                                            <div class="blog_meta">

                                            </div>
                                            <h4 class="title mb-4">{{ Str::limit($item->title ?? '', 30, '...') }}</h4>
                                            <p>{!! Str::limit($item->description ?? '', 100, '...') !!}</p>
                                            <span class="theme_btn">Read More</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach

                    </div>
                    {{--  <div class="pagination d-flex justify-content-center mt-5">
                         <ul class="list-unstyled d-flex align-items-center justify-content-center w-100">
                             <li class="arrow"><i class="fa-solid fa-chevron-left"></i></li>
                             <li>
                                 <a href="#" class="active"><span>1</span></a>
                             </li>
                             <li>
                                 <a href="#">2</a>
                             </li>
                             <li class="arrow"><a href="#" rel="next"><i
                                         class="fa-solid fa-chevron-right"></i></a>
                             </li>
                         </ul>
                     </div>  --}}
                </div>
            </section>

            <!-- news area end -->
        @else
            <section class="news_area style2 pt_120">
                <div class="container">
                    <div class="row g-4">
                        <center>
                            <h2>Sorry!! No News found</h2>
                        </center>
                    </div>
                </div>
            </section>
        @endif




    </main>
    <!-- main area end -->
@endsection
