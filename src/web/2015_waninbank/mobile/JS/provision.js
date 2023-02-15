var templ = "繁體中文"
var clt = location.search;
var tableWDiv = 'prov01tw';
$(function () {
    resize();
    $(window).resize(function () {
        resize();
    });

    $('.l1 , .l2').click(function () {
        btnCtrl($(this).hasClass('l1'), $(this));
    });
    $('.l1person , .l2person').click(function () {
        personBtnCtrl($(this).hasClass('l1person'), $(this));
    });
    if (clt == '?l=ch') {
        loadLType('简体中文');
    } else if (location.search == '?l=en') {
        loadLType('English');
    } else {
        loadLType('繁體中文');
    }
});
function loadLType(l) {
    if ($('.l1person').text() != "") {
        if ($('.l1person').eq(0).text() == l) {
            $('.l1person').eq(0).click();
        } else if ($('.l2person').eq(0).text() == l) {
            $('.l2person').eq(0).click();
        }
    } else {
        if ($('.l1').eq(0).text() == l) {
            $('.l1').eq(0).click();
        } else if ($('.l2').eq(0).text() == l) {
            $('.l2').eq(0).click();
        }
    }
}
function btnCtrl(bool, item) {
    var temp = item.text();
    var ltype = 1;
    $('.lang').hide();
    if (item.text() == '简体中文') {
        clt = '?l=ch';
        ltype = 4;
        $('#prov01ch').show();
        $('.ui-block-a').children().eq(2).show();
        $('.ui-block-a a').css('width', '32.3%');
        tableWDiv = 'prov01ch';
    } else if (item.text() == '繁體中文') {
        ltype = 1;
        clt = '';
        $('#prov01tw').show();
        $('.ui-block-a').children().eq(2).show();
        $('.ui-block-a a').css('width', '32.3%');
        tableWDiv = 'prov01tw';
    } else if (item.text() == 'English') {
        clt = '?l=en';
        ltype = 7;
        $('#prov01en').show();
        $('.ui-block-a').children().eq(2).hide();
        $('.ui-block-a a').css('width', '49.3%');
        tableWDiv = 'prov01en';
    }
    if (bool) {
        $('.l1').text(templ);
    } else {
        $('.l2').text(templ);
    }
    templ = temp;

    $('.ui-block-a').children().each(function () {
        var url = "";
        if ($(this).attr('href').indexOf('?') != -1) {
            $(this).attr('href', $(this).attr('href').substring(0, $(this).attr('href').indexOf('?')) + clt);
        } else {
            $(this).attr('href', $(this).attr('href') + clt);
        }
        $(this).text(tabName[ltype]);
        ltype++;
    });
}

function personBtnCtrl(bool, item) {
    var temp = item.text();
    var ltype = 1;
    $('.lang').hide();
    if (item.text() == '简体中文') {
        clt = '?l=ch';
        ltype = 4;
        $('#prov01ch').show();
        $('.ui-block-a').children().eq(2).show();
    } else if (item.text() == '繁體中文') {
        ltype = 1;
        clt = '';
        $('#prov01tw').show();
        $('.ui-block-a').children().eq(2).show();
    } 
    if (bool) {
        $('.l1person').css('font-weight', '700');
        $('.l2person').css('font-weight', '');
    } else {
        $('.l1person').css('font-weight', '');
        $('.l2person').css('font-weight', '700');
    }

    $('.ui-block-a').children().each(function () {
        var url = "";
        if ($(this).attr('href').indexOf('?') != -1) {
            $(this).attr('href', $(this).attr('href').substring(0, $(this).attr('href').indexOf('?')) + clt);
        } else {
            $(this).attr('href', $(this).attr('href') + clt);
        }
        $(this).text(tabName[ltype]);
        ltype++;
    });
}

function resize() {
    $('#content').css('height', $(window).height() - 130);
    $('#content').css('-webkit-overflow-scrolling', 'touch');
    if (location.pathname.indexOf('Personal') == -1 && tableWDiv != 'prov01en') {
        if ($(window).width() <= 519) {
            $('.ui-block-a a').css('line-height', '23px');
        } else {
            $('.ui-block-a a').css('line-height', '47px');
        }
    }

    $('.content table').css('width', $('#' + tableWDiv).width());

    
}