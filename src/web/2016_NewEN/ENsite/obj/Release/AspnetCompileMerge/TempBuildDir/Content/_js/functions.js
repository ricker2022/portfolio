function carousel_touchwipe() {
    $("#myCarousel").swiperight(function () {
        $("#myCarousel").carousel('prev');
    });
    $("#myCarousel").swipeleft(function () {
        $("#myCarousel").carousel('next');
    });
};

function index_CG_comSoon() {
    var gamesNum = $("#CasionGames").find("li").length - 2;
    var deviceW = window.innerWidth;
    $("#comSoon, #comSoon1").hide();
    if (deviceW > 992) {
        if ((gamesNum % 3) == 1) {
            $("#comSoon, #comSoon1").show();
        } else if ((gamesNum % 3) == 2) {
            $("#comSoon1").show();
        }
    } else {
        if ((gamesNum % 2) == 1) {
            $("#comSoon1").show();
        }
    };
};

function index_CG_popup() {
    $("#CasionGames li a").click(function () {
        var gameName = $(this).attr("class");
        //var deviceW = window.innerWidth;
        //if (deviceW > 992) {
        //    $("html").css("position", "relative");
        //} else {
        //    $("html").css("position", "fixed");
        //};
        $("#mask").css({ "background-color": "#000", "filter": "alpha(opacity=80)", "opacity": ".8" });
        $("#mask, .closeBtn, #popGames").show();
        $("#popGameName").attr("src", "/Content/_img/popGames/" + gameName + ".png");
    });

    $("#mask, .closeBtn").click(function () {
        $("#mask, .closeBtn, #popGames").hide();
        $("html").css("position", "relative");
    })
};

function index_CG_preload() {
    var images = [
        '/Content/_img/popGames/Pandora.png',
        '/Content/_img/popGames/Sicbo.png',
        '/Content/_img/playnowBtn.png',
        '/Content/_img/Layout/logo1.png',
        '/Content/_img/Layout/logo2.png',
        '/Content/_img/Layout/logo3.png',
        '/Content/_img/Layout/logo4.png',
        '/Content/_img/Layout/logo5.png'
    ];

    $.preload(images, 1, function (last) {
        if (last) {
            var deviceH = window.innerHeight;
            var popGameH = $("#popGames").height() * 0.7;
            var averageH = Math.abs((deviceH - popGameH) / 2);
            $("#popGames").css("top", averageH + "px");
        }
    });
};

function menuSet() {
    $('.menuBtn').click(function () {
        var deviceW = window.innerWidth;
        var wrapW = $(".wrap").width();
        var wrapH = $(".wrap").height();
        var menuAreaW = $(".menuArea").width();
        var menuAreaH = $(".menuArea").height();
        var menuBtnW = $(".menuBtn").width();
        var menuHeight = wrapH - menuAreaH;
        var menuHeight_b = menuHeight / 0.68;
        var deviceW_helf = (deviceW - wrapW) / 2;
        var menuBtn_left = parseFloat($(".menuBtn").css("left").replace("px", ""));
        var menuBtnLeft = menuBtn_left + menuBtnW;
        var mB = $(".menuArea");
        if (mB.css("display") == "none") {
            if (deviceW > 1199) {
                var wrap_left = (deviceW_helf - (deviceW - menuBtn_left - menuAreaW * 0.8)) * -1;
                $(".menuArea").css("padding-bottom", menuHeight_b + "px");
            } else {
                $(".menuArea").css("padding-bottom", menuHeight + "px");
                var wrap_left = Math.abs((wrapW - (wrapW - menuAreaW))) * -1 + (wrapW - menuBtn_left - menuBtnW);
            };
            mB.show();
            $("#mask").show();
            $("#mask").css({ "background-color": "#fff", "filter": "alpha(opacity=0)", "opacity": "0" });
            $(".wrap").css("left", (wrap_left) + "px");
            $(".menuArea").css("left", menuBtnLeft + "px");
            $(".menuBtn > img").attr("src", "/Content/_img/nav/closeMenuBtn.png");
            $(".menuCloseAnimation img").css("display", "block");
            $(".menuCloseAnimation").addClass("menuClose");
            $("body").css("background-image", "url('')");
        } else {
            mB.hide();
            $("#mask").hide();
            $(".wrap").css("left", "0px");
            $(".menuArea").css("left", "-99999px");
            $(".menuBtn > img").attr("src", "/Content/_img/Layout/menuBtn.png");
            $(".menuCloseAnimation img").css("display", "none");
            $(".menuCloseAnimation").removeClass("menuClose");
            if (deviceW > 1200) {
                $("body").css("background-image", "url('/Content/_img/Layout/topBG_b.jpg')");
            } else {
                $("body").css("background-image", "url('/Content/_img/Layout/topBG.jpg')");
            };
        }
        $('.menuArea li').click(function () {
            mB.hide();
            $(".wrap").css("left", "0px");
            $(".menuArea").css("left", "-99999px");
            $(".menuBtn > img").attr("src", "/Content/_img/Layout/menuBtn.png");
            $(".menuCloseAnimation img").css("display", "none");
            $(".menuCloseAnimation").removeClass("menuClose");
            if (deviceW > 1200) {
                $("body").css("background-image", "url('/Content/_img/Layout/topBG_b.jpg')");
            } else {
                $("body").css("background-image", "url('/Content/_img/Layout/topBG.jpg')");
            };
        });

        $("#mask").click(function () {
            $("#mask").hide();
            $("#mask").css({ "background-color": "#000", "filter": "alpha(opacity=80)", "opacity:": " 0.8" });
            mB.hide();
            $(".wrap").css("left", "0px");
            $(".menuArea").css("left", "-99999px");
            $(".menuBtn > img").attr("src", "/Content/_img/Layout/menuBtn.png");
            $(".menuCloseAnimation img").css("display", "none");
            $(".menuCloseAnimation").removeClass("menuClose");
            if (deviceW > 1200) {
                $("body").css("background-image", "url('/Content/_img/Layout/topBG_b.jpg')");
            } else {
                $("body").css("background-image", "url('/Content/_img/Layout/topBG.jpg')");
            };
        });
    });
};

function Dropdown_list() {
    $('.Dropdown_Title').click(function () {
        var AN = $(this).next("div");
        if (AN.css("display") == "none") {
            $(this).find("div").addClass("active");
            //AN.show();
            AN.slideDown(500);
        } else {
            //AN.hide();
            AN.slideUp(500);
            $(this).find("div").removeClass("active");
        }
    });
};

function SubjectSteering() {
    var SubjectH = $(".Dropdown_Title").height();
    $(".new_arrow, .new_arrow.active, .GI_arrow, .GI_arrow.active").css("padding-bottom", SubjectH + "px");
    var newH = $(".Dropdown_Title div").height();
    $(".Dropdown_Title").css("line-height", SubjectH + "px");
};

function gotop() {
    $('html,body').animate({ scrollTop: 0 }, 'fast');
}

$(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
        $('#goTop').fadeIn("fast");
    } else {
        $('#goTop').stop().fadeOut("fast");
    }
});