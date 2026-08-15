<!-- Testimonial Section Start -->
<section class="testimonial-section section-padding fix bg-cover"
    style="background-image: url('{{ without_cache('build/theme/img/new/testimonial-bg.jpg') }}');">
    <div class="container">
        @php
            $pageSection = GlobalHelper::getPageSection(1, 'customer-testimonials');
        @endphp
        <div class="section-title">
            <span class="sub-title text-white wow fadeInUp">
                {{ !empty($pageSection->page_title) && $pageSection->page_title != 'undefined' ? $pageSection->page_title : 'Customer Testimonials' }}
            </span>
            <h2 class="char-animation text-white">
                {{ $pageSection->title ?? 'Comments Regarding The MGI FASHION' }}
            </h2>
        </div>
        <div class="row">
            <div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".2s">
                <div class="testi-client-info">

                    <h3 class="title">
                        {{ $pageSection->sub_title ?? '' }}
                    </h3>
                    <div class="title-2 text-white">
                        {!! $pageSection->description ?? '' !!}
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".4s">
                <div class="testi-image">
                    <img src="{{ !empty($pageSection->image_two) ? $pageSection->image_two : (!empty($pageSection->original_image) ? $pageSection->original_image : without_cache('build/theme/img/new/testi-img-01.jpg')) }}"
                        alt="img">
                </div>
            </div>
            <div class="col-xl-6 col-lg-9">
                <div class="testi-content">
                    <div class="swiper testimonial-slider">
                        <div class="swiper-wrapper">
                            @if (isset($testimonials) && count($testimonials) > 0)
                                @foreach ($testimonials as $testimonial)
                                    @php
                                        $testiImg = !empty($testimonial->original_image)
                                            ? $testimonial->original_image
                                            : '';
                                    @endphp
                                    <div class="swiper-slide">
                                        <div class="testi-content-items">
                                            <h3 class="title-3">
                                                “{!! strip_tags($testimonial->comment ?? ($testimonial->description ?? '')) !!}”
                                            </h3>
                                            <div class="client-info">
                                                <div class="client-img">
                                                    <img src="{{ $testiImg }}" alt="{{ $testimonial->name }}">
                                                </div>
                                                <div class="content">
                                                    <h3 class="title-4">{{ $testimonial->name }}</h3>
                                                    <p>{{ $testimonial->designation }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            @else
                                <div class="swiper-slide text-center py-4">
                                    <p class="text-white fs-5">No Data Found</p>
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="array-button">
                        <button class="array-prev">
                            <i class="fa-solid fa-arrow-left"></i>
                        </button>
                        <button class="array-next">
                            <i class="fa-solid fa-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
