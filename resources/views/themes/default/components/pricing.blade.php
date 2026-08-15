<!-- Pricing Section Start -->
<section class="pricing-section section-padding fix section-bg">
    <div class="container">
        <div class="section-title text-center">
            <span class="sub-title wow fadeInUp">
                Our Pricing Plans
            </span>
            <h2 class="char-animation">
                Flexible Manufacturing Solutions For <br> Every Business Size
            </h2>
        </div>
        <div class="row">
            @if(isset($packages) && count($packages) > 0)
                @foreach ($packages as $index => $package)
                    @php
                        $pkgImg = !empty($package->original_image) ? $package->original_image : (!empty($package->image) ? asset($package->image) : without_cache('build/theme/img/new/pricing-0' . (($index % 3) + 1) . '.jpg'));
                    @endphp
                    <div class="col-xl-4 col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="{{ ($index + 1) * 0.2 }}s">
                        <div class="pricing-box-items">
                            <h3 class="title">{{ $package->title ?? $package->name }}</h3>
                            <p>{{ $package->short_description ?? 'Affordable price plan for industrial purposes…' }}</p>
                            <div class="pricing-thumb">
                                <img src="{{ $pkgImg }}" alt="img">
                            </div>
                            <h3 class="title-2">${{ $package->price }} <sub>/{{ $package->duration ?? 'Monthly' }}</sub></h3>
                            <a href="{{ route('contact') }}" class="theme-btn">
                                Request a Quote <i class="fa-solid fa-arrow-right"></i>
                            </a>
                            <h3 class="title-3">{{ $package->tagline ?? 'Best for Bulk Orders' }}</h3>
                            @if(!empty($package->features))
                                <ul class="pricing-list">
                                    @foreach((is_array($package->features) ? $package->features : json_decode($package->features, true) ?? []) as $feature)
                                        <li>
                                            <img src="{{ without_cache('build/theme/img/new/pricing-check.svg') }}" alt="img">
                                            {{ is_array($feature) ? ($feature['title'] ?? '') : $feature }}
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-12 text-center py-5">
                    <p class="text-muted fs-5">No Data Found</p>
                </div>
            @endif
        </div>
    </div>
</section>
