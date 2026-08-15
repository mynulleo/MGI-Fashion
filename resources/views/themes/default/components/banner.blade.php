<!-- Hero Section Start -->
<section class="hero-section-2 hero-1 fix">
    <div class="swiper banner-active">
        <div class="swiper-wrapper">
            @if (isset($slider) && $slider->details && count($slider->details) > 0)
                @foreach ($slider->details as $slide)
                    @php
                        $slideBg = !empty($slide->original_image)
                            ? $slide->original_image
                            : (!empty($slide->image)
                                ? asset($slide->image)
                                : without_cache('build/theme/img/hero/hero-bg.jpg'));
                    @endphp
                    <div class="swiper-slide">
                        <div class="hero-height">
                            <div class="hero-bg bg-cover" style="background-image: url('{{ $slideBg }}');"></div>
                            <div class="container-fluid">
                                <div class="row justify-content-center justify-content-xl-start">
                                    <div class="col-xxl-8 col-xl-10 col-lg-10">
                                        <div class="hero-content">
                                            @if (!empty($slide->sub_title))
                                                <span class="sub-title">
                                                    {{ $slide->sub_title }}
                                                </span>
                                            @endif
                                            <h1>{!! $slide->title !!}</h1>
                                            @if (!empty($slide->description))
                                                <p>{!! $slide->description !!}</p>
                                            @endif
                                        </div>
                                        @if (!empty($slide->button_name))
                                            <div class="hero-button">
                                                <a href="{{ $slide->button_url ?? route('contact') }}"
                                                    class="theme-btn">
                                                    {{ $slide->button_name }} <i class="fa-solid fa-arrow-right"></i>
                                                </a>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="swiper-slide text-center py-5">
                    <div class="hero-height d-flex align-items-center justify-content-center">
                        <p class="text-muted fs-4">No Slider Found</p>
                    </div>
                </div>
            @endif
        </div>
    </div>
    <div class="social-icon-area">
        <div class="line-1"></div>
        <ul class="social-icon">
            @if (!empty($siteSetting->fb))
                <li><a href="{{ $siteSetting->fb }}"><i class="fab fa-facebook-f"></i></a></li>
            @endif
            @if (!empty($siteSetting->tw))
                <li><a href="{{ $siteSetting->tw }}"><i class="fab fa-twitter"></i></a></li>
            @endif
            @if (!empty($siteSetting->yt))
                <li><a href="{{ $siteSetting->yt }}"><i class="fab fa-youtube"></i></a></li>
            @endif
            @if (!empty($siteSetting->ln))
                <li><a href="{{ $siteSetting->ln }}"><i class="fab fa-linkedin-in"></i></a></li>
            @endif
        </ul>
        <span>Follow</span>
    </div>
    <div class="swiper-dot">
        <div class="dot"></div>
    </div>
</section>
