<!-- Advantage Section Start -->
<section class="advantage-section section-padding fix section-bg">
    <div class="reel-shape float-bob-x">
        <img src="{{ without_cache('build/theme/img/advantage/kite-reel.png') }}" alt="image">
    </div>
    <div class="container">
        <div class="section-title center">
            <p class="sub-title wow fadeInUp">
                <span class="line-0"></span>
                Our Advantage
                <span class="line-1"></span>
            </p>
            <h2 class="char-animation">Why We Stand Out in the <br> Texora Industry</h2>
        </div>
    </div>
    <div class="advantage-wrapper">
        <div class="swiper advantage-slider">
            <div class="swiper-wrapper">
                @if(isset($features) && count($features) > 0)
                    @foreach($features as $index => $feature)
                        @php
                            $featureImg = !empty($feature->original_image) ? $feature->original_image : (!empty($feature->image) ? asset($feature->image) : without_cache('build/theme/img/advantage/advantage-' . (($index % 4) + 1) . '.jpg'));
                            $featureIcon = !empty($feature->icon) ? asset($feature->icon) : without_cache('build/theme/img/advantage/icon-' . (($index % 4) + 1) . '.svg');
                        @endphp
                        <div class="swiper-slide">
                            <div class="advantage-box-items">
                                <div class="advantage-content">
                                    <h3>{!! $feature->title !!}</h3>
                                    <div class="advantage-thumb">
                                        <img src="{{ $featureImg }}" alt="{{ $feature->title }}">
                                        <img src="{{ $featureImg }}" alt="{{ $feature->title }}">
                                    </div>
                                    <p>{!! Str::limit(strip_tags($feature->description ?? ''), 120) !!}</p>
                                </div>
                                <div class="advantage-btn-box">
                                    <a href="{{ route('page', 'about-us') }}" class="link-btn">Read More <i class="fa-solid fa-arrow-right"></i></a>
                                    <img src="{{ $featureIcon }}" alt="icon">
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="swiper-slide text-center py-5">
                        <p class="text-muted fs-5">No Data Found</p>
                    </div>
                @endif
            </div>
        </div>
    </div>
</section>
