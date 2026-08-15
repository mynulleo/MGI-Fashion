<!-- Offcanvas Area Start -->
<div class="fix-area">
    <div class="offcanvas__info">
        <div class="offcanvas__wrapper">
            <div class="offcanvas__content">
                <div class="offcanvas__top mb-5 d-flex justify-content-between align-items-center">
                    <div class="offcanvas__logo">
                        <a href="{{ route('home') }}">
                            <img src="{{ $siteSetting->logo_two ?? without_cache('build/theme/img/logo/black-logo.svg') }}"
                                alt="logo-img" style="width:100px;">
                        </a>
                    </div>
                    <div class="offcanvas__close">
                        <button>
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <p class="text d-none d-xl-block">
                    {{ $siteSetting->about_us ?? 'We are a leading Texora & garment manufacturing company dedicated producing high quality fabrics and apparel for global brands.' }}
                </p>
                <div class="mobile-menu fix mb-3"></div>
                <div class="offcanvas__contact">
                    <h4>Contact Info</h4>
                    <ul>
                        @if (!empty($siteSetting->address))
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon">
                                    <i class="fal fa-map-marker-alt"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a target="_blank" href="#">{{ $siteSetting->address }}</a>
                                </div>
                            </li>
                        @endif
                        @if (!empty($siteSetting->contact_email))
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="fal fa-envelope"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a
                                        href="mailto:{{ $siteSetting->contact_email }}">{{ $siteSetting->contact_email }}</a>
                                </div>
                            </li>
                        @endif
                        @if (!empty($siteSetting->mobile1))
                            <li class="d-flex align-items-center">
                                <div class="offcanvas__contact-icon mr-15">
                                    <i class="far fa-phone"></i>
                                </div>
                                <div class="offcanvas__contact-text">
                                    <a href="tel:{{ $siteSetting->mobile1 }}">{{ $siteSetting->mobile1 }}</a>
                                </div>
                            </li>
                        @endif
                    </ul>
                    <a href="{{ route('contact') }}" class="theme-btn mt-4">
                        Contact Us
                        <i class="fa-solid fa-arrow-up-right"></i>
                    </a>
                    <div class="social-icon d-flex align-items-center">
                        @if (!empty($siteSetting->fb))
                            <a href="{{ $siteSetting->fb }}"><i class="fab fa-facebook-f"></i></a>
                        @endif
                        @if (!empty($siteSetting->tw))
                            <a href="{{ $siteSetting->tw }}"><i class="fab fa-twitter"></i></a>
                        @endif
                        @if (!empty($siteSetting->yt))
                            <a href="{{ $siteSetting->yt }}"><i class="fab fa-youtube"></i></a>
                        @endif
                        @if (!empty($siteSetting->ln))
                            <a href="{{ $siteSetting->ln }}"><i class="fab fa-linkedin-in"></i></a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="offcanvas__overlay"></div>

<!-- Header Section Start -->
<header id="header-sticky" class="header-1 header-one">
    <div class="container">
        <div class="mega-menu-wrapper">
            <div class="header-main">
                <a href="{{ route('home') }}" class="logo">
                    <img src="{{ $siteSetting->logo_two ?? without_cache('build/theme/img/logo/black-logo.svg') }}"
                        alt="logo" style="width:100px;">
                </a>
                <div class="mean__menu-wrapper">
                    <div class="main-menu">
                        <nav id="mobile-menu">
                            {!! WebsiteMenus::buildMenuHtml($frontMenus) !!}
                        </nav>
                    </div>
                </div>

                <div class="header-right d-flex justify-content-end align-items-center">
                    <a href="{{ route('contact') }}" class="theme-btn">
                        Contact Us <i class="fa-solid fa-arrow-right"></i>
                    </a>
                    <div class="header__hamburger d-xl-none my-auto">
                        <div class="sidebar__toggle">
                            <i class="fa-regular fa-bars"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
