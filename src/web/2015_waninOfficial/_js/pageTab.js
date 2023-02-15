$(function () {
    

    var s;
    if ($.cookie("tabIndex") != null) {
        s = $.cookie("tabIndex");
    } else {
        s = 0;
    }
    if (location.search.substring(1) != "") {
        s = location.search.substring(1);
    }

    if (location.href.search("business") != -1) {
        if (s == 2 || s == 3) {
            $('.tab_container').css("background-image", "url(image/pinkBG__02.jpg)");
            $(".subTagM").attr("id", "list03");
        }
        else {
            $('.tab_container').css("background-image", "url(image/businesBG_02.jpg)");
            $(".subTagM").attr("id", "list02");
        }
    }
    menuf(s);
    $(window).load(setHeight());
});



function menuf(tabIndex) {
	
	
    var _showTab = 0;

    if (tabIndex != 0) {
        _showTab = tabIndex;
    }
    
    var $defaultLi = $('ul.subTagM li').eq(_showTab).addClass('active');
    $($defaultLi.find('a').attr('href')).siblings().hide();

    // 當 li 頁籤被點擊時...
    // 若要改成滑鼠移到 li 頁籤就切換時, 把 click 改成 mouseover
    $('ul.subTagM li').click(function () {
        // 找出 li 中的超連結 href(#id)
		
        var $this = $(this),
			_clickTab = $this.find('a').attr('href');
        // 把目前點擊到的 li 頁籤加上 .active
        // 並把兄弟元素中有 .active 的都移除 class
        $this.addClass('active').siblings('.active').removeClass('active');
        // 淡入相對應的內容並隱藏兄弟元素
        $(_clickTab).stop(false, true).fadeIn().siblings().hide();
		
		var nowH = $(".tab_container").height()-30;
		setHeight()
		
        return false;
    }).find('a').focus(function () {
        this.blur();
		
		
		
    });


    $("#zone-bar ul li").bind("click", function () {
        var $this = $(this),
    			_clickTab = $this.find('a').attr('id'),
                _clickHref = $this.find('a').attr('href');

        //alert(_clickHref);
        window.location.href = _clickHref;

        var ss = $('a[href$="' + _clickTab + '"]').parent();
        ss.addClass('active').siblings('.active').removeClass('active');

        //$(_clickTab).stop(false, true).fadeIn().siblings().hide();

        return false;
    }).find('a').focus(function () {
        this.blur();
		
		
		$(window).load(setHeight);
    });
	
	
}
function setHeight() {
	var nowH = $(".tab_container").height()-30;
	$(".subTagM").height(nowH);
}
function gotoTab(alink,tabIndex) {
	
	$.cookie("tabIndex", tabIndex);
	window.location.href = alink;

}
function gotoBrand(alink, tabIndex) {

    $.cookie("BrandIndex", tabIndex);
    window.location.href = alink;

}