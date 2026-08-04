@php
    $seo = GlobalHelper::get_page_seo('faq');
@endphp
@extends(themeBlade('layout.master'))
@section('title', 'FAQ')
@section('image', $seo->image_three ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')
@section('content')
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0">FAQ</h1>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li class="current">FAQ</li>
                </ol>
            </nav>
        </div>
    </div><!-- End Page Title -->

    <section id="privacy-2" class="privacy-2 section">
        <div class="container" data-aos="fade-up">
            <div class="text-center wow fadeIn" data-wow-delay="0.1s">
                @php
                    $pagesection = GlobalHelper::getPageSection(1, 'faq');
                @endphp
                <h1 class="mb-5">{{ $pagesection->page_title }}
                    <span class="text-uppercase text-primary bg-light px-2">
                        {{ $pagesection->sub_title }}
                    </span>
                </h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <p class="text-center mb-4">
                        {!! $pagesection->description !!}
                    </p>

                    <div class="wow fadeIn" data-wow-delay="0.3s">
                        <!-- FAQ Accordion -->
                        <div class="accordion" id="faqAccordion">
                            @foreach ($faq_datas as $index => $faq)
                                @php
                                    $show = '';
                                    if ($index == 0) {
                                        $show = 'show';
                                    }
                                @endphp
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading{{ $index }}">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#faq{{ $index }}" aria-expanded="true"
                                            aria-controls="faq{{ $index }}">
                                            <strong>
                                                <i>{{ $index + 1 }} . {{ $faq->question }}</i>
                                            </strong>
                                        </button>
                                    </h2>
                                    <div id="faq{{ $index }}" class="accordion-collapse collapse {{ $show }}"
                                        aria-labelledby="heading{{ $index }}" data-bs-parent="#faqAccordion">
                                        <div class="accordion-body">
                                            {!! $faq->answer !!}
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Start -->

    <!-- Contact End -->
@endsection
