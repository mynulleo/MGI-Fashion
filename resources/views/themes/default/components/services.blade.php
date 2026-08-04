<!-- Featured Services Section -->
<section id="featured-services" class="featured-services section light-background">

    <div class="container section-title" data-aos="fade-up" data-aos-delay="100">
        <h2>Our Services</h2>
        <div class="row g-5 mt-4">
            @foreach ($services as $service)
                <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="service-item">
                        <div class="service-icon">
                            {!! $service->icon !!}
                        </div>
                        <h3>{{ $service->title }}</h3>
                        {!! $service->description !!}
                        {{-- <a href="service-details.html" class="service-link">
                            <span>Explore Service</span>
                            <i class="bi bi-arrow-right"></i>
                        </a> --}}
                    </div>
                </div><!-- End Service Item -->
            @endforeach
        </div>
    </div>
</section><!-- /Featured Services Section -->
