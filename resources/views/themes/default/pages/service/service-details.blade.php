 @extends(themeBlade('layout.master'))
 @section('title', "$service_details->title | $siteSetting->title")
 @section('image', $service_details->image_one ?? '')
 @section('type', 'text/html')
 @section('url', url()->full())
 @section('tag', is_array($service_details->meta_tag ?? '') ? implode(', ', $service_details->meta_tag ?? '') :
     $service_details->meta_tag ?? '')
 @section('description', $service_details->meta_description ?? '')
 @section('content')
     <!-- main area start -->
     <main>
         <!-- Page header area start -->
         <section class="ep-page-header-section gray-bg position-relative z-1">
             <div class="container">
                 <div class="row">
                     <div class="col-lg-8 mx-auto">
                         <div class="text text-center">
                             <h1 class="page-title text-white">{{ Str::limit($service_details->title ?? '', 20, '...') }}
                             </h1>
                             <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                                 <li><a href="{{ route('home') }}"><i class="fa-solid fa-house"></i> Home</a></li>
                                 <li><a href="{{ route('service.list') }}"> Services</a></li>
                                 <li>{{ Str::limit($service_details->title ?? '', 20, '...') }}</li>
                             </ul>
                         </div>
                     </div>
                 </div>
             </div>
         </section>
         <!-- Page header area end -->
         <!-- service details area start -->
         <section class="service_details_area pt_120">
             <div class="container">
                 <div class="row">
                     <div class="col-lg-10 mx-auto">
                         <div class="service_image mb-4">
                             <img src="{{ $service_details->image_one ?? '' }}" alt="{{ $service_details->title ?? '' }}"
                                 class="img-fluid w-100">
                         </div>
                         <div class="service_content">
                             <h4 class="service_title mb-4">{{ $service_details->title ?? '' }}
                             </h4>
                             <p> {!! $service_details->description ?? '' !!} </p>

                         </div>
                     </div>
                 </div>
             </div>
         </section>
         <!-- service details area end -->
     </main>
     <!-- main area end -->
 @endsection
