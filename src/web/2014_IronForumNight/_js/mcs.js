$(window).load(function(){
    $("#content_1").mCustomScrollbar({
		set_width:false, /*optional element width: boolean, pixels, percentage*/
		set_height:false, /*optional element height: boolean, pixels, percentage*/
		horizontalScroll:false, /*scroll horizontally: boolean*/
		scrollInertia:950, /*scrolling inertia: integer (milliseconds)*/
		mouseWheel:true, /*mousewheel support: boolean*/
		mouseWheelPixels:"auto", /*mousewheel pixels amount: integer, "auto"*/
		autoDraggerLength:true, /*auto-adjust scrollbar dragger length: boolean*/
		autoHideScrollbar:false
	});
    $("#content_1.main").mCustomScrollbar({
		advanced:{
			updateOnContentResize: true
		}
	});
});
