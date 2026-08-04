@extends(themeBlade('layout.master'))
@section('title', "Success | $siteSetting->title")
@section('url', url()->full())
@section('content')

    <!-- Contact Start -->
    <div class="container-fluid ">
        <div class="container ">
            <div class="row justify-content-center">
                <div class="col-xl-9 col-lg-10">
                    <div class="card card-fail">
                        <div class="row g-0">
                            <!-- LEFT: Image (mobile: top) -->
                            <div class="col-md-6 left-image"
                                style="background-image: url('{{ url('/') }}/public/build/theme/img/paymentfaild.jpg');">
                                <!-- Optional overlay or extra content if needed -->
                            </div>
                            <!-- RIGHT: Text content -->
                            <div class="col-md-6 d-flex align-items-center">
                                <div class="card-body p-5">
                                    <div class="mb-4">
                                        <div class="checkmarkfail mb-3 mx-auto" style="width:84px;height:84px;">
                                            <!-- Check icon -->
                                            <i class="fa fa-check fa-3x text-white"></i>
                                        </div>

                                        <h2 class="text-center mb-2" style="font-weight:700;">পেমেন্ট ব্যর্থ হয়েছে</h2>
                                        <p class="text-muted mb-4">
                                            দুঃখিত, আপনার লেনদেন সম্পন্ন করা যায়নি।
                                            অনুগ্রহ করে আবার চেষ্টা করুন অথবা অন্য কোনো পেমেন্ট মাধ্যম ব্যবহার করুন।
                                        </p>

                                        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                                            @if (!empty($payment['url']))
                                                <a href="{{ $payment['url'] }}" class="btn btn-danger btn-lg me-sm-2">
                                                    আবার চেষ্টা করুন
                                                </a>
                                            @endif
                                            <a href="{{ url('/') }}" class="btn btn-outline-secondary btn-lg">
                                                হোমপেজে ফিরে যান
                                            </a>
                                        </div>


                                    </div>
                                    <hr class="my-4">

                                    <p class="small text-muted mb-0">
                                        <a href="{{ url('contact-us') }}" class="text-decoration-none small">
                                            সাহায্যের প্রয়োজন? সাপোর্ট টিমের সাথে যোগাযোগ করুন
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
