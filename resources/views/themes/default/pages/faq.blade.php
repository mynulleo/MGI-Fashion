@php
    $seo = GlobalHelper::get_page_seo('faq');
    $pageSection = GlobalHelper::getPageSection(1, 'faq');
@endphp
@extends(themeBlade('layout.master'))
@section('title', 'FAQ')
@section('image', $seo->image_three ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')

@section('content')
    <!-- breadcrumb section start -->
    <section class="breadcrumb-wrapper bg-cover fix"
        style="background-image: url('{{ without_cache('build/theme/img/inner-page/breadcroumb.jpg') }}');">
        <div class="container">
            <div class="page-heading wow fadeInUp" data-wow-delay=".3s">
                <h1>Frequently Asked Questions</h1>
                <ul class="breadcrumb-list">
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li><i class="fa-solid fa-arrow-right"></i></li>
                    <li>{{ 'FAQs' }}</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- faq section start -->
    <section class="faq-section section-padding bg-white fix">
        <div class="container">
            <div class="faq-wrapper">
                <div class="row g-4">
                    <div class="col-lg-7 wow fadeInUp" data-wow-delay=".6s">
                        <div class="faq-content">
                            <div class="section-title mb-0">
                                <p class="sub-title wow fadeInUp">
                                    {{ !empty($pageSection->sub_title) && $pageSection->sub_title != 'undefined' ? $pageSection->sub_title : 'Frequently Asked Questions' }}
                                    <span class="line-1"></span>
                                </p>
                                <h2 class="char-animation">
                                    {{ $pageSection->title ?? 'Assisting you in comprehending our Texora offerings' }}</h2>
                            </div>
                            <div class="faq-text wow fadeInUp" data-wow-delay=".3s">
                                {!! $pageSection->description ??
                                    'Texora & Garment Factory website, the FAQ section should address B2B buyer concerns MOQ, lead time, quality control, export, customization, etc.' !!}
                            </div>
                            <div class="client-info-items wow fadeInUp" data-wow-delay=".5s">
                                <div class="client-info-top">
                                    <img src="{{ without_cache('build/theme/img/new-item/client-group.png') }}"
                                        alt="img">
                                    <span>people are choosing us for Texora work</span>
                                </div>
                                <div class="client-info-bottom">
                                    @if (!empty($siteSetting->mobile1))
                                        <div class="contact-info">
                                            <div class="icon">
                                                <img src="{{ without_cache('build/theme/img/new-item/phone-icon.png') }}"
                                                    alt="img">
                                            </div>
                                            <div class="content">
                                                <p>call us any time</p>
                                                <a href="tel:{{ $siteSetting->mobile1 }}"
                                                    class="info-link">{{ $siteSetting->mobile1 }}</a>
                                            </div>
                                        </div>
                                    @endif
                                    @if (!empty($siteSetting->contact_email))
                                        <div class="contact-info">
                                            <div class="icon">
                                                <img src="{{ without_cache('build/theme/img/new-item/mail-icon.png') }}"
                                                    alt="img">
                                            </div>
                                            <div class="content">
                                                <p>Email Us</p>
                                                <a
                                                    href="mailto:{{ $siteSetting->contact_email }}">{{ $siteSetting->contact_email }}</a>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="faq-items">
                            <div class="accordion" id="accordionExample">
                                @if (isset($faq_datas) && count($faq_datas) > 0)
                                    @foreach ($faq_datas as $index => $faq)
                                        @php
                                            $show = $index == 0 ? 'show' : '';
                                            $collapsed = $index == 0 ? '' : 'collapsed';
                                            $expanded = $index == 0 ? 'true' : 'false';
                                        @endphp
                                        <div class="accordion-item wow fadeInUp" data-wow-delay=".{{ ($index % 5) + 2 }}s">
                                            <h2 class="accordion-header" id="heading{{ $index }}">
                                                <button class="accordion-button {{ $collapsed }}" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapse{{ $index }}"
                                                    aria-expanded="{{ $expanded }}"
                                                    aria-controls="collapse{{ $index }}">
                                                    {{ $faq->question }}
                                                </button>
                                            </h2>
                                            <div id="collapse{{ $index }}"
                                                class="accordion-collapse collapse {{ $show }}" role="region"
                                                aria-labelledby="heading{{ $index }}"
                                                data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>{!! $faq->answer !!}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="text-center py-4">
                                        <p class="fs-5 text-muted">No FAQ Found</p>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
