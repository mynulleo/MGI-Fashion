@extends(themeBlade('layout.master'))
@section('title', "$project->title | $siteSetting->title")
@section('image', $project->image_two ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($project->meta_tag ?? '') ? implode(', ', $project->meta_tag ?? '') :
    $project->meta_tag ?? '')
@section('description', $project->meta_description ?? '')
@section('content')
    <!-- main area start -->
    <main>
        <!-- Page header area start -->
        <section class="ep-page-header-section gray-bg position-relative z-1">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="text text-center">
                            <h1 class="page-title text-white">{{ Str::limit($project->title ?? '', 20, '...') }}</h1>
                            <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li><a href="{{ route('allprojects') }}">Projects</a></li>
                                <li>{{ Str::limit($project->title ?? '', 20, '...') }}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Page header area end -->
        <!-- portfolio details area start -->
        <section class="portfolio_details_area pt_120">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-8">
                        <div class="image">
                            <img src="{{ $project->image_one ?? '' }}" alt="{{ $project->title ?? '' }}"
                                class="img-fluid w-100">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="portfolio_details">
                            <h4 class="title">Project Details</h4>

                            <ul class="pq_info_list list-unstyled">
                                <li>
                                    <h5>Client</h5>
                                    <span>{{ $project->Client->name ?? '' }}</span>
                                </li>
                                <li>
                                    <h5>Category</h5>
                                    <span>{{ $project->category->title ?? '' }}</span>
                                </li>
                                <li>
                                    <h5>Start Date</h5>
                                    <span>{{ $project->start_date ?? '' }}</span>
                                </li>
                                <li>
                                    <h5>End Date</h5>
                                    <span>{{ $project->end_date ?? '' }}</span>
                                </li>
                                <li>
                                    <h5>Project Value</h5>
                                    <span>{{ $project->value ?? '' }}</span>
                                </li>
                                <li>
                                    <h5>Founded by</h5>
                                    <span>{{ $project->funded_by ?? '' }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="main_content">
                    <h3 class="title">{{ $project->title ?? '' }}
                    </h3>
                    <p>{!! $project->description ?? '' !!}</p>
                </div>
            </div>
        </section>
        <!-- portfolio details area end -->

    </main>
    <!-- main area end -->
@endsection
