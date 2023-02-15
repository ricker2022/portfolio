// JavaScript Document
var HOST = "http://localhost";

$(document).ready(function () {
    HOST = window.location.origin;
})

//在數字前補0
function fnPad(number, length) {
    var str = '' + number;
    while (str.length < length) {
        str = '0' + number;
    }
    return str;
}

//去掉數字前的0
function fnUnPad(number, length) {
    var check = 0;
    var str = "";
    while (check < length) {
        if (str == "") {
            if (number.charAt(check) != "0") {
                str += number.charAt(check);
            }
        } else {
            str += number.charAt(check);
        }
        check = check + 1;
    }
	if (str == ""){str = 0};
    return str;
}

//將文字轉成數字格式
function toInt(x) {
    return (parseInt(x) + 0);
}

//子選單
$(document).ready(function () {
    var getCurrentPage = window.location.pathname.split("/")[1].split(".aspx")[0];
    if (getCurrentPage.indexOf("_") > 0) {
        getCurrentPage = getCurrentPage.split("_")[0];
        $('li#' + getCurrentPage, this).addClass("active");
    } else if (getCurrentPage == "" || getCurrentPage == "#") {
        getCurrentPage = "";
    } else {
        $('li#' + getCurrentPage, this).addClass("active");
    }
    //$("#mainmenu li").hover(
	//	function () {
	//	    $('a', this).addClass("active");
	//	    $('ul', this).slideDown(200); //up/down effect
	//	}, function () {
	//	    $('a', this).removeClass("active");
	//	    if (getCurrentPage != "") {
	//	        $('a#' + getCurrentPage, this).addClass("active");
	//	    }
	//	    $('ul', this).slideUp(200);
	//	}
    //);

    var isHiden = true; /*控制切換選单*/
    $("#mainmenu li").click(
		function () {
		    if (isHiden) {
		        $("#SubMenu").css("display", "block");
		        $("#SubMenu").animate({ left: "-=480px" }, 400);
		    } else {
		        $("#SubMenu").animate({ left: "+=480px" });
		        setTimeout(function () {
		            $("#SubMenu").css("display", "none");}, 400);
		    }
		    isHiden = !isHiden;
    	});


    /*語系選單*/
    var islangHiden = true;
    $(".langIcon").click(
		function () {
		    if (islangHiden) {
		        $(".langIcon").css("background-position","0px 0px");
		    $('a', this).addClass("active");
		    $('ul', this).slideDown(200); //up/down effect
		    } else {
		        $(".langIcon").css("background-position", "0px -31px");
		    $('a', this).removeClass("active");
		    if (getCurrentPage != "") {
		        $('a#' + getCurrentPage, this).addClass("active");
		    }
		    $('ul', this).slideUp(200);
		    }
		    islangHiden = !islangHiden;
		});

    fnSetHolderSize();
})

//設定頁面長度
function fnSetHolderSize() {
    $("#dPageHolder").height($("#dHeader").height() + $("#dSubHeader").height() + $("#dTorso").height() + $("#dFooter").height() + $("#dSubFooter").height());
	//alert($("#dPageHolder").height());
}

//輪播廣告特效
//輪播廣告特效
var timeID;
var bannerWidth = 1920; //焦點圖長度
var bannerHeight = 575; //焦點圖高度
var selectionWidth = 184;
var selectionHeight = 65;
var currentSlide = 0; //撥放開始
var previousSlide = 1;
var slideDelay = 5; //停留的時間
var GotoURL = "";//目標網址
var Target = "self";//目標視窗
var filterDelay = 600;//轉場特效時間
var prevObj;//前一個物件
var Zindex = 2;//讓目前圖片顯示在最上層
var filter = ['fadeIn', 'rightIn', 'leftIn', 'topIn', 'bottomIn']; //轉場特效種類

function fnSlideShowFilter(disObj, filterType) {
    if (filterType == "auto") { filterType = filter[Math.floor(Math.random() * (toInt(filter.length - 1) - 0 + 1))]; }
    switch (filterType) {
        case "fadeIn":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("opacity", 0);
            $("#dBanner ul li:eq(" + disObj + ")").animate({ "opacity": 1 }, filterDelay);
            prevObj = disObj;
            break;
        case "rightIn":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("left", bannerWidth + "px");
            $("#dBanner ul li:eq(" + disObj + ")").animate({ "left": -10 + "px" }, filterDelay).animate({ "left": 5 + "px" }, 600).animate({ "left": 0 + "px" }, 500);
            prevObj = disObj;
            break;
        case "leftIn":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("left", -bannerWidth + "px");
            $("#dBanner ul li:eq(" + disObj + ")").animate({ "left": 10 + "px" }, filterDelay).animate({ "left": -5 + "px" }, 600).animate({ "left": 0 + "px" }, 500);
            prevObj = disObj;
            break;
        case "topIn":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("top", -bannerHeight + "px");
            $("#dBanner ul li:eq(" + disObj + ")").animate({ "top": 10 + "px" }, filterDelay).animate({ "top": -5 + "px" }, 400).animate({ "top": 0 + "px" }, 300);
            prevObj = disObj;
            break;
        case "bottomIn":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("top", bannerHeight + "px");
            $("#dBanner ul li:eq(" + disObj + ")").animate({ "top": -10 + "px" }, filterDelay).animate({ "top": 5 + "px" }, 400).animate({ "top": 0 + "px" }, 300);
            prevObj = disObj;
            break;
        case "rightOut":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li").css("left", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + prevObj + ")").animate({ "left": "-30px" }, 500).animate({ "left": bannerWidth + "px" }, 600);
            prevObj = disObj;
            break;
        case "leftOut":
            $("#dBanner ul li").css("z-index", 0);
            $("#dBanner ul li").css("left", 0);
            $("#dBanner ul li:eq(" + prevObj + ")").css("z-index", Zindex);
            $("#dBanner ul li:eq(" + disObj + ")").css("z-index", Zindex - 1);
            $("#dBanner ul li:eq(" + prevObj + ")").animate({ "left": 30 + "px" }, 500).animate({ "left": -bannerWidth + "px" }, 600);
            prevObj = disObj;
            break;
    }
}

