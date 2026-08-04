@php
    $seo = GlobalHelper::get_page_seo('Registration');
@endphp
@extends(themeBlade('layout.master'))
@section('title', 'Projects')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')
@section('content')
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0">Projects</h1>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li class="current">Projects</li>
                </ol>
            </nav>
        </div>
    </div><!-- End Page Title -->
    <section id="privacy-2" class="privacy-2 section">
        <div class="container" data-aos="fade-up">
            <div class="wow fadeIn" data-wow-delay="0.1s">
                <div class="content-wrapper project-wrapper">
                    @if (!empty($content->image_one))
                        <img src="{{ $content->image_one }}" alt="{{ $content->title ?? '' }}" class="img-fluid">
                    @endif

                    <div class="content-section">
                        <h2 class="title">
                            <span class="text-uppercase bg-light px-2">
                                {{ $content->title ?? '' }}
                            </span>
                        </h2>

                        <div class="mb-4 content-text">
                            {!! $content->description ?? '' !!}
                        </div>
                    </div>
                </div>
                <div class="project-list">
                    <div class="row g-3">
                        @foreach ($projects as $project)
                            <div class="col-md-4">
                                <div class="project-card card border-0 shadow-sm mb-4 rounded-4 overflow-hidden">
                                    <div class="image-container position-relative overflow-hidden">
                                        <img src="{{ $project->image_two }}" alt="{{ $project->title }}"
                                            class="img-fluid w-100 rounded-top-4" loading="lazy">

                                        {{-- Overlay --}}
                                        <div
                                            class="overlay position-absolute top-0 start-0 w-100 h-100 
                    d-flex flex-column align-items-center justify-content-center text-center px-3">
                                            <div class="text-white small mb-3">
                                                {!! Str::limit(strip_tags($project->description), 400) !!}
                                            </div>
                                            <a href="{{ url('project/' . $project->slug) }}"
                                                class="btn btn-sm btn-light px-3 py-2 shadow-sm">
                                                <i class="bi bi-box-arrow-up-right me-1"></i> View Details
                                            </a>
                                        </div>
                                    </div>

                                    {{-- Project Info --}}
                                    <div class="projectinfo card-body text-white">
                                        <div class="d-flex justify-content-between align-items-center flex-wrap small mb-2">
                                            <span>
                                                <i class="bi bi-calendar3 me-1"></i>
                                                {{ \Carbon\Carbon::parse($project->start_date)->format('M d, Y') }}
                                            </span>

                                            <span class="badge bg-white text-danger border border-white mb-2">
                                                {{ $project->category?->title ?? 'Uncategorized' }}
                                            </span>

                                            @if ($project->website)
                                                <a href="{{ $project->website }}" target="_blank"
                                                    class="text-white text-decoration-underline">
                                                    <i class="bi bi-globe me-1"></i> Visit Project Website
                                                </a>
                                            @endif
                                        </div>

                                        <h5 class="card-title fw-semibold mt-2 mb-0">{{ $project->title }}</h5>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
