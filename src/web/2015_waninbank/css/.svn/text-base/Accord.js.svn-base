$(function () {

    var accordIndex;

    if ($.cookie("BrandIndex") != null) {
        accordIndex = $.cookie("BrandIndex");
    } else {
        accordIndex = 0;
    }

    $('span').each(function (i) {
        this.onclick = function () {
            this.target = "_blank";
            switch (i) {
                case 0://molo領航員
                    //window.parent.location.href = 'https://www.molo.gs/';
                    window.open("https://www.molo.gs/", "_blank");
                    break;
                case 1://moloApp
                    window.open("https://play.google.com/store/apps/details?id=molo.molo", "_blank");
                    break;
                case 2://moloSport
                    window.open("http://sport.molo.gs/preorder/", "_blank");
                    break;
                case 3://遊E卡官網
                    window.open("https://www.yoe.com.tw", "_blank");
                    break;
                case 4://星城HD
                    window.open("http://www.xin-stars.com/AppDownload.aspx?utm_source=group&utm_medium=hd", "_blank");
                    break;
                case 5://星城
                    window.open("http://www.xin-stars.com/AppDownload.aspx?utm_source=group&utm_medium=hd", "_blank");
                    break;
                case 6://永世2014
                        window.open("https://play.google.com/store/apps/details?id=com.wanin.En", "_blank");
                        break;
                case 7://史艷文傳奇
                    window.open("http://molome.tw/r/LL1v", "_blank");
                    break;
                case 8://星城
                    window.open("http://www.xin-stars.com/", "_blank");
                    break;
                case 9://劍俠叁
                    window.open("http://jx3.molome.tw/", "_blank");
                    break;
                case 10://尋龍
                    window.open("http://xl.molome.tw/event/201401/1/", "_blank");
                    break;
                case 11: //爭龍傳
                    window.open("http://jl.molome.tw/event/201401/2/", "_blank");
                    break;
                case 12://閃電狼官網
                    window.open("http://www.yoeflashwolves.com/", "_blank");
                    break;
                case 13://閃電狼粉絲團
                    window.open("https://www.facebook.com/#!/FlashWolves", "_blank");
                    break;
                case 14://鐵人論壇
                    window.open("http://www.ironforum.com.tw/", "_blank");
                    break;
            }
            return false;
        };
    });

    // 初始化參數
    var _navLi = $("#nav li"),
		speed = 200, // 移動速度
		maxWidth = 580, // 最大寬
		minWidth = 80,  // 最小寬
		diffWidth = maxWidth - minWidth;

    _navLi.each(function (i) {
        var _this = $(this),
			_prev = _this.prev(),
            _left;

        if (accordIndex == 0) {
            _left = !_prev.length == 0 ? (_prev.position().left + (i == 1 ? maxWidth - 80 : minWidth)) : 0;
        } else {
            _left = !(_this.index() <= 1) ? (_prev.position().left + (i == parseInt(accordIndex) + 1 ? maxWidth : minWidth)) : 0;
        }

        // 先把每一個 li 的位置都放到定位
        // 並把 left 值記錄起來
        _this.css("left", _left).data("left", _left);

        $.cookie("BrandIndex", "0");
    }).mouseover(function () {

        nowHover = _navLi.index($(this));
        // console.log("nowHover" + nowHover);

        _navLi.each(function (i) {
            var _this = $(this),
			_prev = _this.prev(),
            _left;
            //console.log("nowHover" + _navLi.index(nowHover));
            if (nowHover == 0) {
                _left = !_prev.length == 0 ? (_prev.position().left + (i == 1 ? maxWidth - 80 : minWidth)) : 0;
            } else {
                _left = !(_this.index() <= 1) ? (_prev.position().left + (i == parseInt(nowHover) + 1 ? maxWidth : minWidth)) : 0;
            }

            _this.css("left", _left).data("left", _left);
        });

    });

    // 當滑鼠離開 #nav 時把選項都滑回原來位置
    $("#nav").mouseleave(function () {
        $("li", this).each(function (i) {
            _left = i > 0 ? maxWidth - 80 + minWidth * (i - 1) : 0;

            var _this = $(this);

            _this.stop().animate({
                left: _left
            }, speed);
            //console.log("left" + _left);
        });
    });

});

