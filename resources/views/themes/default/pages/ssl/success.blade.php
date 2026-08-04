@extends(themeBlade('layout.master'))
@section('title', "Success | $siteSetting->title")
@section('url', url()->full())
@section('content')

    <!-- Contact Start -->
    <div class="container-fluid ">
        <div class="container ">
            <div class="row justify-content-center">
                <div class="col-xl-9 col-lg-10">
                    <div class="card card-success">
                        <div class="row g-0">
                            <!-- LEFT: Image (mobile: top) -->
                            <div class="col-md-6 left-image"
                                style="background-image: url('{{ url('/') }}/public/build/theme/img/paymentsuccess.jpg');">
                                <!-- Optional overlay or extra content if needed -->
                            </div>
                            <!-- RIGHT: Text content -->
                            <div class="col-md-6 d-flex align-items-center">
                                <div class="card-body p-5">
                                    <div class="mb-4">
                                        <div class="checkmark mb-3 mx-auto" style="width:84px;height:84px;">
                                            <!-- Check icon -->
                                            <i class="fa fa-check fa-3x text-white"></i>
                                        </div>

                                        <h2 class="text-center mb-2" style="font-weight:700;">পেমেন্ট সফল হয়েছে</h2>
                                        <p class="text-center text-muted mb-0">ধন্যবাদ, </p>
                                        <p class="text-center text-muted mb-0">আমাদের সেবা গ্রহণের জন্য ধন্যবাদ।</p>
                                    </div>

                                    <div class="mt-4">
                                        <ul class="list-unstyled mb-4">
                                            <li>
                                                <strong>ইনভয়েস নং:</strong>
                                                <span class="text-muted">{{ $invoice_no ?? '' }}</span>
                                            </li>
                                            <li>
                                                <strong>ট্রানজ্যাকশন আইডি:</strong>
                                                <span class="text-muted">{{ $trnxid ?? '' }}</span>
                                            </li>
                                            <li>
                                                <strong>পরিমাণ:</strong>
                                                <span class="text-muted">৳ {!! GlobalHelper::toBanglaDigits($amount ?? 0) !!}</span>
                                            </li>
                                            <li>
                                                <strong>পেমেন্ট প্রক্রিয়া:</strong>
                                                <span class="text-muted">{{ $card_type ?? '' }}</span>
                                            </li>
                                        </ul>

                                        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                                            <a href="{{ url('/') }}" class="btn btn-primary btn-lg">হোম পেইজে ফিরে
                                                যান</a>
                                        </div>

                                        <div class="text-center mt-3">
                                            আমাদের টিম আপনার জন্য সফটওয়্যার কনফিগার করবে। ২৪ ঘণ্টার মধ্যে আপনি একটি ইমেইল
                                            পাবেন যেখানে আপনার সফটওয়্যারের URL এবং লগইন ক্রেডেনশিয়াল পাঠানো হবে।
                                        </div>
                                    </div>

                                    <hr class="my-4">

                                    <p class="small text-muted mb-0">
                                        <a href="{{ url('contact-us') }}" class="text-decoration-none small">
                                            ২৪ ঘন্টার মধ্যে ইমেইল না পেলে আমাদের সাথে যোগাযোগ করুন।
                                        </a>
                                    </p>
                                </div>
                            </div>
                            <!-- /RIGHT -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
