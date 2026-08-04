@php
    $seo = GlobalHelper::get_page_seo('Contact');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "Contact | $siteSetting->title")
@section('image', $seo->image_three ?? '')
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')
@section('content')
    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
        <div class="container d-lg-flex justify-content-between align-items-center">
            <h1 class="mb-2 mb-lg-0">Contact</h1>
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li class="current">Contact</li>
                </ol>
            </nav>
        </div>
    </div><!-- End Page Title -->
    <section id="privacy-2" class="privacy-2 section contact">
        <div class="container" data-aos="fade-up">
            <div class="row align-items-stretch">
                <div class="col-lg-7 order-lg-1 order-2" data-aos="fade-right" data-aos-delay="200">
                    <div class="contact-form-container">
                        <div class="form-intro">
                            @php
                                $pagesection = GlobalHelper::getPageSection(3, 'contact');
                            @endphp
                            <h2>{{ $pagesection->page_title }}</h2>
                            {!! $pagesection->description !!}
                        </div>
                        <div>
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif
                        </div>

                        <form action="{{ route('contact.store') }}" method="post" class="php-email-form contact-form">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-field">
                                        <input type="text" name="name" class="form-input" id="Name"
                                            placeholder="Your Name" value="{{ old('name') }}" required="">
                                        <label for="Name" class="field-label">Name</label>
                                    </div>
                                    <small id="errorName" class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-field">
                                        <input type="email" class="form-input" name="email" id="ContactEmail"
                                            placeholder="Your Email" required="" value="{{ old('email') }}">
                                        <label for="ContactEmail" class="field-label">Email</label>
                                    </div>
                                    <small id="errorEmail"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-field">
                                        <input type="tel" class="form-input" name="phone" id="Phone"
                                            placeholder="Your Phone" {{ old('phone') }}>
                                        <label for="Phone" class="field-label">Phone</label>
                                    </div>
                                    <small id="errorPhone"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-field">
                                        <input type="text" class="form-input" name="subject" id="Subject"
                                            placeholder="Subject" required="" value="{{ old('subject') }}">
                                        <label for="Subject" class="field-label">Subject</label>
                                    </div>
                                    <small id="errorSubject"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-field message-field">
                                        <textarea class="form-input message-input" name="message" id="Message" rows="5"
                                            placeholder="Tell us about your project" required=""> {{ old('message') }} </textarea>
                                        <label for="Message" class="field-label">Message</label>
                                        <small class="text-muted mt-1 d-block">Characters used: <span
                                                id="charCount">0</span>/500</small>
                                    </div>
                                    <small id="error" class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>

                                </div>
                            </div>

                            <div class="my-3">
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Your message has been sent. Thank you!</div>
                            </div>

                            <button type="submit" class="send-button">
                                Send Message
                                <span class="button-arrow">→</span>
                            </button>
                        </form>
                    </div>
                </div>

                <div class="col-lg-5 order-lg-2 order-1" data-aos="fade-left" data-aos-delay="300">
                    <div class="contact-sidebar">
                        <div class="contact-header">
                            @php
                                $pagesection = GlobalHelper::getPageSection(3, 'get-in-touch');
                            @endphp

                            <h3>{{ $pagesection->page_title }}</h3>
                            {!! $pagesection->description !!}
                        </div>

                        <div class="contact-methods">
                            <div class="contact-method" data-aos="fade-in" data-aos-delay="350">
                                <div class="contact-icon">
                                    <i class="bi bi-geo-alt"></i>
                                </div>
                                <div class="contact-details">
                                    <span class="method-label">Address</span>
                                    <p>{{ $siteSetting->address ?? '' }}</p>
                                </div>
                            </div>

                            <div class="contact-method" data-aos="fade-in" data-aos-delay="400">
                                <div class="contact-icon">
                                    <i class="bi bi-envelope"></i>
                                </div>
                                <div class="contact-details">
                                    <span class="method-label">Email</span>
                                    <p>{{ $siteSetting->contact_email ?? '' }}</p>
                                </div>
                            </div>

                            <div class="contact-method" data-aos="fade-in" data-aos-delay="450">
                                <div class="contact-icon">
                                    <i class="bi bi-telephone"></i>
                                </div>
                                <div class="contact-details">
                                    <span class="method-label">Phone</span>
                                    <p>{{ $siteSetting->mobile1 ?? '' }}</p>
                                </div>
                            </div>

                            <div class="contact-method" data-aos="fade-in" data-aos-delay="500">
                                <div class="contact-icon">
                                    <i class="bi bi-clock"></i>
                                </div>
                                <div class="contact-details">
                                    <span class="method-label">Hours</span>
                                    <p>Sunday - Thursday: 9AM - 6PM
                                        <br>Friday: Weekend
                                        <br>Saturday: Weekend
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="connect-section" data-aos="fade-up" data-aos-delay="550">
                            <span class="connect-label">Connect with us</span>
                            <div class="social-links">
                                <a href="{{ $siteSetting->ln }}" class="social-link">
                                    <i class="bi bi-linkedin"></i>
                                </a>
                                <a href="{{ $siteSetting->tw }}" class="social-link">
                                    <i class="bi bi-twitter-x"></i>
                                </a>
                                <a href="{{ $siteSetting->yt }}" class="social-link">
                                    <i class="bi bi-instagram"></i>
                                </a>
                                <a href="{{ $siteSetting->fb }}" class="social-link">
                                    <i class="bi bi-facebook"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

