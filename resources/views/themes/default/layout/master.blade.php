<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title')</title>
    <meta name="description" content="@yield('description')">
    <meta name="keywords" content="@yield('tag')">

    <!-- Favicon -->
    <link rel="shortcut icon" href="{{ $siteSetting->favicon ?? without_cache('build/theme/img/favicon.svg') }}">

    <!-- Vendor & Theme CSS Files -->
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/fontawsome/css/fontawesome.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/animate.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/meanmenu.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/swiper-bundle.min.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/nice-select.css') }}">
    <link rel="stylesheet" href="{{ without_cache('build/theme/css/main.css') }}">
</head>

<body class="bg-white">

    <!-- Preloader -->
    <div class="preloader">
        <div class="spinner-wrap">
            <div class="preloader-logo">
                <img src="{{ $siteSetting->logo_one ?? without_cache('build/theme/img/preloader.svg') }}"
                    alt="logo" class="img-fluid">
            </div>
            <div class="spinner"></div>
        </div>
    </div>

    <!-- Back To Top Start -->
    <button id="back-top" class="back-to-top">
        <i class="fa-regular fa-arrow-up"></i>
    </button>

    <!-- MouseCursor Start -->
    <div class="mouseCursor cursor-outer"></div>
    <div class="mouseCursor cursor-inner"></div>

    @include(themeBlade('include.header'))

    <div id="smooth-wrapper">
        <div id="smooth-content">

            <main class="main">
                @yield('content')
            </main>

            @include(themeBlade('include.footer'))

        </div>
    </div>

    <!-- All JS Plugins -->
    <script src="{{ without_cache('build/theme/js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/viewport.jquery.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/gsap.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/ScrollTrigger.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/ScrollSmoother.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/ScrollToPlugin.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/SplitText.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/TextPlugin.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/jquery.waypoints.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/jquery.counterup.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/swiper-bundle.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/jquery.meanmenu.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/wow.min.js') }}"></script>
    <script src="{{ without_cache('build/theme/js/main.js') }}"></script>
    @stack('scripts')
</body>

</html>
