@extends(themeBlade('layout.master'))
@section('title', $product->title ?? 'Product Details')
@section('image', $product->original_image ?? ($product->image_one ?? ''))
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($product->meta_tag ?? '') ? implode(', ', $product->meta_tag ?? '') : $product->meta_tag ?? '')
@section('description', $product->meta_description ?? '')

@section('content')
    <!-- breadcrumb section start -->
    <section class="breadcrumb-wrapper bg-cover fix"
        style="background-image: url('{{ without_cache('build/theme/img/inner-page/breadcroumb.jpg') }}');">
        <div class="container">
            <div class="page-heading wow fadeInUp" data-wow-delay=".3s">
                <h1>Product Details</h1>
                <ul class="breadcrumb-list">
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li><i class="fa-solid fa-arrow-right"></i></li>
                    <li><a href="{{ route('productlist') }}">Products</a></li>
                    <li><i class="fa-solid fa-arrow-right"></i></li>
                    <li>{{ $product->title ?? '' }}</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- project details section start -->
    <section class="project-details-section section-padding fix">
        <div class="container">
            <div class="project-details-content">
                @if (!empty($product->original_image) || !empty($product->image_one))
                    <div class="project-details-image text-center fix mb-4 wow fadeInUp" data-wow-delay=".3s">
                        <img src="{{ $product->original_image ?? $product->image_one }}" alt="{{ $product->title ?? '' }}"
                            class="img-fluid rounded shadow-sm" style="object-fit:cover;">
                    </div>
                @endif

                <div class="info-box-items mb-4">
                    <div class="info-area">
                        <div class="row g-4">
                            @if (!empty($product->category))
                                <div class="col-xl-3 col-lg-4 col-sm-6 wow fadeInUp" data-wow-delay=".2s">
                                    <div class="info-box ps-0">
                                        <div class="icon">
                                            <i class="fa-solid fa-layer-group fs-3"></i>
                                        </div>
                                        <div class="content">
                                            <p>Category</p>
                                            <span>{{ $product->category->title }}</span>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            @if (!empty($product->title))
                                <div class="col-xl-9 col-lg-9 col-sm-6 wow fadeInUp" data-wow-delay=".8s">
                                    <div class="info-box border-0">
                                        <div class="icon">
                                            <i class="fa-solid fa-shirt fs-3 "></i>
                                        </div>
                                        <div class="content">
                                            <h3 class="char-animation">{{ $product->title ?? '' }}</h3>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="content-body wow fadeInUp" data-wow-delay=".5s">
                    {!! $product->description ?? '' !!}
                </div>
            </div>
        </div>
    </section>
@endsection