@push('styles')
    <style>
        .border-red {
            border: 1px solid red !important;
        }

        .invalid {
            border: 2px solid red !important;
        }

        .hide {
            display: none;
        }
    </style>
@endpush


@push('scripts')
    <script>
        $(document).ready(function() {
            const name = $('#Name');
            const email = $('#ContactEmail');
            const phone = $('#Phone');
            const subject = $('#Subject');
            const message = $('#Message');
            const errorName = $('#errorName');
            const errorEmail = $('#errorEmail');
            const errorPhone = $('#errorPhone');
            const errorSubject = $('#errorSubject');
            const errorMessage = $('#error');
            const charCount = $('#charCount');

            // Name validation
            function checkName() {
                const val = name.val().trim();
                const regex = /^[a-zA-Z-. ]{2,30}$/;
                if (!regex.test(val)) {
                    errorName.text('Required min 2 to max 30 letters');
                    name.addClass('border-red');
                    return false;
                }
                errorName.text('');
                name.removeClass('border-red');
                return true;
            }

            // Email validation
            function checkEmail() {
                const val = email.val().trim();
                if (val === '') {
                    errorEmail.text('Email is required');
                    email.addClass('border-red');
                    return false;
                }
                const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!regex.test(val)) {
                    errorEmail.text('Valid email is required');
                    email.addClass('border-red');
                    return false;
                }
                errorEmail.text('');
                email.removeClass('border-red');
                return true;
            }

            // Phone validation
            // ===== Phone Input Validation with intl-tel-input =====
            const input = phone[0];
            const errorMap = ["Invalid number", "Invalid country code", "Invalid number"];


            function checkPhone() {
                phone.removeClass("border-red");
                errorPhone.text("").addClass("hide");

                const val = phone.val().trim();

                // শূন্য থাকলে
                if (val === "") {
                    errorPhone.text("Phone number is required").removeClass("hide");
                    phone.addClass("border-red");
                    return false;
                }

                // ১১ ডিজিট চেক
                if (!/^\d{11}$/.test(val)) {
                    errorPhone.text("Phone number must be exactly 11 digits").removeClass("hide");
                    phone.addClass("border-red");
                    return false;
                }

                // 01 দিয়ে শুরু হচ্ছে কিনা চেক
                if (!/^01\d{9}$/.test(val)) {
                    errorPhone.text("Phone number must start with 01").removeClass("hide");
                    phone.addClass("border-red");
                    return false;
                }

                return true;
            }

            // Subject validation
            function checkSubject() {
                const val = subject.val().trim();
                const regex = /^[a-zA-Z-. ]{2,100}$/;
                if (!regex.test(val)) {
                    errorSubject.text('Required min 2 to max 100 letters');
                    subject.addClass('border-red');
                    return false;
                }
                errorSubject.text('');
                subject.removeClass('border-red');
                return true;
            }

            // Message validation
            function checkMessage() {
                let val = message.val();
                let len = val.length;

                if (len > 500) {
                    val = val.substring(0, 500);
                    message.val(val); // Truncate extra input
                    len = 500;
                    errorMessage.text('Maximum 500 letters allowed');
                    message.addClass('border-red');
                    charCount.text(len);
                    return false;
                }

                charCount.text(len);

                if (len < 10) {
                    errorMessage.text('Minimum 10 letters required');
                    message.addClass('border-red');
                    return false;
                }

                errorMessage.text('');
                message.removeClass('border-red');
                return true;
            }

            // Live validation
            name.on('input', checkName);
            email.on('input', checkEmail);
            phone.on('input', checkPhone);
            subject.on('input', checkSubject);
            message.on('input', checkMessage);

            // On form submit
            $('#contact-form').on('submit', function(e) {
                alert('1');
                const validName = checkName();
                const validEmail = checkEmail();
                const validPhone = checkPhone();
                const validSubject = checkSubject();
                const validMessage = checkMessage();

                if (!validName || !validEmail || !validPhone || !validSubject || !validMessage) {
                    e.preventDefault(); // Stop form submission
                }
            });
        });
    </script>
@endpush
