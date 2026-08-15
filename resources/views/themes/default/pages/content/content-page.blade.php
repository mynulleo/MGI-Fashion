@extends(themeBlade('layout.master'))
@section('title', $content->title ?? $menu_title ?? 'Content Page')
@section('image', $content->original_image ?? $content->image_one ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($content->meta_tag ?? '') ? implode(', ', $content->meta_tag ?? '') : $content->meta_tag ?? '')
@section('description', $content->meta_description ?? '')

@section('content')
    <!-- breadcrumb section start -->
    <section class="breadcrumb-wrapper bg-cover fix"
        style="background-image: url('{{ without_cache('build/theme/img/inner-page/breadcroumb.jpg') }}');">
        <div class="container">
            <div class="page-heading wow fadeInUp" data-wow-delay=".3s">
                <h1>{{ $menu_title ?? $content->title ?? '' }}</h1>
                <ul class="breadcrumb-list">
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li><i class="fa-solid fa-arrow-right"></i></li>
                    <li>{{ $menu_title ?? $content->title ?? '' }}</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- content section start -->
    <section class="content-details-section section-padding fix">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="content-details-wrapper">
                        @if (!empty($content->original_image))
                            <div class="content-image mb-4 text-center wow fadeInUp" data-wow-delay=".3s">
                                <img src="{{ $content->original_image }}" alt="{{ $content->title ?? '' }}"
                                    class="img-fluid rounded shadow-sm">
                            </div>
                        @elseif(!empty($content->image_one))
                            <div class="content-image mb-4 text-center wow fadeInUp" data-wow-delay=".3s">
                                <img src="{{ $content->image_one }}" alt="{{ $content->title ?? '' }}"
                                    class="img-fluid rounded shadow-sm">
                            </div>
                        @endif

                        <div class="content-header mb-4 text-center wow fadeInUp" data-wow-delay=".4s">
                            <h2>{{ $content->title ?? '' }}</h2>
                        </div>

                        <div class="content-body wow fadeInUp" data-wow-delay=".5s">
                            {!! $content->description ?? '' !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
