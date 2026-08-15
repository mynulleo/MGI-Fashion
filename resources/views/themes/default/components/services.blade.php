<!-- Service Section Start -->
<section class="service-section-one fix section-padding">
    <div class="container">
        <div class="section-title text-center">
            <span class="sub-title wow fadeInUp">
                Our Services
            </span>
            <h2 class="char-animation">
                Complete Texora & Garment <br> Manufacturing Solutions
            </h2>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            @if (isset($services) && count($services) > 0)
                @foreach ($services as $index => $service)
                    @php
                        $serviceImg = !empty($service->original_image) ? $service->original_image : '';
                        $serviceIcon = !empty($service->original_image_small) ? $service->original_image_small : '';
                    @endphp
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 wow fadeInUp"
                        data-wow-delay="{{ ($index + 1) * 0.2 }}s">
                        <div class="service-box-one">
                            <div class="icon">
                                @if (!empty($serviceIcon))
                                    <img src="{{ $serviceIcon }}" alt="{{ $service->title }}">
                                @endif
                            </div>
                            <div class="content">
                                <h3 class="title">
                                    <a href="javascript:void(0)">{{ $service->title }}</a>
                                </h3>
                                <p>
                                    {!! Str::limit(strip_tags($service->description ?? ''), 120, '...') !!}
                                </p>
                            </div>
                            <div class="bg-image">
                                <img src="{{ $serviceImg }}" alt="{{ $service->title }}">
                            </div>
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
    {{-- <p class="ser-text wow fadeInUp" data-wow-delay=".9s">
        Don’t hesitate, contact us for better help and services. <a href="{{ route('contact') }}">See All Services <i
                class="fa-solid fa-arrow-right"></i></a>
    </p> --}}
</section>
