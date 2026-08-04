
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
              <h1 class="page-title text-white">Submit CV</h1>
              <ul class="bread-crumb list-unstyled d-flex flex-wrap justify-content-center">
                <li><a href="index.html"><i class="fa-solid fa-house"></i> Home</a></li>
                <li>Submit CV</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Page header area end -->
    <!-- career area start -->
    <section class="career_area apply_now_form pt_120">
      <div class="container">

        <div class="career_details">
          <div class="row">
            <div class="col-lg-10 mx-auto">

              <div class="car_details_main">
                <div class="text text-center mb-5">
                  <p class="fs-6">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure adipisci dolorem quam nihil nulla
                    dolor asperiores necessitatibus temporibus. Nobis ex itaque et. Accusamus obcaecati temporibus,
                    soluta ea distinctio pariatur eaque, officiis magni vero nisi totam aliquam doloremque harum nobis
                    fugit, culpa praesentium? Voluptatum iusto aliquam architecto sed esse? Commodi, nihil!</p>
                </div>
                <div class="send_resume_form">

                  <div class="form_main">
                    <form action="#">
                      <div class="row g-4">
                        <!-- <div class="col-lg-12">
                          <div class="input_groups">
                            <label>Your Name <sup class="text-danger">*</sup></label>
                            <input type="text" placeholder="Enter Your Name">
                          </div>
                        </div> -->
                        <!-- <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Last Name <sup class="text-danger">*</sup></label>
                            <input type="text" placeholder="Last Name">
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Phone</label>
                            <input type="text" placeholder="Phone Number">
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Email <sup class="text-danger">*</sup></label>
                            <input type="text" placeholder="example@example.com">
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Portfolio Link <sup class="text-danger">*</sup></label>
                            <input type="text" placeholder="Portfolio Link">
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Git Link <sup class="text-danger">*</sup></label>
                            <input type="text" placeholder="Git Link">
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Social Media Link</label>
                            <input type="text" placeholder="Social Media Link">
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="input_groups">
                            <label>Expected Salary</label>
                            <input type="text" placeholder="Expected Salary">
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="input_groups">
                            <label>Cover Letter</label>
                            <textarea rows="4" placeholder="Cover Letter"></textarea>
                          </div>
                        </div> -->
                        <div class="col-lg-12">
                          <div class="text-start">
                            <h3 class="title">Send your cv</h3>
                          </div>
                          <div class="input_groups">
                            <label>Resume/CV/Portfolio File<sup class="text-danger">*</sup></label>
                            <input type="file">
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <button type="submit" class="theme_btn border-0">Submit</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- career area end -->

  </main>
  <!-- main area end -->
@endsection
