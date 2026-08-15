<!-- About Section Start -->
<section class="about-section fix section-padding section-bg">
    <div class="container">
        <div class="about-wrapper-one">
            <div class="row g-4">
                <div class="col-xl-7 col-lg-6">
                    <div class="about-content">
                        <div class="section-title mb-0">
                            <span class="sub-title wow fadeInUp">
                                About Us
                            </span>
                            @php
                                $pagesection = GlobalHelper::getPageSection(1, 'about-us');
                            @endphp
                            <h2 class="char-animation">
                                {{ $pagesection->title ?? '' }}
                            </h2>
                        </div>
                        <p class="about-text wow fadeInUp">
                            {!! $pagesection->description ?? '' !!}
                        </p>

                        <div class="about-bottom-area wow fadeInUp" data-wow-delay=".8s">
                            <a href="{{ route('page', 'about-us') }}" class="theme-btn">
                                Explore More <i class="fa-solid fa-arrow-right"></i>
                            </a>
                            <div class="client-phn-area">
                                <div class="phone-icon">
                                    <img src="{{ without_cache('build/theme/img/about/phone.svg') }}" alt="image">
                                </div>
                                <div class="client-content">
                                    <p>Call Center 24/7</p>
                                    <a
                                        href="tel:{{ $siteSetting->mobile1 ?? '' }}">{{ $siteSetting->mobile1 ?? '+1 (212)-578-5758' }}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-6 wow fadeInUp" data-wow-delay=".3s">
                    <div class="about-image-items">
                        {{-- <div class="about-image-2">
                            <img src="{{ $pagesection->image_one }}" alt="img">
                        </div> --}}
                        <div class="about-image fix wow fadeInUp" data-wow-delay=".5s">
                            <img src="{{ $pagesection->image_one }}" alt="image">
                        </div>
                        <p class="text">{{ $siteSetting->title ?? '' }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
