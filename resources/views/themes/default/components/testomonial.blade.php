  <!-- Services Section -->
  <section id="services" class="services section">
      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
          <h2>Services</h2>
          <p>{!! GlobalHelper::get_page_section('Home', 'Service', 'service') !!}</p>
      </div><!-- End Section Title -->
      <div class="container">
          <div class="row gy-4">
              @foreach ($services as $service)
                  <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                      <div class="service-item  position-relative">
                          <div class="icon">
                              <i class="bi bi-activity"></i>
                          </div>
                          <a href="#" class="stretched-link">
                              <h3>{{ $service->title ?? '' }}</h3>
                          </a>
                          <p>{!! Str::limit($service->description ?? '', 400, '...') !!}</p>
                      </div>
                  </div><!-- End Service Item -->
              @endforeach
          </div>
      </div>
  </section><!-- /Services Section -->
