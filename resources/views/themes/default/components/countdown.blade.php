<div class="container-fluid bg-light py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-md-3 col-6">
                <div class="stat-box">
                    <div class="stat-icon"><i class="fa fa-city text-primary"></i></div>
                    <div class="stat-number" data-target="{{ $siteSetting->Organization }}">0</div>
                    <div class="stat-label">মোট বাসস্থান</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-box">
                    <div class="stat-icon"><i class="fa fa-home text-primary"></i></div>
                    <div class="stat-number" data-target="{{ $siteSetting->flat }}">0</div>
                    <div class="stat-label">মোট অ্যাপার্টমেন্ট</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-box">
                    <div class="stat-icon"><i class="fa fa-users text-primary"></i></div>
                    <div class="stat-number" data-target="{{ $siteSetting->resident }}">0</div>
                    <div class="stat-label">মোট বসবাসকারি</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-box">
                    <div class="stat-icon"><i class="fa fa-user-clock text-primary"></i></div>
                    <div class="stat-number" data-target="{{ $siteSetting->registration }}">0</div>
                    <div class="stat-label">রেজিস্ট্রেশন</div>
                </div>
            </div>
        </div>
    </div>
</div>
@push('scripts')
    <script>
        const counters = document.querySelectorAll(".stat-number");
        const speed = 100; // smaller = faster

        counters.forEach((counter) => {
            const animate = () => {
                const value = +counter.getAttribute("data-target");
                const data = +counter.innerText;

                const time = value / speed;
                if (data < value) {
                    let number = Math.ceil(data + time);
                    number = toBanglaDigits(number);
                    counter.innerText = number;
                    setTimeout(animate, 20);
                } else {
                    counter.innerText = toBanglaDigits(value);
                }
            };
            animate();
        });
    </script>
@endpush
