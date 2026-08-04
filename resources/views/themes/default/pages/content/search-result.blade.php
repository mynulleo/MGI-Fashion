@extends(themeBlade('layout.master'))
@section('content')
    <!-- main area start -->
    <main>
        <!-- Page header area start -->
        <section class="ep-page-header-section gray-bg position-relative z-1">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="text text-center">
                            <h1 class="page-title text-white">Search Result</h1>
                            <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                <li>Search Result</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Page header area end -->
        <!-- Search result area start -->

        @if ($total_results > 0)
            <section class="news_area search_result_area style2 pt_120">
                <div class="container">
                    <div class="row g-4">
                        @php
                            $searchQuery = request()->input('query');
                            $resultCount = $total_results;
                        @endphp
                        <div class="container my-3">
                            <h2 style="font-weight: 500;">
                                {{ $resultCount }} {{ Str::plural('result', $resultCount) }} were found for
                                <span style="background-color: #fff9c4; padding: 2px 6px; border-radius: 3px;">
                                    "{{ $rawQuery }}"
                                </span>
                            </h2>
                        </div>
                        @foreach ($news_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->title ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }

                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp

                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('news.details', ['slug' => $item->slug ?? '']) }}"
                                        class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>

                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach
                        @foreach ($client_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->name ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }

                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp
                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('client.details', ['slug' => $item->slug ?? '']) }}"
                                        class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach

                        @foreach ($service_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->title ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }

                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp
                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('service.details', ['slug' => $item->slug ?? '']) }}"
                                        class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach

                        @foreach ($project_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->title ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }

                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp
                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('projectdetails', ['slug' => $item->slug ?? '']) }}"
                                        class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach

                        @foreach ($career_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->title ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }

                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp
                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('career.details', ['slug' => $item->slug ?? '']) }}"
                                        class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach

                        @foreach ($content_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->title ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }

                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp
                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('pages', ['slug' => $item->slug ?? '']) }}" class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach

                        @foreach ($testimonial_results as $item)
                            @php
                                $limitedTitle = Str::words(strip_tags($item->name ?? ''), 6, '...');
                                $limitedDescription = Str::words(strip_tags($item->description ?? ''), 20, '...');

                                $highlightedTitle = $limitedTitle;
                                $highlightedDescription = $limitedDescription;

                                foreach ($keywords as $word) {
                                    $highlightedTitle = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedTitle,
                                    );
                                }
                                foreach ($keywords as $word) {
                                    $highlightedDescription = preg_replace_callback(
                                        '/' . preg_quote($word, '/') . '/iu',
                                        fn($matches) => '<span style="background-color: #fff9c4;">' .
                                            $matches[0] .
                                            '</span>',
                                        $highlightedDescription,
                                    );
                                }
                            @endphp
                            <div class="col-lg-6 col-md-6">
                                <div class="news_item">
                                    <a href="{{ route('home') }}#testimonial-box" class="d-block w-100">
                                        <div class="text">
                                            <h4 class="title mb-4">{!! $highlightedTitle !!}</h4>
                                            <p>{!! $highlightedDescription !!}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    {{--  <div class="pagination d-flex justify-content-center mt-5">
                    <ul class="list-unstyled d-flex align-items-center justify-content-center w-100">
                        <li class="arrow"><i class="fa-solid fa-chevron-left"></i></li>
                        <li>
                            <a href="#" class="active"><span>1</span></a>
                        </li>
                        <li>
                            <a href="#">2</a>
                        </li>
                        <li class="arrow"><a href="#" rel="next"><i class="fa-solid fa-chevron-right"></i></a>
                        </li>
                    </ul>
                </div>  --}}
                </div>
            </section>
        @else
            <section class="news_area search_result_area style2 pt_120">
                <div class="container">
                    <div class="row g-4">
                        <center>
                            <h1>
                                No results found for <span
                                    style="font-size: 24px; font-weight: bold;">"{{ request()->input('query') }}"</span>
                            </h1>
                        </center>
                    </div>
                </div>
            </section>
        @endif
        <!-- Search result area end -->
    </main>
    <!-- main area end -->
@endsection
