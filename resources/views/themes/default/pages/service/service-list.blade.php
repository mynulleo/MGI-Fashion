@php
    $seo = GlobalHelper::get_page_seo('Services');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "Services | $siteSetting->title")
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
                            <h1 class="page-title text-white">Services</h1>
                            <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li>Services</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Page header area end -->
        <!-- services area start -->
        <section class="services_area mt_120 style2">
            <div class="container">
                <div class="section_title text-center mb-5">
                    <h4 class="sub_title">{!! GlobalHelper::get_page_section('Home', 'Service section', 'sub_title') !!}</h4>
                    <h2 class="title"> {!! GlobalHelper::get_page_section('Home', 'Service section', 'title') !!}</h2>
                </div>
                <div class="row g-4">
                    {{--  @dd($service)  --}}
                    @foreach ($service as $item)
                        <div class="col-lg-4 col-md-6">
                            <div class="service_item text-center">
                                <a href="{{ route('service.details', ['slug' => $item->slug]) }}" class="d-block w-100">
                                    <div class="icon">
                                        <img src="{{ $item->image_small_one ?? '' }}" alt="{{ $item->title ?? '' }}">
                                    </div>
                                    <h3 class="title">{{ Str::limit($item->title ?? '', 40, '...') }}</h3>
                                    <p>{!! Str::limit(strip_tags($item->description ?? ''), 100, '...') !!}</p>
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="pagination d-flex justify-content-center mt-5">
                    <ul class="list-unstyled d-flex align-items-center justify-content-center w-100">

                        {{ $service->links(themeBlade('components.paginate')) }}

                    </ul>
                </div>
            </div>
        </section>
        <!-- services area end -->
    </main>
    <!-- main area end -->
@endsection
