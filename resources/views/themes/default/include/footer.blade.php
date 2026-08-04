<footer id="footer" class="footer light-background">
    <div class="container footer-top">
        <div class="row gy-4">
            <div class="col-lg-4 col-md-6 footer-about">
                <div class="footer-logo-box">
                    <a href="{{ route('home') }}" class="d-flex align-items-center">
                        <img src="{{ $siteSetting->logo_two ?? '' }}" class="footer-logo" alt="">
                    </a>
                </div>
                <div class="footer-contact pt-3">
                    {{ $siteSetting->address ?? '' }}
                    <p class="mt-3"><strong>Phone:</strong> <span>{{ $siteSetting->mobile1 ?? '' }}</span></p>
                    <p><strong>Email:</strong> <span>{{ $siteSetting->contact_email ?? '' }}</span></p>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 footer-links">
                <h4>Useful Links</h4>
                {!! WebsiteMenus::footerMenu($footerMenu) !!}
            </div>

            <div class="col-lg-2 col-md-3 footer-links">
                <h4>Our Services</h4>
                {!! WebsiteMenus::footerServicesMenu() !!}
                {{-- <ul>
                    <li><i class="bi bi-chevron-right"></i> <a href="#">Web Design</a></li>
                    <li><i class="bi bi-chevron-right"></i> <a href="#">Web Development</a></li>
                    <li><i class="bi bi-chevron-right"></i> <a href="#">Product Management</a></li>
                    <li><i class="bi bi-chevron-right"></i> <a href="#">Marketing</a></li>
                </ul> --}}
            </div>

            <div class="col-lg-4 col-md-12">
                @php
                    $pagesection = GlobalHelper::getPageSection(1, 'follow-us');
                @endphp
                <h4>{{ $pagesection->page_title }}</h4>
                {!! $pagesection->description !!}
                <div class="social-links d-flex">
                    <a href="{{ $siteSetting->tw }}"><i class="bi bi-twitter-x"></i></a>
                    <a href=" {{ $siteSetting->fb }} "><i class="bi bi-facebook"></i></a>
                    <a href="{{ $siteSetting->yt }}"><i class="bi bi-youtube"></i></a>
                    <a href="{{ $siteSetting->ln }}"><i class="bi bi-linkedin"></i></a>
                </div>
            </div>

        </div>
    </div>

    <div class="container copyright text-center mt-4">
        <p>
            © <span>Copyright</span>
            <strong class="px-1 sitename">Quill Information Technology</strong>
            <span>All Rights Reserved</span>
        </p>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you've purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
            Designed by <a href="https://quillitech.com/">QuilliTech</a>
        </div>
    </div>

</footer>
