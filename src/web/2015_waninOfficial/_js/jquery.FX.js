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