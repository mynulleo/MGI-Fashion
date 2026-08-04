<!-- Portfolio Section -->
<section id="portfolio" class="portfolio section light-background">

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        <h2>Projects</h2>
        <p>Check Our&nbsp; Projects</p>
    </div><!-- End Section Title -->

    <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="isotope-layout" data-default-filter="*" data-layout="fitRows" data-sort="original-order">
            <!-- Filters -->
            <div class="portfolio-filters-wrapper" data-aos="fade-up" data-aos-delay="100">
                <ul class="portfolio-filters isotope-filters">
                    <li data-filter="*" class="filter-active">All Projects</li>
                    @foreach ($categories as $category)
                        <li data-filter=".filter-{{ $category->slug }}">{{ $category->title }}</li>
                    @endforeach
                </ul>
            </div>
            <!-- Portfolio Grid -->
            <div class="row gy-4 portfolio-grid isotope-container" data-aos="fade-up" data-aos-delay="200">

                @foreach ($projects as $project)
                    @php
                        $category = $categories->firstWhere('id', $project->category_id);
                        $filterClass = $category ? 'filter-' . $category->slug : '';
                    @endphp

                    <div class="col-lg-4 col-md-6 portfolio-item isotope-item {{ $filterClass }}">
                        <div class="portfolio-card">
                            <div class="image-container">
                                <img src="{{ $project->image_two }}" class="img-fluid" alt="{{ $project->title }}"
                                    loading="lazy">
                                <div class="overlay">
                                    <div class="overlay-content">
                                        <a href="{{ $project->original_image }}" class="glightbox zoom-link"
                                            title="{{ $project->title }}">
                                            <i class="bi bi-zoom-in"></i>
                                        </a>
                                        <a href="{{ route('project', $project->slug) }}" class="details-link"
                                            title="View Project Details">
                                            <i class="bi bi-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                <h3>{{ $project->title }}</h3>
                                <p>{{ $project->short_description }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div><!-- End Portfolio Grid -->
        </div>
    </div>
</section><!-- /Portfolio Section -->
