$(function() {
	// Show Section模块
	$('.list-item li').hover(function() {
		var i = $(this).index();
		$(this).addClass('active').siblings('li').removeClass('active');
		console.log(i);
		$('.show-img a').eq(i).addClass('active').css('opacity','1').siblings('a').removeClass('active').css('opacity','0');
		$('.show-txt span').eq(i).addClass('active').css('opacity','1').siblings('span').removeClass('active').css('opacity','0');
		// $('.about-text a').eq(i).slideUp(1000);
		// $('.about-text a').eq(i).siblings('a').show(500);
	},function() {
		// var i = $(this).index() +1;
		// $('.show-img a').eq(i).remoClass('active');
		// $('.about-text a').eq(i).show(500);
		// $('.about-text a').eq(i).siblings('a').slideUp(1000);
	})
	
	
	// 最新动态图片轮播模块
	var linum = $('.img-list li').length;
	var liwidth = $('.img-list > li').width();
	$('.img-list').css('width',linum * liwidth);
	// console.log(linum * liwidth);
	var i = 0;
	function autoplay() {
		if( i < linum-1 ) {
			i++;
		} else {
			i = 0;
		}
		$('.img-list').animate({
			left: - liwidth * i + 'px'
		},500)
		$('.img-list li').eq(i).addClass('active').siblings('li').removeClass('active');
		$('.news-list-title li a').eq(i).addClass('cur');
		$('.news-list-title li').eq(i).siblings().children('a').removeClass('cur');
	}
	var set = setInterval(autoplay,2000);
	
	$('.news-container.row').hover(function() {
		clearInterval(set);
	},function() {
		set = setInterval(autoplay,2000);
	})
	
	$('.news-list-title li').hover(function() {
		var index = $(this).index();
		i = index;
		$('.img-list').animate({
			left: - liwidth * i + 'px'
		},500)
		$('.img-list li').eq(i).addClass('active').siblings('li').removeClass('active');
		$('.news-list-title li a').eq(i).addClass('cur');
		$('.news-list-title li').eq(i).siblings().children('a').removeClass('cur');
	})
})