(function($) {
    "use strict";
  
    const $documentOn = $(document);
    const $windowOn = $(window);
  
    $documentOn.ready( function() {
  
      
      /* ================================
       Mobile Menu Js Start
    ================================ */
    
      $('#mobile-menu').meanmenu({
        meanMenuContainer: '.mobile-menu',
        meanScreenWidth: "1199",
        meanExpand: ['<i class="far fa-plus"></i>'],
    });

       $('#mobile-menus').meanmenu({
        meanMenuContainer: '.mobile-menus',
        meanScreenWidth: "19920",
        meanExpand: ['<i class="far fa-plus"></i>'],
    });

     $documentOn.on("click", ".mean-expand", function () {
        let icon = $(this).find("i");

        if (icon.hasClass("fa-plus")) {
            icon.removeClass("fa-plus").addClass("fa-minus"); 
        } else {
            icon.removeClass("fa-minus").addClass("fa-plus"); 
        }
    });

    /* ================================
        Sidebar Toggle & Sticky Item Logic
        ================================ */

        // Open offcanvas
        $(".sidebar__toggle").on("click", function () {
        $(".offcanvas__info").addClass("info-open");
        $(".offcanvas__overlay").addClass("overlay-open");

        // Hide sticky item
        $(".sidebar-sticky-item").fadeOut().removeClass("active");
        });

        // Close offcanvas
        $(".offcanvas__close, .offcanvas__overlay").on("click", function () {
        $(".offcanvas__info").removeClass("info-open");
        $(".offcanvas__overlay").removeClass("overlay-open");

        // Show sticky item
        $(".sidebar-sticky-item").fadeIn().addClass("active");
        });

        /* ================================
        Body Overlay Js Start
        ================================ */

        $(".body-overlay").on("click", function () {
        $(".offcanvas__area").removeClass("offcanvas-opened");
        $(".df-search-area").removeClass("opened");
        $(".body-overlay").removeClass("opened");

        // Show sticky item when overlay clicked
        $(".sidebar-sticky-item").fadeIn().addClass("active");
        });

        /* ================================
        Offcanvas Link Click (Optional)
        ================================ */

        $(".offcanvas a").on("click", function () {
        $(".sidebar-sticky-item").fadeIn().addClass("active");
    });

    
      /* ================================
       Sticky Header Js Start
    ================================ */

       $windowOn.on("scroll", function () {
        if ($(this).scrollTop() > 250) {
          $("#header-sticky").addClass("sticky");
        } else {
          $("#header-sticky").removeClass("sticky");
        }
      });      
      
       /* ================================
       Video & Image Popup Js Start
    ================================ */

      $(".img-popup").magnificPopup({
        type: "image",
        gallery: {
          enabled: true,
        },
      });

      $(".video-popup").magnificPopup({
        type: "iframe",
        callbacks: {},
      });
  
      /* ================================
       Counterup Js Start
    ================================ */

      $(".count").counterUp({
            delay: 15,
            time: 4000,
        });
  
      /* ================================
       Wow Animation Js Start
    ================================ */

      new WOW().init();
  
      /* ================================
       Nice Select Js Start
    ================================ */

    if ($('.single-select').length) {
        $('.single-select').niceSelect();
    }
  
     /* ================================
       Banner Active Js Start
    ================================ */

    if($('.hero-slider').length > 0) {
        const heroSlider = new Swiper(".hero-slider", {
            spaceBetween: 40,
            speed: 2000,
            loop: true,
            navigation: {
                nextEl: ".array-prev",
                prevEl: ".array-next",
            },
            pagination: {
                el: '.custom-pagination',
                type: 'progressbar',
            },
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            }, 
            
        });
    }


    if($('.banner-active').length > 0) {
        const bannerActive = new Swiper(".banner-active", {
            speed:1500,
            loop: true,
            slidesPerView: 1,
            effect:'fade',
            autoplay: {
                delay: 3000,         
                disableOnInteraction: false,
                pauseOnMouseEnter: false,  
            }, 
            navigation: {
                nextEl: ".array-prev",
                prevEl: ".array-next",
            },
            pagination: {
            el: ".dot",
            clickable: true,
        },
        });
    }

    /* ================================
       service Slider Js Start
    ================================ */
    if($('.brand-new-slider').length > 0) {
        const brandNewSlider = new Swiper(".brand-new-slider", {
            spaceBetween: 0,
            speed: 2000,
            loop: true,
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            }, 
          
            breakpoints: {
                1399: {
                    slidesPerView: 7,
                },
                 1199: {
                    slidesPerView: 6,
                },
                991: {
                    slidesPerView: 5,
                },
                767: {
                    slidesPerView: 4,
                },
                575: {
                    slidesPerView: 3,
                },
                400: {
                    slidesPerView: 2,
                },
                0: {
                    slidesPerView: 1,
                },
            },
        });
    }
   

    /* ================================
       advantage Slider Js Start
    ================================ */

    if($('.advantage-slider').length > 0) {
        const advantageSlider = new Swiper(".advantage-slider", {
            spaceBetween: 0,
            speed: 2000,
            loop: true,
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            }, 
          
            breakpoints: {
                1199: {
                    slidesPerView: 4,
                },
                991: {
                    slidesPerView: 3,
                },
                767: {
                    slidesPerView: 2.5,
                },
                575: {
                    slidesPerView: 2,
                },
                0: {
                    slidesPerView: 1,
                },
            },
        });
    }

    /* ================================
       testimonial Slider Js Start
    ================================ */

    if($('.testimonial-slider').length > 0) {
        const testimonialSlider = new Swiper(".testimonial-slider", {
            spaceBetween: 40,
            speed: 2000,
            loop: true,
            navigation: {
                nextEl: ".array-prev",
                prevEl: ".array-next",
            },
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            }, 
            
            breakpoints: {
                1199: {
                    slidesPerView: 1,
                },
                991: {
                    slidesPerView: 1,
                },
                767: {
                    slidesPerView: 1,
                },
                575: {
                    slidesPerView: 1,
                },
                0: {
                    slidesPerView: 1,
                },
            },
        });
    }


    if($('.testimonial-slider-2').length > 0) {
        const testimonialSlider2 = new Swiper(".testimonial-slider-2", {
            spaceBetween: 30,
            speed: 2000,
            loop: true,
            navigation: {
                nextEl: ".array-prev",
                prevEl: ".array-next",
            },
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            }, 
            
            breakpoints: {
                1600: {
                    slidesPerView: 4,
                },
                1500: {
                    slidesPerView: 3.5,
                },
                1199: {
                    slidesPerView: 3,
                },
                991: {
                    slidesPerView: 2.5,
                },
                767: {
                    slidesPerView: 2,
                },
                575: {
                    slidesPerView: 1.5,
                },
                0: {
                    slidesPerView: 1,
                },
            },
        });
    }

    
    /* ================================
       project Slider Js Start
    ================================ */
    if ($('.project-slider').length > 0) {
        const projectSlider = new Swiper(".project-slider", {
            spaceBetween: 30,
            speed: 2000,
            loop: true,
            autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            },
             pagination: {
                el: ".game-swiper-pagination",
                type: "progressbar"
            },
            navigation: {
                nextEl: ".array-prev",
                prevEl: ".array-next",
            },
            breakpoints: {
                1400: {
                    slidesPerView: 4,
                },
                1199: {
                    slidesPerView: 3,
                },
                991: {
                    slidesPerView: 2.6,
                },
                767: {
                    slidesPerView: 2,
                },
                575: {
                    slidesPerView: 1.4,
                },
                0: {
                    slidesPerView: 1,
                },
            },
        });
    } 


    /* ================================
       Custom Accordion Js Start
    ================================ */

       if ($('.accordion-box').length) {
            $(".accordion-box").on('click', '.acc-btn', function () {
                var outerBox = $(this).closest('.accordion-box');
                var target = $(this).closest('.accordion');
                var accBtn = $(this);
                var accContent = accBtn.next('.acc-content');

                if (target.hasClass('active-block')) {
                    // Already open, so close it
                    accBtn.removeClass('active');
                    target.removeClass('active-block');
                    accContent.slideUp(300);
                } else {
                    // Close all others
                    outerBox.find('.accordion').removeClass('active-block');
                    outerBox.find('.acc-btn').removeClass('active');
                    outerBox.find('.acc-content').slideUp(300);

                    // Open clicked one
                    accBtn.addClass('active');
                    target.addClass('active-block');
                    accContent.slideDown(300);
                }
            });
        }

        function initSlick() {

            const $slider = $(".my-slider");

            // Run only if slider exists on page
            if (!$slider.length) return;

            if ($windowOn.width() > 768) {

                if (!$slider.hasClass("slick-initialized")) {

                    $slider.slick({
                        slidesToShow: 2,
                        slidesToScroll: 1,
                        infinite: true,
                        variableWidth: true,
                        arrows: true,
                        dots: false,
                        autoplay: false,
                        autoplaySpeed: 3000,
                        prevArrow: $(".array-prev"),
                        nextArrow: $(".array-next"),

                        responsive: [
                            {
                                breakpoint: 1600,
                                settings: {
                                    slidesToShow: 4
                                }
                            },
                            {
                                breakpoint: 1400,
                                settings: {
                                    slidesToShow: 3
                                }
                            },
                            {
                                breakpoint: 1199,
                                settings: {
                                    slidesToShow: 2
                                }
                            },
                            {
                                breakpoint: 991,
                                settings: {
                                    slidesToShow: 1
                                }
                            },
                            {
                                breakpoint: 767,
                                settings: {
                                    slidesToShow: 1
                                }
                            }
                        ]
                    });

                    $slider.find(".thumb").first().addClass("active");
                }

            } else {

                if ($slider.hasClass("slick-initialized")) {
                    $slider.slick("unslick");
                }

            }
        }


        // Initial Load
        initSlick();


        // Resize
        $windowOn.on("resize", function () {
            initSlick();
        });


        // Hover Active (only if slider exists)
        if ($(".my-slider").length) {

            $documentOn.on("mouseenter", ".my-slider .thumb", function () {
                $(".my-slider .thumb").removeClass("active");
                $(this).addClass("active");
            });

        }


         /* ================================
           Circle Progressbar Js Start
        ================================ */

        function animateCircle(el) {

            if (!el || el.classList.contains("animated")) return;

            var percent = parseInt(el.getAttribute("data-percent"), 10);

            if (isNaN(percent) || percent < 0) percent = 0;
            if (percent > 100) percent = 100;

            var circle = el.querySelector(".progress");
            var value  = el.querySelector(".value");

            if (!circle || !value) return;

            var radius = circle.r && circle.r.baseVal
                ? circle.r.baseVal.value
                : circle.getAttribute("r");

            if (!radius) return;

            var circumference = 2 * Math.PI * radius;

            circle.style.strokeDasharray  = circumference;
            circle.style.strokeDashoffset = circumference;

            // Trigger reflow
            circle.getBoundingClientRect();

            var offset = circumference * (1 - percent / 100);

            circle.style.transition      = "stroke-dashoffset 1.2s ease";
            circle.style.strokeDashoffset = offset;

            var count     = 0;
            var duration  = 1200;
            var stepTime  = percent > 0 ? Math.floor(duration / percent) : duration;

            var counter = setInterval(function () {

                if (count >= percent) {
                    clearInterval(counter);
                    el.classList.add("animated");
                } else {
                    count++;
                    value.textContent = count + "%";
                }

            }, stepTime);
        }

        if ("IntersectionObserver" in window) {

            var observer = new IntersectionObserver(function (entries, obs) {

                entries.forEach(function (entry) {

                    if (entry.isIntersecting) {
                        animateCircle(entry.target);
                        obs.unobserve(entry.target);
                    }

                });

            }, {
                threshold: 0.5
            });

            $(".circle-progress").each(function () {
                observer.observe(this);
            });

        } else {

            // Fallback for older browsers
            $(".circle-progress").each(function () {
                animateCircle(this);
            });

        }
       

         /* ================================
        Mouse Cursor Animation Js Start
        ================================ */

        if ($(".mouseCursor").length > 0) {
        function itCursor() {
            var myCursor = jQuery(".mouseCursor");
            if (myCursor.length) {
                if ($("body")) {
                    const e = document.querySelector(".cursor-inner"),
                        t = document.querySelector(".cursor-outer");
                    let n,
                        i = 0,
                        o = !1;
                    (window.onmousemove = function(s) {
                        o ||
                            (t.style.transform =
                                "translate(" + s.clientX + "px, " + s.clientY + "px)"),
                            (e.style.transform =
                                "translate(" + s.clientX + "px, " + s.clientY + "px)"),
                            (n = s.clientY),
                            (i = s.clientX);
                    }),
                    $("body").on(
                            "mouseenter",
                            "button, a, .cursor-pointer",
                            function() {
                                e.classList.add("cursor-hover"),
                                    t.classList.add("cursor-hover");
                            }
                        ),
                        $("body").on(
                            "mouseleave",
                            "button, a, .cursor-pointer",
                            function() {
                                ($(this).is("a", "button") &&
                                    $(this).closest(".cursor-pointer").length) ||
                                (e.classList.remove("cursor-hover"),
                                    t.classList.remove("cursor-hover"));
                            }
                        ),
                        (e.style.visibility = "visible"),
                        (t.style.visibility = "visible");
                }
            }
        }
        itCursor();
      }

      /* ================================
        Back To Top Button Js Start
    ================================ */
    $windowOn.on('scroll', function() {
        var windowScrollTop = $(this).scrollTop();
        var windowHeight = $(window).height();
        var documentHeight = $(document).height();

        if (windowScrollTop + windowHeight >= documentHeight - 10) {
            $("#back-top").addClass("show");
        } else {
            $("#back-top").removeClass("show");
        }
    });

    $documentOn.on('click', '#back-top', function() {
        $('html, body').animate({ scrollTop: 0 }, 800);
        return false;
    });

    /* ================================
       Search Popup Toggle Js Start
    ================================ */

    if ($(".search-toggler").length) {
        $(".search-toggler").on("click", function(e) {
            e.preventDefault();
            $(".search-popup").toggleClass("active");
            $("body").toggleClass("locked");
        });
    }

        
    /* ================================
       Smooth Scroller And Title Animation Js Start
    ================================ */

    if ($('#smooth-wrapper').length && $('#smooth-content').length) {
        gsap.registerPlugin(ScrollTrigger, ScrollSmoother, SplitText);

        gsap.config({
            nullTargetWarn: false,
        });

        let smoother = ScrollSmoother.create({
            wrapper: "#smooth-wrapper",
            content: "#smooth-content",
            smooth: 2,
            effects: true,
            smoothTouch: 0.1,
            normalizeScroll: false,
            ignoreMobileResize: true,
        });
    }

    /* ================================
       Section Title Js Start
    ================================ */

    if ($('.char-animation').length > 0) {
        let char_come = gsap.utils.toArray(".char-animation");
        char_come.forEach(splitTextLine => {
            const tl = gsap.timeline({
                scrollTrigger: {
                trigger: splitTextLine,
                start: 'top 90%',
                end: 'bottom 60%',
                scrub: false,
                markers: false,
                toggleActions: 'play none none none'

             }
        });

            const itemSplitted = new SplitText(splitTextLine, { type: "chars, words" });
            gsap.set(splitTextLine, { perspective: 300 });
            itemSplitted.split({ type: "chars, words" })
            tl.from(itemSplitted.chars,
            {
                duration: 1,
                delay: 0.3,
                x: 100,
                autoAlpha: 0,
                stagger: 0.03
            });
        });
    }

     

    }); // End Document Ready Function

    
     /* ================================
       Preloader Js Start
    ================================ */

    $('.preloader').delay(700).fadeOut('slow');
  
  })(jQuery); // End jQuery

