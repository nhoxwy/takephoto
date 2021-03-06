$(document).ready(function(){
  
    /* activate scrollspy menu */
  $('body').scrollspy({
    target: '#navbar-collapsible',
    offset: 52,
  });

  /* smooth scrolling sections */
  $('a[href*=#]:not([href=#])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top - 49
          }, 800);
          
          if (this.hash=="#section1") {
              $('.scroll-up').hide();
          }
          else {
              $('.scroll-up').show();
          }
          
          
          // activte animations in this section
          target.find('.animate').delay(1200).addClass("animated");
          setTimeout(function(){
              target.find('.animated').removeClass("animated");
          },2000);
          
          return false;
        }
      }
  });


  /*========================================
  =            LINK TO FEATURE             =
  ========================================*/
	// $('a[href*=#]:not([href=#])').not('#myCarousel a, .modal-trigger a, .panel a').click(function(o) {
	// 	$('html,body').animate({
	// 		scrollTop: $($(this).attr("href")).offset().top-75
	// 	}, 700, 'swing');
	// });


  /*========================================
  =            FILTER ISOTOPE              =
  ========================================*/
  // init Isotope
  var $grid = $('.grid').isotope({
    itemSelector: '.img-grid'
  });
  // store filter for each group
  var filters = {};
  $('#Frl-filter a').on( 'click', function() {
    var $this = $(this);
    // get group key
    var $uiGroup = $this.parents('.isotope-filter');
    var filterGroup = $uiGroup.attr('data-filter-group');
    // set filter for group
    filters[ filterGroup ] = $this.attr('data-filter');
    // combine filters
    var filterValue = concatValues( filters );
    // set filter for Isotope
    $grid.isotope({ filter: filterValue });
  });
  // change is-checked class on buttons
  $('.isotope-filter').each( function( i, uiGroup ) {
    var $uiGroup = $( uiGroup );
    $uiGroup.on( 'click', function() {
      $uiGroup.find('.active').removeClass('active');
      $( this ).addClass('active');
    });
  });
  // flatten object by concatting values
  function concatValues( obj ) {
    var value = '';
    for ( var prop in obj ) {
      value += obj[ prop ];
    }
    return value;
  }



  /*========================================
  =            ORDER SHOW                  =
  ========================================*/

  $('.form').find('input, textarea').on('keyup blur focus', function (e) {
    var $this = $(this),
        label = $this.prev('label');
      if (e.type === 'keyup') {
        if ($this.val() === '') {
            label.removeClass('active highlight');
          } else {
            label.addClass('active highlight');
          }
      } else if (e.type === 'blur') {
        if( $this.val() === '' ) {
          label.removeClass('active highlight'); 
        } else {
          label.removeClass('highlight');   
        }   
      } else if (e.type === 'focus') {
        
        if( $this.val() === '' ) {
          label.removeClass('highlight'); 
        } 
        else if( $this.val() !== '' ) {
          label.addClass('highlight');
        }
      }
  });
  $('.tab a').on('click', function (e) {
    e.preventDefault();
    $(this).parent().addClass('active');
    $(this).parent().siblings().removeClass('active');
    target = $(this).attr('href');
    $('.tab-content > div').not(target).hide();
    $(target).fadeIn(600);
  });


  
  /*====================================
  =            ON DOM READY            =
  ====================================*/
  $(function() {
    // Toggle Nav on Click
    $('.toggle-nav').click(function() {
        // Calling a function in case you want to expand upon this.
        toggleNav();
    });
  });


  /*========================================
  =            CUSTOM FUNCTIONS            =
  ========================================*/
  function toggleNav() {
    if ($('#site-wrapper').hasClass('show-nav')) {
      // Do things on Nav Close
      $('#site-wrapper').removeClass('show-nav');
    } else {
      // Do things on Nav Open
      $('#site-wrapper').addClass('show-nav');
    }
    //$('#site-wrapper').toggleClass('show-nav');
  }

  /*========================================
  =            COUNTER NUMBER              =
  ========================================*/
  

  /*$(window).scroll(function() {
    var hT = $('#circle').offset(3000),
        hH = $('#circle').outerHeight(),
        wH = $(window).height(),
        wS = $(this).scrollTop();
    console.log((hT - wH), wS);
    if (wS > (hT + hH - wH)) {
      $('.count h1').each(function () {
        $(this).prop('Counter',0).animate({
          Counter: $(this).text()
        }, {
          duration: 4000,
          easing: 'swing',
          step: function (now) {
            $(this).text(Math.ceil(now));
          }
        });
      });
    }
  });*/
  $(window).scroll(startCounter);
    function startCounter() {
        if ($(window).scrollTop() > 4100) {
            $(window).off("scroll", startCounter);
            $('.count h1').each(function () {
                var $this = $(this);
                jQuery({ Counter: 0 }).animate({ Counter: $this.text() }, {
                    duration: 1500,
                    easing: 'swing',
                    step: function () {
                        $this.text(Math.ceil(this.Counter));
                    }
                });
            });
        }
    }


    // SECTION 3
    TweenLite.set(".cardWrapper", {perspective:800});
    TweenLite.set(".card", {transformStyle:"preserve-3d"});
    TweenLite.set(".back", {rotationY:-180});
    TweenLite.set([".back", ".front"], {backfaceVisibility:"hidden"});

    $(".cardWrapper").hover(
      function() {
        TweenLite.to($(this).find(".card"), 1.2, {rotationY:180, ease:Back.easeOut});
      },
      function() {
        TweenLite.to($(this).find(".card"), 1.2, {rotationY:0, ease:Back.easeOut});  
      }
    );

    //a nice little intro;)
    TweenMax.staggerTo($(".card"), 1, {rotationY:-180, repeat:1, yoyo:true}, 0.1);
  

});

// the nav-bar gets a new background-color when scroll down
// var a = $(".navbar-inverse").offset().top;

$(document).scroll(function(){
    if($(this).scrollTop() > 50)
    {   
       $('.navbar-inverse').css({"background":"black"});
    } else {
       $('.navbar-inverse').css({"background":"rgba(28, 28, 28, 0.3)"});
    }
});

//bubble
// $(document).ready(function() {
//     var $element = $('#bubble');
//     var phrases = [
//         'KẾT NỐI MỌI NGƯỜI',
//         'MIỄN PHÍ CHO NGƯỜI DÙNG',
//         'NHANH CHÓNG VÀ TIỆN ÍCH :)',
//         'Lần đầu xuất hiện tại Việt Nam...',
//         'Sự lựa chọn tin cậy,',
//         'CẢM ƠN ĐÃ SỬ DỤNG',
//     ];
//     var index = -1;

//     (function loopAnimation() {
//         index = (index + 1) % phrases.length;

//         bubbleText({
//             element: $element,
//             newText: phrases[index],
//             letterSpeed: 100,
//             callback: function() {
//                 setTimeout(loopAnimation, 1000)
//             },
//             proportional: true,
//         });

//     })();

// });
