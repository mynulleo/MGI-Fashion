<!-- Hero Section -->
<section id="hero" class="hero section">
    <div class="hero-content">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="content">
                        @php
                            $pagesection = GlobalHelper::getPageSection(1, 'title-slogan');
                        @endphp
                        <h1>{{ $slider?->details[0]['title'] }}</h1>
                        <p>{!! $slider?->details[0]['description'] !!}</p>
                        <div class="cta-group">
                            <a href="{{ $slider?->details[0]['button_url'] }}"
                                class="btn-primary">{{ $slider?->details[0]['button_name'] }}</a>
                            <a href="{{ $slider?->details[0]['url'] }}" class="btn-secondary glightbox">
                                <i class="bi bi-play-circle"></i>
                                <span>Watch Our Story</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="hero-image">
                        <img src="{{ $slider?->details[0]['original_image'] }}" alt="Corporate Business"
                            class="img-fluid">
                        <div class="floating-card" data-aos="fade-up" data-aos-delay="300">
                            <div class="card-content">
                                <div class="slogan">{{ $siteSetting->short_title }}</div>
                                {{-- <div class="metric">
                                    <span class="number">150+</span>
                                    <span class="label">Successful Projects</span>
                                </div>
                                <div class="metric">
                                    <span class="number">98%</span>
                                    <span class="label">Client Satisfaction</span>
                                </div> --}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="hero-features">
            <div class="container section-title aos-init aos-animate" data-aos="fade-up">
                <h2>Our Core Strengths</h2>
                <div class="row">
                    @foreach ($featurres as $featurre)
                        <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="feature-item">
                                <div class="icon">
                                    {!! $featurre->icon !!}
                                </div>
                                <h4>{{ $featurre->title }}</h4>
                                <p>{{ $featurre->description }}</p>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>

    </div>

</section><!-- /Hero Section -->