function fnSlideShowSlection(disItem, transition) {
    clearTimeout(timeID);
    $("#dSelection ul li a:eq(" + previousSlide + ")").removeClass("active");
    $("#dSelection ul li a:eq(" + disItem + ")").addClass("active");
    fnSlideShowFilter(disItem, transition);
    fnGetResult(disItem);
    currentSlide = disItem;
    previousSlide = disItem;
    timeID = setTimeout("fnSlideShowAuto();", slideDelay * 1000);
}

function fnSlideShowAuto() {
    fnGetResult(currentSlide);
    if (currentSlide == previousSlide) {
        currentSlide = currentSlide + 1;
    }
    $("#dSelection ul li a:eq(" + currentSlide + ")").addClass("active");
    $("#dSelection ul li a:eq(" + previousSlide + ")").removeClass("active");
    fnSlideShowFilter(currentSlide, 'auto'); //輪播變換圖片的特效
    if (currentSlide < $("#dSelection ul li a").length - 1) {
        previousSlide = currentSlide;
        currentSlide++;
    } else {
        previousSlide = currentSlide;
        currentSlide = 0;
    }
    timeID = setTimeout("fnSlideShowAuto();", slideDelay * 1000);
}

function fnGetResult(obj) {
    GotoURL = $("#dBanner ul li:eq(" + obj + ") a").attr("href");
    Target = $("#dBanner ul li:eq(" + obj + ") a").attr("target");
    if (Target == undefined) {
        Target = "self";
    }
}

$(document).ready(function () {
    fnGetResult(currentSlide);
	
	//製作選項==========================================================
//    $("#dSlideshow").append("<div id='dSelection'><ul></ul></div>");
//    var i;
//	if (navigator.userAgent.indexOf("MSIE 8")>0 || navigator.userAgent.indexOf("MSIE 7")>0 || navigator.userAgent.indexOf("MSIE 6")>0){
//		for (i = 0; i < toInt($("#dBanner ul li").length); i++) {
//			$("#dSelection ul").append("<li><a href='#'><img src='"+ $("#dBanner ul li:eq(" + i + ") a img").attr("src") +"' /></a></li>");
//		}
//	}else{
//		for (i = 0; i < toInt($("#dBanner ul li").length); i++) {
//			$("#dSelection ul").append("<li><a href='#'></a></li>");
//			$("#dSelection ul li:eq(" + i + ") a").css("background-image", "url('" + $("#dBanner ul li:eq(" + i + ") a img").attr("src") + "')");
//			$("#dSelection ul li:eq(" + i + ") a").css("background-position", "center");
//			$("#dSelection ul li:eq(" + i + ") a").css("background-repeat", "no-repeat");
//			$("#dSelection ul li:eq(" + i + ") a").css("background-size", "cover");
//		}
//	}
//    
//    $("#dSelection ul").css("width", Math.round(toInt($("#dBanner ul li").length) * selectionWidth) + "px");
//    $("#dSelection ul li").each(function (i) {
//        $(this).click(function () {
//            if ($(this).index() != currentSlide) {
//                fnSlideShowSlection($(this).index(), 'fadeIn');//選項變換圖片的特效
//                return false;
//            }
//        })
//    })
	//==================================================================
	
    $("#dFrame").click(function () {
        if (Target == "new") {
            window.open(GotoURL, Target, '', '');
        } else {
            window.location = GotoURL;
        }
    })
    $("#dFrame").mouseover(function () {
        clearTimeout(timeID);
    })
    $("#dFrame").mouseout(function () {
        timeID = setTimeout("fnSlideShowAuto();", slideDelay * 1000);
    })

    $("#prev").click(function () {
        if (currentSlide != 0) {
            currentSlide = currentSlide - 1;
        } else {
            currentSlide = toInt($("#dBanner ul li").length - 1);
        }
        fnSlideShowSlection(currentSlide, 'rightIn'); //左按紐變換圖片的特效
    })

    $("#next").click(function () {
        if (currentSlide != toInt($("#dBanner ul li").length - 1)) {
            currentSlide = currentSlide + 1;
        } else {
            currentSlide = 0;
        }
        fnSlideShowSlection(currentSlide, 'leftIn'); //右按紐變換圖片的特效
    })

})