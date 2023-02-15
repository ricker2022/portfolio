$(document).ready(function(){
	
	//Fix Errors - http://www.learningjquery.com/2009/01/quick-tip-prevent-animation-queue-buildup/
	
	//Remove outline from links
	$(".animenu").click(function(){
		$(this).blur();
	});
	
	//When mouse rolls over
	$(".animenu").mouseover(function(){
		$(this).stop().animate({height:'180px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	});
	
	//When mouse is removed
	$(".animenu").mouseout(function(){
		$(this).stop().animate({height:'52px'},{queue:false, duration:600, easing: 'easeOutBounce'})
	});

	$(".nav_Click").click(function () {
	    var value = $(".nav_Click").attr("href");
	    //alert(value);
	});
	
});
