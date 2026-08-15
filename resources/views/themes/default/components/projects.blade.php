<!-- Project Section Start -->
<section class="project-area-three fix section-padding pt-0">
    <div class="container">
        <div class="section-title-area align-items-end">
            <div class="section-title">
                <span class="sub-title wow fadeInUp">
                    Future Project
                    <span class="line-1"></span>
                </span>
                <h2 class="char-animation">Discover Our Creative Technical <br> Fabric Projects</h2>
            </div>
            <div class="array-nav">
                <button class="array-prev slick-arrow">
                    <i class="fa-solid fa-arrow-left"></i>
                </button>

                <button class="array-next slick-arrow">
                    <i class="fa-solid fa-arrow-right"></i>
                </button>
            </div>
        </div>
    </div>
    <div class="project-wrapper">
        <div class="row">
            <div class="col-xl-12">
                <div class="thumb-wrap my-slider">
                    @if(isset($projects) && count($projects) > 0)
                        @foreach ($projects as $index => $project)
                            @php
                                $projectImg = !empty($project->original_image) ? $project->original_image : (!empty($project->image_two) ? asset($project->image_two) : without_cache('build/theme/img/vedio/project.jpg'));
                            @endphp
                            <div class="thumb thumb-active {{ $index == 0 ? 'active' : '' }}">
                                <div class="projects-item"
                                    style="background-image: url('{{ $projectImg }}');">
                                    <div class="card-text-content">
                                        <h3 class="title"><a href="{{ route('project', $project->slug) }}">{{ $project->title }}</a></h3>
                                        <p>{{ Str::limit(strip_tags($project->short_description ?? $project->description ?? ''), 100) }}</p>
                                        <a href="{{ route('project', $project->slug) }}" class="project-btn">
                                            View More <i class="fa-solid fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <div class="col-12 text-center py-5">
                            <p class="text-muted fs-5">No Data Found</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
