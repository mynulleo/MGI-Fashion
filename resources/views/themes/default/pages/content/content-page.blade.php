@extends(themeBlade('layout.master'))
@section('title', $content->title)
@section('image', $content->image_one ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($content->meta_tag ?? '') ? implode(', ', $content->meta_tag ?? '') : $content->meta_tag ?? '')
@section('description', $content->meta_description ?? '')
@section('content')
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0">{{ $menu_title }}</h1>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li class="current">{{ $menu_title }}</li>
                </ol>
            </nav>
        </div>
    </div><!-- End Page Title -->
    <section id="privacy-2" class="privacy-2 section">
        <div class="container" data-aos="fade-up">
            <div class="wow fadeIn" data-wow-delay="0.1s">
                <div class="content-wrapper">
                    @if (!empty($content->image_one))
                        <img src="{{ $content->image_one }}" alt="{{ $content->title ?? '' }}" class="img-fluid">
                    @endif

                    <div class="content-section">
                        @if ($content->title != $menu_title)
                            <h2 class="title">
                                <span class="text-uppercase text-primary bg-light px-2">
                                    {{ $content->title ?? '' }}
                                </span>
                            </h2>
                        @endif

                        <div class="mb-4 content-text">
                            {!! $content->description ?? '' !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
