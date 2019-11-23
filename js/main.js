
function main() {

(function () {
   'use strict';
   
  	$('a.page-scroll').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top - 50
            }, 900);
            return false;
          }
        }
      });

	
    // Show Menu on Book 显示菜单与返回顶部的背景颜色，由滑动条高度决定
    $(window).bind('scroll', function() {
        var navHeight = $(window).height() - 500;
        if ($(window).scrollTop() > navHeight) {
            $('.navbar-default').addClass('on');
			$('.return-top').css('display','block').addClass('on');
        } else {
            $('.navbar-default').removeClass('on');
			$('.return-top').css('display','none').removeClass('on');
        }
    });

    $('body').scrollspy({ 
        target: '.navbar-default',
        offset: 80
    });

	// Hide nav on click	隐藏导航条的点击按钮
  $(".navbar-nav li a").click(function (event) {
    // check if window is small enough so dropdown is created
    var toggle = $(".navbar-toggle").is(":visible");
    if (toggle) {
      $(".navbar-collapse").collapse('hide');
    }
  });
	
  	// Portfolio isotope filter 同位素组合过滤器
    $(window).load(function() {
        var $container = $('.portfolio-items');
        $container.isotope({
            filter: '*',
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
        $('.cat a').click(function() {
            $('.cat .active').removeClass('active');
            $(this).addClass('active');
            var selector = $(this).attr('data-filter');
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            return false;
        });
		
		var $container1 = $('.portfolio-items1');
		$container1.isotope({
		    filter: '*',
		    animationOptions: {
		        duration: 750,
		        easing: 'linear',
		        queue: false
		    }
		});
		$('.cat1 a').click(function() {
		    $('.cat1 .active1').removeClass('active1');
		    $(this).addClass('active1');
		    var selector = $(this).attr('data-filter');
		    $container1.isotope({
		        filter: selector,
		        animationOptions: {
		            duration: 750,
		            easing: 'linear',
		            queue: false
		        }
		    });
		    return false;
		});

    });
	
    // Nivo Lightbox 
    $('.portfolio-item a').nivoLightbox({
            effect: 'slideDown',  
            keyboardNav: true,                            
        });
		
	// Testimonial Slider
	  	$(document).ready(function() {
	      $("#testimonial").owlCarousel({
        navigation : false, // 显示next和prev按钮
        slideSpeed : 300,
        paginationSpeed : 400,
        singleItem:true
        });

  	});	
	
}());


}
main();