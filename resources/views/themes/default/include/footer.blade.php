<!-- Footer Section Start -->
<footer class="footer-section bg-cover fix"
    style="background-image: url('{{ without_cache('build/theme/img/footer/bg-1.jpg') }}');">
    <div class="container">
        <div class="footer-widgets-wrapper">
            <div class="row">
                <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 wow fadeInUp" data-wow-delay=".2s">
                    <div class="footer-widget-items">
                        @php
                            $footerText = GlobalHelper::getPageSection(1, 'footer-text');
                        @endphp
                        <div class="widget-content">
                            <p class="text-white">
                                {!! $footerText->description ?? '' !!}
                            </p>
                            {{-- <h3 class="border-text">Since 1999</h3> --}}
                        </div>
                    </div>
                </div>
                <div class="col-xxl-2 col-xl-3 col-lg-3 col-md-4 col-sm-6 col-6 wow fadeInUp" data-wow-delay=".4s">
                    <div class="footer-widget-items">
                        <div class="widget-head">
                            <h4>Quick Links</h4>
                        </div>
                        <div class="widget-content">
                            {!! WebsiteMenus::footerMenu($footerMenu) !!}
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-6 col-6 wow fadeInUp" data-wow-delay=".6s">
                    <div class="footer-widget-items">
                        <div class="widget-head">
                            <h4>Our Solutions</h4>
                        </div>
                        <div class="widget-content">
                            {!! WebsiteMenus::footerServicesMenu() !!}
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 col-xl-5 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay=".8s">
                    <div class="footer-widget-items">
                        <div class="widget-head">
                            <h4>Contact Info</h4>
                        </div>
                        <div class="widget-content">
                            <div class="contact-list">
                                @if (!empty($siteSetting->address))
                                    <p class="contact-tittle">{{ $siteSetting->address }}</p>
                                @endif
                                @if (!empty($siteSetting->contact_email))
                                    <p>
                                        <a href="mailto:{{ $siteSetting->contact_email }}">
                                            {{ $siteSetting->contact_email }}
                                        </a>
                                    </p>
                                @endif
                                @if (!empty($siteSetting->mobile1))
                                    <p>
                                        <a href="tel:{{ $siteSetting->mobile1 }}">
                                            {{ $siteSetting->mobile1 }}
                                        </a>
                                    </p>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-contact-area">
            <div class="row g-5">
                <div class="col-xl-6 wow fadeInUp" data-wow-delay=".6s">
                    <div class="client-area">
                        <div class="phone-box">
                            <div class="phone">
                                <img src="{{ without_cache('build/theme/img/footer/phone.svg') }}" alt="img">
                            </div>
                            <div class="content">
                                <span>Give us a call</span>
                                <h4>
                                    <a href="tel:{{ $siteSetting->mobile1 ?? '+1234560789' }}">
                                        {{ $siteSetting->mobile1 ?? '+123 4560 789' }}
                                    </a>
                                </h4>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-xl-6 wow fadeInUp client-area" data-wow-delay=".8s">
                    <ul class="social-icon">
                        @if (!empty($siteSetting->fb))
                            <li><a href="{{ $siteSetting->fb }}"><i class="fab fa-facebook-f"></i></a></li>
                        @endif
                        @if (!empty($siteSetting->tw))
                            <li><a href="{{ $siteSetting->tw }}"><i class="fab fa-twitter"></i></a></li>
                        @endif
                        @if (!empty($siteSetting->ln))
                            <li><a href="{{ $siteSetting->ln }}"><i class="fab fa-linkedin-in"></i></a></li>
                        @endif
                        @if (!empty($siteSetting->yt))
                            <li><a href="{{ $siteSetting->yt }}"><i class="fa-brands fa-youtube"></i></a></li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
