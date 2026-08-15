<!-- Choose Us & Video Section Start -->
<section class="choose-us-section section-padding section-bg fix">
    <div class="container">
        <div class="row g-4">
            <div class="col-xl-4 col-lg-4 col-md-5">
                <div class="choose-image-items">
                    @php
                        $pagesection = GlobalHelper::getPageSection(1, 'why-choose-us');
                    @endphp
                    <div class="section-title mb-0">
                        <span class="sub-title mb-0 wow fadeInUp">
                            {{ !empty($pagesection->sub_title) && $pagesection->sub_title != 'undefined' ? $pagesection->sub_title : 'Why Global Brands Trust Us' }}
                            <span class="line-1"></span>
                        </span>
                    </div>
                    <div class="choose-image fix wow fadeInUp" data-wow-delay=".5s">
                        <img data-speed=".8"
                            src="{{ !empty($pagesection->original_image) ? $pagesection->original_image : '' }}">
                        @if (!empty($siteSetting->title))
                            <div class="text">
                                <span>{{ $siteSetting->title }}</span>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-xl-8 col-lg-8 col-md-7">
                <div class="choose-content">
                    <h2 class="char-animation">
                        {{ $pagesection->title ?? '' }}</h2>
                    <div class="choose-description wow fadeInUp" data-wow-delay=".3s">
                        {!! $pagesection->description ?? '' !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Video Section Start -->
@php
    $videoSection = GlobalHelper::getPageSection(1, 'intro-video');
@endphp
<div class="video-section fix">
    <div class="video-wrapper">
        <div class="video fix">
            <img data-speed=".8"
                src="{{ !empty($videoSection->original_image) ? $videoSection->original_image : (!empty($pagesection->original_image) ? $pagesection->original_image : without_cache('build/theme/img/vedio/bg.jpg')) }}"
                alt="img">
            <a href="{{ $videoSection->video_url ?? ($pagesection->video_url ?? 'https://www.youtube.com/watch?v=Cn4G2lZ_g2I') }}"
                class="video-btn video-popup">
                <img src="{{ without_cache('build/theme/img/vedio/play.svg') }}" alt="img" class="play-icon">
                <div class="text-img">
                    <img src="{{ without_cache('build/theme/img/vedio/play-text.png') }}" alt="image">
                </div>
            </a>
        </div>
    </div>
</div>
