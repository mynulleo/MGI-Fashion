 @extends(themeBlade('layout.master'))
 @section('title', "$news_details->title | $siteSetting->title")
 @section('image', $news_details->image_two ?? '')
 @section('type', 'text/html')
 @section('url', url()->full())
 @section('tag', is_array($news_details->meta_tag ?? '') ? implode(', ', $news_details->meta_tag ?? '') : $news_details->meta_tag ?? '')
 @section('description', $news_details->meta_description ?? '')
 @section('content')
     <!-- main area start -->
     <main>
         <!-- Page header area start -->
         <section class="ep-page-header-section gray-bg position-relative z-1">
             <div class="container">
                 <div class="row">
                     <div class="col-lg-8 mx-auto">
                         <div class="text text-center">
                             <h1 class="page-title text-white">{{ Str::limit($news_details->title ?? '', 20, '...') }}</h1>
                             <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                 <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                 <li><a href="{{ route('news.list') }}">News & Events</a></li>

                                 <li>{{ Str::limit($news_details->title ?? '', 20, '...') }}</li>
                             </ul>
                         </div>
                     </div>
                 </div>
             </div>
         </section>
         <!-- Page header area end -->
         <!-- news details area start -->
         <section class="news_details_area pt_120">
             <div class="container">
                 <div class="row g-4">
                     <div class="col-lg-8">
                         <div class="news_content">
                             <div class="img position-relative">
                                 <img src="{{ $news_details->image_one ?? '' }}" alt="{{ $news_details->title ?? '' }}"
                                     class="img-fluid w-100">
                                 @php
                                     $day = \Carbon\Carbon::parse($news_details->date ?? '')->format('d');
                                     $month = \Carbon\Carbon::parse($news_details->date ?? '')->format('M');
                                 @endphp
                                 <span class="date d-block text-center">
                                     {{ $day }} <small>{{ $month }}</small>
                                 </span>
                             </div>
                             <div class="text">
                                 <div class="blog_meta">
                                 </div>
                                 <h4 class="main_title">{{ $news_details->title ?? '' }}</h4>
                                 <p> {!! $news_details->description ?? '' !!}</p>
                             </div>
                         </div>
                     </div>
                     @include(themeBlade('pages.news.sidebar'))
                 </div>
             </div>
         </section>
         <!-- news details area end -->
     </main>
     <!-- main area end -->
 @endsection
