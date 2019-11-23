$(function() {
	// Show Section模块
	var x = 0;
	$('.list-item li').hover(function() {
		x = $(this).index();
		$(this).addClass('active').siblings('li').removeClass('active');
		$('.show-img a').eq(x).addClass('active').css('opacity','1').siblings('a').removeClass('active').css('opacity','0');
		$('.show-txt span').eq(x).addClass('active').css('opacity','1').siblings('span').removeClass('active').css('opacity','0');
	})
	$('#nav-list > li > a').click(function() {
		x = $(this).parents('li').index();
		// $(this).addClass('active').siblings('li').removeClass('active');
		$(this).css('color','#6aaf08!important');
		$('.list-item li').eq(x).addClass('active').siblings('li').removeClass('active');
		$('.show-img a').eq(x).addClass('active').css('opacity','1').siblings('a').removeClass('active').css('opacity','0');
		$('.show-txt span').eq(x).addClass('active').css('opacity','1').siblings('span').removeClass('active').css('opacity','0');
		console.log('x:',x);
	});
	
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