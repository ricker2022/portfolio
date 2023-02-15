// JavaScript Document
$(function () {
    //常見問題  
    var currTitle = $("#FAQArea").find("div.FqaTitle");
    currTitle.click(function () {
        var currContent = $(this).next("div.FqaContent");
        if (!currContent.is(":visible")) {
            $("#FAQArea").find("div.FqaContent:visible").slideUp();
            $("#FAQArea").find("div.FqaContent:visible").prev("div").removeClass("FqaTitle_down").addClass("FqaTitle");
            $(this).removeClass("FqaTitle").addClass("FqaTitle_down");
            currContent.slideToggle();
        } else {
            $(this).removeClass("FqaTitle_down").addClass("FqaTitle");
            currContent.slideToggle();
        }
    });

    //教學說明  
    var currTitle = $("#TouchArea").find("div.qaTitle");
    currTitle.click(function () {
        var currContent = $(this).next("div.qaContent");
        if (!currContent.is(":visible")) {
            $("#TouchArea").find("div.qaContent:visible").slideUp();
            $("#TouchArea").find("div.qaContent:visible").prev("div").removeClass("qaTitle_down").addClass("qaTitle");
            $(this).removeClass("qaTitle").addClass("qaTitle_down");
            currContent.slideToggle();
        } else {
            $(this).removeClass("qaTitle_down").addClass("qaTitle");
            currContent.slideToggle();
        }
    });
})

//radio btn切換
$(function () {
$('input[type=radio][name=radios]').change(function () {
    if (this.value == 'r1') {
        $(".ULS1Area").css("display", "block");
        $(".ULS2Area").css("display", "none");
    }
    else if (this.value == 'r2') {
        $(".ULS2Area").css("display", "block");
        $(".ULS1Area").css("display", "none");
    }
});
})
