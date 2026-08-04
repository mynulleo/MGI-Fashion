<!-- About Section -->
<section id="about" class="about section">
    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        @php
            $pagesection = GlobalHelper::getPageSection(1, 'about-us-title');
        @endphp
        <h2>{{ $pagesection->page_title }}</h2>
    </div><!-- End Section Title -->
    <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row">
            <div class="col-lg-6" data-aos="fade-right" data-aos-delay="200">
                <div class="content">
                    <h2>{{ $about->title }}</h2>


                    <div class="description">
                        {!! Str::limit(strip_tags($about->description ?? ''), 1050, '...') !!}
                    </div>

                    <div class="stats-row">
                        <div class="stat-item" data-aos="fade-up" data-aos-delay="300">
                            @php
                                $pagesection = GlobalHelper::getPageSection(1, 'our-moto');
                            @endphp
                            <h4 class="moto">{{ $pagesection->page_title }}</h4>

                        </div>
                    </div><!-- End Stats Row -->

                    <div class="cta-section" data-aos="fade-up" data-aos-delay="300">
                        <a href="{{ route('page', 'about-us') }}" class="btn-link">Read More <i
                                class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-lg-6" data-aos="fade-left" data-aos-delay="200">
                <div class="image-container">
                    <img src="{{ $about->image_one ?? '' }}" alt="About Us" class="img-fluid">
                    <div class="image-overlay">
                        <div class="overlay-content">
                            <i class="bi bi-award"></i>
                            <div class="overlay-text">
                                <h4>Award Winning</h4>
                                <p>Excellence in Service</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</section><!-- /About Section -->
