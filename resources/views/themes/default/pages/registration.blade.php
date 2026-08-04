@php
    $seo = GlobalHelper::get_page_seo('Registration');
@endphp
@extends(themeBlade('layout.master'))
@section('title', "Registration | $siteSetting->title")
@section('type', 'text/html')
@section('url', url()->full())
@section('tag', is_array($seo->meta_tag ?? '') ? implode(', ', $seo->meta_tag ?? '') : $seo->meta_tag ?? '')
@section('description', $seo->meta_description ?? '')
@section('content')
    <!-- Hero Start -->
    <div class="container-fluid pb-5 bg-primary hero-header">
        <div class="container py-5">
            <div class="row g-3 align-items-center">
                <div class="col-lg-12 animated slideInRight">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb justify-content-center justify-content-lg-end mb-0">
                            <li class="breadcrumbitem"><a class="text-primary" href="{{ route('home') }}">হোম</a></li>
                            <li class="breadcrumbitem">/</li>
                            <li class="breadcrumbitem text-secondary active" aria-current="page">রেজিস্ট্রেশন</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->
    <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center wow fadeIn" data-wow-delay="0.1s">
                @php
                    $pagesection = GlobalHelper::getPageSection(2, 'registration');
                @endphp
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <p class="text-center mb-4">
                        {!! $pagesection?->description !!}
                    </p>
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
                    <div class="wow fadeIn" data-wow-delay="0.3s">
                        <form action="{{ route('registration.store') }}" method="POST" id="registration-form"
                            class="mt-4">
                            @csrf
                            <div class="row g-3">
                                <div class="col-md-12 text-center">
                                    <div class="d-inline-flex align-items-center gap-2 toggle-pill p-1">
                                        @php
                                            $year_active = '';
                                            $month_active = '';
                                            if ($period == 'yearly') {
                                                $year_active = 'active';
                                            } else {
                                                $month_active = 'active';
                                            }
                                        @endphp
                                        <input type="hidden" name="payment_period" value="{{ $period }}">
                                        <div class="px-3 py-1 rounded-pill {{ $month_active }}" id="label-month">মাসিক</div>
                                        <div class="px-1" style="width:90px">
                                            <div class="d-flex justify-content-between bg-transparent position-relative">
                                                <div id="billingToggle" class="bg-light rounded-pill p-1"
                                                    style="cursor:pointer; width:100%; display:flex; align-items:center; justify-content:space-between">
                                                    <div class="ms-2">
                                                        <small class="text-muted">Off</small>
                                                    </div>
                                                    <div class="me-2">
                                                        <small class="text-muted">On</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="px-3 py-1 rounded-pill {{ $year_active }} " id="label-year">বাৎসরিক
                                        </div>
                                    </div>
                                </div>
                                {{-- ✅ প্যাকেজ সিলেকশন --}}
                                <div class="col-12">
                                    <label class="fw-bold mb-2 d-block">একটি প্যাকেজ নির্বাচন করুন *</label>
                                </div>
                                {{-- ✅ প্যাকেজ সিলেকশন --}}
                                @foreach ($packages as $package)
                                    <div class="col-md-4">
                                        <div class="card h-100 shadow-sm border rounded p-4">
                                            <div class="form-check d-flex mb-3">
                                                <input type="radio" name="package_id" id="package_{{ $package->id }}"
                                                    value="{{ $package->id }}" class="form-check-input me-2"
                                                    {{ old('package_id', $package_id ?? '') == $package->id ? 'checked' : '' }}
                                                    required>
                                                <label class="form-check-label fw-bold" for="package_{{ $package->id }}">
                                                    {{ $package->title }}
                                                </label>
                                            </div>
                                            <div class="price-info">
                                                <p class="mb-1">রেজিস্ট্রেশন ফি:
                                                    <strong>{!! GlobalHelper::toBanglaDigits($package->registration_fee) !!} টাকা</strong>
                                                </p>
                                                <div class="d-flex align-items-baseline gap-2">
                                                    <div>প্রতি </div>
                                                    <div class="period">মাসে</div>
                                                    <div class="regpackageprice" data-month="{{ $package->price }}"
                                                        data-year="{{ $package->yearly_price }}">
                                                        {{ $package->price }}
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                                <small class="text-danger d-block mt-1 fw-medium">
                                    @error('package_id')
                                        {{ $message }}
                                    @enderror
                                </small>

                                {{-- ✅ বাসস্থানের নাম --}}
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input name="Organization_name" id="Organization_name" type="text"
                                            class="form-control" value="{{ old('Organization_name') }}"
                                            placeholder="eg: খান মঞ্জিল" aria-describedby="errorOrganizationName">
                                        <label for="Organization_name">বাসস্থানের নাম</label>
                                    </div>
                                    <small id="errorOrganizationName"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                {{-- ✅ মালিকের নাম --}}
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input name="owner_name" id="owner_name" type="text" class="form-control"
                                            value="{{ old('owner_name') }}" placeholder="eg: মোঃ জুয়েল"
                                            aria-describedby="errorOwnerName">
                                        <label for="owner_name">মালিকের নাম</label>
                                    </div>
                                    <small id="errorOwnerName"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                {{-- ✅ NID --}}
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input name="nid" id="nid" type="text" class="form-control"
                                            value="{{ old('nid') }}" placeholder="eg: 135678645"
                                            aria-describedby="errorNid">
                                        <label for="nid">জাতীয় পরিচয় পত্র</label>
                                    </div>
                                    <small id="errorNid"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                {{-- ✅ ইমেইল --}}
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input name="email" id="email" type="email" class="form-control"
                                            placeholder="E-mail" value="{{ old('email') }}"
                                            aria-describedby="errorEmail">
                                        <label for="email">ই মেইল</label>
                                    </div>
                                    <small id="errorEmail"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                {{-- ✅ মোবাইল --}}
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input name="mobile" id="mobile" type="tel"
                                            class="form-control shadow-none" placeholder="mobile"
                                            value="{{ old('mobile') }}" aria-describedby="errorMobile">
                                        <label for="mobile">মোবাইল</label>
                                    </div>
                                    <small id="errorMobile"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                {{-- ✅ ঠিকানা --}}
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea id="address" name="address" placeholder="বাড়ি #10, উত্তরা, ঢাকা ১২৩০"
                                            class="form-control shadow-none textarea" aria-describedby="errorAddress" style="height: 150px">{{ old('address') }}</textarea>
                                        <label for="address">ঠিকানা</label>
                                    </div>
                                    <small id="errorAddress"
                                        class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                </div>

                                {{-- ✅ Promo Code --}}
                                @if ($promocode)
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <input name="promo_code" id="promo_code" type="text"
                                                class="form-control shadow-none" placeholder="promo_code"
                                                value="{{ old('promo_code') }}" aria-describedby="errorPromoCode">
                                            <label for="mobile">প্রোমো কোড</label>
                                        </div>
                                        <small id="errorPromoCode"
                                            class="d-block w-100 text-danger mt-1 fw-medium erro_msg"></small>
                                    </div>
                                @endif

                                {{-- ✅ সাবমিট --}}
                                <div class="col-12">
                                    <input type="hidden" name="status" value="apply">
                                    <button class="btn btn-primary w-100 py-3" type="submit">রেজিস্ট্রেশন করুন</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
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
                const validName = checkName();
                const validEmail = checkEmail();
                const validPhone = checkPhone();
                const validSubject = checkSubject();
                const validMessage = checkMessage();

                if (!validName || !validEmail || !validPhone || !validSubject || !validMessage) {
                    e.preventDefault(); // Stop form submission
                }
            });

            // Period Switch start here
            const billingToggle = document.getElementById("billingToggle");
            const monthlyLabel = document.getElementById("label-month");
            const yearlyLabel = document.getElementById("label-year");
            @php
                $bool = false;
                if ($period == 'yearly') {
                    $bool = true;
                }
            @endphp
            let yearly = {{ $bool ? 'true' : 'false' }}; // default to yearly (matches UI)

            function updatePrices() {

                document.querySelectorAll(".regpackageprice").forEach((el) => {
                    const m = el.getAttribute("data-month");
                    const y = el.getAttribute("data-year");
                    const bm = toBanglaDigits(m);
                    const by = toBanglaDigits(y);
                    if (m === "0") {
                        el.textContent = "ফ্রী";
                    } else {
                        el.textContent = yearly ? "ট" + by : "ট" + bm;
                    }
                });
                document.querySelectorAll(".period").forEach((p) => {
                    p.textContent = yearly ? " বছেরে" : " মাসে";
                });

                if (yearly) {
                    yearlyLabel.classList.add("active");
                    monthlyLabel.classList.remove("active");
                } else {
                    monthlyLabel.classList.add("active");
                    yearlyLabel.classList.remove("active");
                }

                // update all inputs
                document.querySelectorAll("input[name='payment_period']").forEach((input) => {
                    input.value = yearly ? "yearly" : "monthly";
                });

            }

            billingToggle.addEventListener("click", () => {
                yearly = !yearly;
                updatePrices();
            });

            // init
            updatePrices();
        });
    </script>
@endpush
