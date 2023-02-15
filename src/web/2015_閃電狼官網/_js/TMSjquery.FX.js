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

//戰隊隊員介紹下拉選單
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
    $("#TMSMenu li").hover(
		function () {
		    $('a', this).addClass("active");
		    $('ul', this).slideDown(200); //up/down effect
		}, function () {
		    $('a', this).removeClass("active");
		    if (getCurrentPage != "") {
		        $('a#' + getCurrentPage, this).addClass("active");
		    }
		    $('ul', this).slideUp(200);
		}
	);
    fnSetHolderSize();
})