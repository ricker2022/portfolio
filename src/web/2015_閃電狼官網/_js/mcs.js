$(window).load(function () {
    $("#content").mCustomScrollbar({
        set_width: false, /*optional element width: boolean, pixels, percentage*/
        set_height: false, /*optional element height: boolean, pixels, percentage*/
        horizontalScroll: false, /*scroll horizontally: boolean*/
        scrollInertia: 950, /*scrolling inertia: integer (milliseconds)*/
        mouseWheel: true, /*mousewheel support: boolean*/
        mouseWheelPixels: "auto", /*mousewheel pixels amount: integer, "auto"*/
        autoDraggerLength: true, /*auto-adjust scrollbar dragger length: boolean*/
        autoHideScrollbar: false
    });
    $("#Cartcontent").mCustomScrollbar({
        set_width: false, /*optional element width: boolean, pixels, percentage*/
        set_height: false, /*optional element height: boolean, pixels, percentage*/
        horizontalScroll: false, /*scroll horizontally: boolean*/
        scrollInertia: 950, /*scrolling inertia: integer (milliseconds)*/
        mouseWheel: true, /*mousewheel support: boolean*/
        mouseWheelPixels: "auto", /*mousewheel pixels amount: integer, "auto"*/
        autoDraggerLength: true, /*auto-adjust scrollbar dragger length: boolean*/
        autoHideScrollbar: false
    });
    $("#content.TM").mCustomScrollbar({
        advanced: {
            updateOnContentResize: true
        }
    });
    $("#Cartcontent.Cart").mCustomScrollbar({
        advanced: {
            updateOnContentResize: true
        }
    });
});
