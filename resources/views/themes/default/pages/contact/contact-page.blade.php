@php
    $seo = GlobalHelper::get_page_seo('Contact');
    $pageSection = GlobalHelper::getPageSection(3, 'contact');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "Contact Us | " . ($siteSetting->title ?? 'MGI Fashion'))
@section('image', $seo->image_three ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')

@section('content')
    <!-- breadcrumb section start -->
    <section class="breadcrumb-wrapper bg-cover fix" style="background-image: url('{{ without_cache('build/theme/img/inner-page/breadcroumb.jpg') }}');">
        <div class="container">
            <div class="page-heading wow fadeInUp" data-wow-delay=".3s">
                <h1>{{ $pageSection->page_title ?? 'Contact Us' }}</h1>
                <ul class="breadcrumb-list">
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li><i class="fa-solid fa-arrow-right"></i></li>
                    <li>{{ $pageSection->page_title ?? 'Contact Us' }}</li>
                </ul>
            </div>
        </div>
    </section>

    <!-- contact section start -->
    <section class="contact-section-3 section-padding fix">
        <div class="container">
            <div class="contact-wrapper-3">
                <div class="contact-area-top">
                    <h2>Our Contact Information</h2>
                    <div class="row g-4">
                        <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay=".3s">
                            <div class="contact-items">
                                <div class="icon">
                                    <img src="{{ without_cache('build/theme/img/contact/location01.png') }}" alt="image">
                                </div>
                                <div class="content">
                                    <h3>Our Address</h3>
                                    <p>{{ $siteSetting->address ?? 'Main Office, Bangladesh' }}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay=".5s">
                            <div class="contact-items">
                                <div class="icon">
                                    <img src="{{ without_cache('build/theme/img/contact/phone01.png') }}" alt="image">
                                </div>
                                <div class="content">
                                    <h3>Contact Number</h3>
                                    @if(!empty($siteSetting->mobile1))
                                        <p><a href="tel:{{ $siteSetting->mobile1 }}">Mobile: {{ $siteSetting->mobile1 }}</a></p>
                                    @endif
                                    @if(!empty($siteSetting->contact_email))
                                        <p><a href="mailto:{{ $siteSetting->contact_email }}">Email: {{ $siteSetting->contact_email }}</a></p>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay=".7s">
                            <div class="contact-items">
                                <div class="icon">
                                    <img src="{{ without_cache('build/theme/img/contact/clock01.png') }}" alt="image">
                                </div>
                                <div class="content">
                                    <h3>Opening Hour</h3>
                                    <p>Saturday - Thursday: 9:00 AM - 6:00 PM<br>Friday: Closed</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact-area-bottom">
                    <div class="row g-5">
                        <div class="col-lg-6 wow fadeInUp" data-wow-delay=".5s">
                            <div class="google-map">
                                @if(!empty($siteSetting->map_link))
                                    <iframe src="{{ $siteSetting->map_link }}" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                @else
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.902442430137!2d90.391080!3d23.750860!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjPCsDQ1JzAzLjEiTiA5MMKwMjMnMjctOSJF!5e0!3m2!1sen!2sbd!4v1641984054261!5m2!1sen!2sbd" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                @endif
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="contact-from">
                                <h3 class="mb-3">Get In Touch</h3>
                                
                                @if ($errors->any())
                                    <div class="alert alert-danger mb-3">
                                        <ul class="mb-0">
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif

                                @if (session('success'))
                                    <div class="alert alert-success mb-3">
                                        {{ session('success') }}
                                    </div>
                                @endif

                                <form action="{{ route('contact.store') }}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-12 mb-3 wow fadeInUp" data-wow-delay=".2s">
                                            <input type="text" name="name" value="{{ old('name') }}" placeholder="Full Name *" class="inptFld" required>
                                        </div>

                                        <div class="col-sm-12 mb-3 wow fadeInUp" data-wow-delay=".4s">
                                            <input type="email" name="email" value="{{ old('email') }}" placeholder="Email Address *" class="inptFld" required>
                                        </div>
                                        
                                        <div class="col-sm-12 mb-3 wow fadeInUp" data-wow-delay=".6s">
                                            <input type="text" name="phone" value="{{ old('phone') }}" placeholder="Phone Number" class="inptFld">
                                        </div>

                                        <div class="col-sm-12 mb-3 wow fadeInUp" data-wow-delay=".7s">
                                            <input type="text" name="subject" value="{{ old('subject') }}" placeholder="Subject *" class="inptFld" required>
                                        </div>

                                        <div class="col-sm-12 mb-3 wow fadeInUp" data-wow-delay=".8s">
                                            <textarea name="message" class="inptFld mb-0" placeholder="Type Your Message *" rows="5" required>{{ old('message') }}</textarea>
                                        </div>            
                                    </div>
                                    <div class="contact-button mt-3 wow fadeInUp" data-wow-delay=".9s">
                                        <button type="submit" class="theme-btn">
                                            SEND A MESSAGE <i class="fa-solid fa-arrow-right"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
