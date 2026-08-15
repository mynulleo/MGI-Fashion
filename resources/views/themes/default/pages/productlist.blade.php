@php
    $seo = GlobalHelper::get_page_seo('product');
@endphp
@extends(themeBlade('layout.master'))
@section('title', 'Our Products')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')

@section('content')
    <!-- breadcrumb section start -->
    <section class="breadcrumb-wrapper bg-cover fix"
        style="background-image: url('{{ without_cache('build/theme/img/inner-page/breadcroumb.jpg') }}');">
        <div class="container">
            <div class="page-heading wow fadeInUp" data-wow-delay=".3s">
                <h1>{{ $content->title ?? 'Our Products' }}</h1>
                <ul class="breadcrumb-list">
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li><i class="fa-solid fa-arrow-right"></i></li>
                    <li>{{ $content->title ?? 'Products' }}</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- project section start -->
    <section class="project-section-3 section-padding fix">
        <div class="container">
            @if (!empty($content->description))
                <div class="row mb-4 justify-content-center">
                    <div class="col-lg-10 text-center">
                        {!! $content->description !!}
                    </div>
                </div>
            @endif

            <!-- Search & Filter Form -->
            <div class="row mb-5 justify-content-center">
                <div class="col-lg-11">
                    <form action="{{ url()->current() }}" method="GET"
                        class="p-4 rounded-4 shadow-sm bg-white border border-light">
                        <div class="row g-3 align-items-center">
                            <div class="col-md-5">
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i
                                            class="fa-solid fa-magnifying-glass text-muted"></i></span>
                                    <input type="text" name="search" class="form-control bg-light border-0 py-2"
                                        placeholder="Search product title..." value="{{ request('search') }}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-0"><i
                                            class="fa-solid fa-layer-group text-muted"></i></span>
                                    <select name="category" class="form-select bg-light border-0 py-2">
                                        <option value="">All Categories</option>
                                        @if (isset($categories) && count($categories) > 0)
                                            @foreach ($categories as $cat)
                                                <option value="{{ $cat->id }}"
                                                    {{ request('category') == $cat->id ? 'selected' : '' }}>
                                                    {{ $cat->title }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex gap-2">
                                <button type="submit" class="theme-btn">
                                    <i class="fa-solid fa-magnifying-glass me-1"></i> Search
                                </button>
                                @if (request()->filled('search') || request()->filled('category'))
                                    <a href="{{ url()->current() }}"
                                        class="btn btn-outline-secondary py-2 px-3 d-flex align-items-center justify-content-center"
                                        title="Reset Search">
                                        <i class="fa-solid fa-rotate-left"></i>
                                    </a>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="project-wrapper-3">
                <div class="row g-4">
                    @if (isset($products) && count($products) > 0)
                        @foreach ($products as $index => $product)
                            <div class="col-md-6 wow fadeInUp" data-wow-delay=".{{ ($index % 5) + 2 }}s">
                                <div class="project-items">
                                    <div class="project-image">
                                        <div class="project-thumb">
                                            <img src="{{ $product->original_image ?? $product->image_one }}"
                                                alt="{{ $product->title }}" style="width:100%; object-fit:cover;">
                                            <img src="{{ $product->original_image ?? $product->image_one }}"
                                                alt="{{ $product->title }}" style="width:100%; object-fit:cover;">
                                        </div>
                                        <div class="project-content">
                                            <div class="content">
                                                <span>{{ sprintf('%02d', ($products->currentPage() - 1) * $products->perPage() + $index + 1) }}</span>
                                                <h2>
                                                    <a href="{{ url('product/' . $product->slug) }}">
                                                        {{ $product->title }}
                                                    </a>
                                                </h2>
                                            </div>
                                            <p>{{ $product->category?->title ?? 'Product' }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <div class="col-12 text-center py-5">
                            <p class="fs-5 text-muted">No Products Found</p>
                        </div>
                    @endif
                </div>

                @if ($products->hasPages())
                    <div class="page-nav-wrap text-center mt-5 wow fadeInUp" data-wow-delay=".8s">
                        <ul>
                            {{-- Previous Page Link --}}
                            @if ($products->onFirstPage())
                                <li class="disabled"><span><i class="fa-solid fa-arrow-left"></i></span></li>
                            @else
                                <li><a href="{{ $products->previousPageUrl() }}"><i class="fa-solid fa-arrow-left"></i></a>
                                </li>
                            @endif

                            {{-- Pagination Elements --}}
                            @foreach ($products->getUrlRange(1, $products->lastPage()) as $page => $url)
                                @if ($page == $products->currentPage())
                                    <li><a class="page-numbers active"
                                            href="javascript:void(0)">{{ sprintf('%02d', $page) }}</a></li>
                                @else
                                    <li><a class="page-numbers"
                                            href="{{ $url }}">{{ sprintf('%02d', $page) }}</a></li>
                                @endif
                            @endforeach

                            {{-- Next Page Link --}}
                            @if ($products->hasMorePages())
                                <li><a href="{{ $products->nextPageUrl() }}"><i class="fa-solid fa-arrow-right"></i></a>
                                </li>
                            @else
                                <li class="disabled"><span><i class="fa-solid fa-arrow-right"></i></span></li>
                            @endif
                        </ul>
                    </div>
                @endif
            </div>
        </div>
    </section>
@endsection
