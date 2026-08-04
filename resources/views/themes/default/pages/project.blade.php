@extends(themeBlade('layout.master'))
@section('title', $project->title)
@section('image', $project->image_one ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($project->meta_tag ?? '') ? implode(', ', $project->meta_tag ?? '') : $project->meta_tag ?? '')
@section('description', $project->meta_description ?? '')
@section('content')
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0">{{ $project->title }}</h1>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li class="current">Project</li>
                    <li class="current">{{ $project->title }}</li>
                </ol>
            </nav>
        </div>
    </div><!-- End Page Title -->
    <section id="privacy-2" class="privacy-2 section">
        <div class="container" data-aos="fade-up">
            <div class="wow fadeIn" data-wow-delay="0.1s">
                <div class="content-wrapper project-wrapper">
                    @if (!empty($project->image_one))
                        <img src="{{ $project->image_one }}" alt="{{ $project->title ?? '' }}" class="img-fluid">
                    @endif

                    <div class="content-section">
                        <h2 class="title">
                            <span class="text-uppercase bg-light px-2">
                                {{ $project->title ?? '' }}
                            </span>
                        </h2>

                        <div class="mb-4 content-text">
                            {!! $project->description ?? '' !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
