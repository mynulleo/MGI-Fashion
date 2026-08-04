@php
    $seo = GlobalHelper::get_page_seo('Projects');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "Projects | $siteSetting->title")
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
                            <h1 class="page-title text-white">Projects</h1>
                            <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li>Projects</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Page header area end -->
        <!-- portfolio area start -->
        <section class="portfolio_page_area pt_120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="portfolio_menu">
                            <ul class="list-unstyled">
                                <li>
                                    <button type="button" onclick="fetchProject('all')"
                                        class="@if (request('slug') == null) active @endif" data-filter="*">All</button>
                                    @foreach ($categories ?? [] as $category)
                                        <button class="@if ($category->slug == request('slug')) active @endif"
                                            onclick="fetchProject({{ $category->id }})"
                                            data-filter=".category-{{ $category->id }}">{{ $category->title }}</button>
                                    @endforeach
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="portfolio_main">
                    <div class="row g-4 portfolio-body portfolio-item-container" id="loader" style="display: none">
                        <img src="{{ without_cache('build/theme/images/project_loader.gif') }}" loading="lazy">
                    </div>
                    <div class="row g-4 portfolio_main_container" id="project-list">

                        @foreach ($projects as $project)
                            <div class="col-lg-4 col-md-6 projects_label isotop category-{{ $project->category_id }}">
                                <div class="portfolio_single_item category-{{ $project->category_id }}">
                                    <a href="{{ route('projectdetails', ['slug' => $project->slug]) }}"
                                        class="d-block w-100">
                                        <div class="img position-relative">
                                            <img src="{{ $project->image_two ?? '' }}" alt="{{ $project->title ?? '' }}"
                                                class="img-fluid w-100">
                                            <div
                                                class="info d-flex align-items-center justify-content-center position-absolute top-0 start-0 w-100 h-100">
                                                <div class="text bg-white">
                                                    <div class="category">
                                                        {{ $project->category->title }}
                                                    </div>
                                                    <h4 class="title"> {!! Illuminate\Support\Str::limit($project->title, 25) !!}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </section>
        <br>
        <br>
        <center>
            <div class="portfolio_menu text-center mt-4">
                <ul class="list-unstyled">
                    <li>
                        <button type="button" id="load-more-btn" onclick="loadMoreProjects(event)"
                            style="
                    background-color: #ff6600;
                    color: white;
                    border: none;
                    padding: 12px 30px;
                    font-size: 16px;
                    font-weight: 600;
                    border-radius: 30px;
                    transition: all 0.3s ease;
                    box-shadow: 0 4px 12px rgba(255, 102, 0, 0.3);
                    cursor: pointer;
                "
                            onmouseover="this.style.backgroundColor='#e65c00'; this.style.boxShadow='0 6px 16px rgba(230, 92, 0, 0.4)'"
                            onmouseout="this.style.backgroundColor='#ff6600'; this.style.boxShadow='0 4px 12px rgba(255, 102, 0, 0.3)'">
                            Load More
                        </button>
                    </li>
                </ul>
            </div>
        </center>
        <!-- portfolio area end -->

        @push('scripts')
            <script>
                let currentPage = "{{ $projects->currentPage() }}";
                let lastPage = "{{ $projects->lastPage() }}";
                let nextPageUrl = "{{ $projects->nextPageUrl() }}";
                var page = 1;

                function loadMoreProjects(e) {
                    e.preventDefault();
                    page = page + 1
                    fetchProject(null, "{{ request('slug') }}");
                }

                function fetchProject(category_id, slug = null) {
                    if (category_id == 'all') {
                        window.location.href = "{{ route('allprojects') }}";
                        return;
                    }

                    $('.portfolio_menu button').removeClass('active');

                    if (category_id === 'all' || category_id === null) {
                        $('button[data-filter="*"]').addClass('active'); // re-add active to "All"
                    } else {
                        $(`button[data-filter=".category-${category_id}"]`).addClass('active');
                    }

                    if (category_id != null) {
                        $('#load-more-btn').hide();
                        $('#project-list').empty();
                    } else {
                        $('#load-more-btn').show();
                    }

                    var loader = "{{ without_cache('build/theme/images/project_loader.gif') }}";
                    $('#loader').show();
                    $('#project-list').hide();
                    // console.log(category_id);
                    var url = "{{ route('fetch.projects') }}";
                    const projectURLPrefix = `{{ url('project') }}`;
                    $.ajax({
                        url: url,
                        type: "GET",
                        data: {
                            category_id,
                            slug,
                            page
                        }, // Remove the dot from categoryFilter
                        dataType: "json",
                        success: function(response) {
                            var server_res = response;

                            response = response.data ?? response

                            var projectItem = '';

                            for (let index = 0; index < response.length; index++) {
                                const project = response[index];

                                // Limit title to 30 characters
                                const truncatedTitle = project.title ? (project.title.length > 20 ? project.title
                                    .substring(0, 20) + '...' : project.title) : '';
                                projectItem += `
                                <div class="col-lg-4 col-sm-6 projects_label  isotop category-${project.category_id}">
                                    <div class="portfolio_single_item category-${project.category_id}">

                                    <a href="${projectURLPrefix}/${project.slug}" class="d-block w-100">

                                        <div class="img position-relative">
                                            <img src="${project.image_two ?? ''}" alt="${truncatedTitle}"
                                                class="img-fluid w-100" loading="lazy">
                                           <div class="info d-flex align-items-center justify-content-center position-absolute top-0 start-0 w-100 h-100">

                                                <div class="text bg-white">
                                                    <div class="category">
                                                       ${project.category.title}
                                                    </div>
                                                    <h4 class="title">${truncatedTitle}</h4>
                                                </div>
                                        </div>
                                        </div>
          

                                        </a>
                                    </div>
                                </div>
                            `;
                            }

                            setTimeout(() => {
                                $('#loader').hide();
                                $('#project-list').show();

                                $('#project-list').append(projectItem);
                            }, 2000);

                            //    remove load more btn
                            if ($('.projects_label').length == server_res.total) {
                                $('#load-more-btn').hide();
                            }

                            // Show no project found message if no projects found
                            if (response.length === 0 && category_id != null) {
                                $('#project-list').html(
                                    '<div class="col-lg-12 text-center"><h2>Sorry!! No projects found.</h2></div>');
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });

                }
            </script>
        @endpush

    </main>
    <!-- main area end -->
@endsection
