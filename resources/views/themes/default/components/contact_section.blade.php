<!-- Contact Section Start -->
<section class="contact-section section-padding fix">
    <div class="container">
        <div class="row g-4 align-items-center">
            <div class="col-xl-7 col-lg-6">
                <div class="contact-content">
                    @php
                        $pageSection = GlobalHelper::getPageSection(1, 'contact-us');
                    @endphp
                    <div class="section-title mb-0">
                        <span class="sub-title wow fadeInUp">
                            Connect with Us
                        </span>
                        <h2 class="char-animation">
                            {{ $pageSection->title ?? 'We’re Here To Help With Your Texora & Garment Needs.' }}
                        </h2>
                    </div>
                    <div class="contact-text wow fadeInUp">
                        {!! $pageSection->description ?? "We're excited to hear from you. Get in touch with our team today!" !!}
                    </div>

                    @if (session('success'))
                        <div class="alert alert-success mt-3 mb-0">
                            {{ session('success') }}
                        </div>
                    @endif
                    @if ($errors->any())
                        <div class="alert alert-danger mt-3 mb-0">
                            <ul class="mb-0">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form action="{{ route('contact.store') }}" method="POST" id="contact-form"
                        class="contact-form-box mt-4">
                        @csrf
                        <div class="row g-4 align-items-center">
                            <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".2s">
                                <div class="form-clt">
                                    <input type="text" name="name" value="{{ old('name') }}"
                                        placeholder="Full name*" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".4s">
                                <div class="form-clt">
                                    <input type="text" name="phone" value="{{ old('phone') }}"
                                        placeholder="Phone No*" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".5s">
                                <div class="form-clt">
                                    <input type="email" name="email" value="{{ old('email') }}"
                                        placeholder="Email address*" required>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay=".6s">
                                <div class="form-clt">
                                    <input type="text" name="subject" value="{{ old('subject', 'General Inquiry') }}"
                                        placeholder="Subject*" required>
                                </div>
                            </div>
                            <div class="col-lg-12 wow fadeInUp" data-wow-delay=".7s">
                                <div class="form-clt">
                                    <textarea name="message" placeholder="How can we help you*" required>{{ old('message') }}</textarea>
                                </div>
                            </div>
                            <div class="col-lg-12 wow fadeInUp" data-wow-delay=".9s">
                                <button type="submit" class="theme-btn">
                                    Submit A Message
                                    <i class="fa-solid fa-arrow-right"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-xl-5 col-lg-6 wow fadeInUp" data-wow-delay=".3s">
                <div class="contact-thumb">
                    <img src="{{ !empty($pageSection->original_image) ? $pageSection->original_image : without_cache('build/theme/img/new/contact-01.jpg') }}"
                        alt="img">

                </div>
            </div>
        </div>
    </div>
</section>
