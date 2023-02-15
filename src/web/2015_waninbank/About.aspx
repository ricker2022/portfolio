<%@ Page Title="" Language="C#" MasterPageFile="~/menuPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>網銀國際-企業簡介</title>
    <script src="css/jquery.min.js" type="text/javascript"></script>
    <script src="css/pageTab.js" type="text/javascript"></script>
    <link href="css/subPage.css" rel="stylesheet" type="text/css" />
    <script src="css/cookie.js" type="text/javascript"></script>
    <link href="css/popBox.css" rel="stylesheet" />
    <style>
        .booklink {
            color: #00b0ff;
        }

            .booklink a:link, a:active {
                color: #00b0ff;
                text-decoration: underline;
            }
    </style>
    <script>
        var i = 5;
        function showView(no) {
            $(".pobBox").load("onLineBook.aspx?no=" + no);
            $(".popDiv").show(); $(".popDivBg").show();
            
        }
        function preB() {
            var imgW = 235;
            var nowBox = $(".hotDiv");
            nowBox.stop(true, true);
            var pos = nowBox.position().left;
            if (pos < 0) {
                nowBox.animate({ "left": "+=" + imgW + "px" }, "slow");
            }
        }
        function nextB() {
            lazyImg(i);
            i++;
            var imgW = 235;
            var nowBox = $(".hotDiv");
            nowBox.stop(true, true);
            var count = nowBox.find("li").size() - 4;
            var pos = nowBox.position().left;
            var nowBoxW = (nowBox.find("li").size() + 1) * imgW;
            nowBox.css("width", nowBoxW);

            if (pos > -(count * imgW)) {
                nowBox.animate({ "left": "-=" + imgW + "px" }, "slow");
            }
        }
        function imgClick() {
            var nowBox = $(".hotDiv");
            var nowBox = $(this).parent().prev().children().find(".hotDiv");
        }
        function closePop() {
            $(".popDiv").hide(); $(".popDivBg").hide();
            i = 5;
        }
        function zoomB() {
            var nowUrl = $("#bigImg img").attr("src");
            $(".popDivBig img").attr("src", nowUrl);
            $(".popDivBig").show();
        }
        function closeZoom() {
            $(".popDivBig").hide();
        }
        function lazyImg(item) {
            $('.bookImg').eq(item).attr('src', $('.bookImg').eq(item).attr('lazy'));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="subTag">
        <ul class="subTagM" id="list01">
            <li><a href="#tab1">關於網銀</a></li>
            <li><a href="#tab2">經營理念</a></li>
            <%--<li><a href="#tab3">重要里程碑</a></li>--%>
            <li><a href="#tab4">未來願景</a></li>
            <li><a href="#tab5">網銀季刊</a></li>
        </ul>
        <ul class="tab_container" style="background: url(image/aboutBG_02.jpg) bottom no-repeat #ffffff; margin-bottom: 30px">
            <li id="tab1">
                <ul class="blue">
                    <li id="blueHeader">關於網銀</li>
                    <li style="background: none; padding-left: 0; padding-bottom: 20px">行動時代手機號碼等同個人身份，網銀國際從手機登入機制moLo開始，持續研發與串接更多行動服務，包括：moLo 領航員、行動應用程式 moLo App 以及多款手機遊戲。2014年更積極跨入整合運動與遊戲的平台。</li>
                    <li style="background: none; padding-left: 0; margin-bottom: 20px">除了線上服務，網銀國際也投入實體遊戲點卡通路市場，發行遊戲點卡「 遊e卡」，以及知名電競團隊 「yoe閃電狼(Flash Wolves)」。</li>
                    <li style="background: none; padding-left: 0">站在使用者角度，提供跨平台娛樂整合服務，是開發者的任務，也是網銀不變的使命。</li>
                    <p class="imgP">
                        <img src="image/waninLogo.jpg" width="172" height="70" />
                    </p>
                    <li>網銀國際企業識別，是取英文名稱WANIN字首「W」及「i」編排而成。</li>
                    <li>網絡就如同一個圓，無論在哪全部都能連接在一起。</li>
                    <li style="margin-bottom: 200px">從純淨的白灰色系圓球，透過輕快的流順弧線，勾勒出象徵自由的翅膀，搭配沉穩精鍊的藍色調系，在動靜之間取得視覺平衡；期望帶著創新、超越的精神，恣意遨遊飛向網路世界。</li>
                </ul>
            </li>
            <li id="tab2">
                <ul class="blue">
                    <li id="blueHeader">經營理念</li>
                    <p class="headP">公司定位</p>
                    <li>『娛樂數位內容提供者』，以網路金流整合與新興系統工具開發、服務為主。</li>
                    <p class="imgP" style="padding-top: 10px;">
                        <img src="image/about_03.jpg" width="203" height="195" />
                    </p>
                    <p class="headP">安全便利：</p>
                    <li>網銀專業團隊秉持以"安全為本．便利為輔"的研發精神，致力經營旗下每項產品與服務；並以高標準的「安全」、「便利」兩大原則，研發快捷的網路服務、行動裝置應用為目的，期望能滿足消費者需求，深獲社會大眾的信賴與支持！</li>
                    <p class="headP">多元創新：</p>
                    <li>網路世界日益進步，本公司自成立以來不斷鞭策自我，精益求精，現今更跨足行動裝置軟體應用及3D引擎研製等，追求多角化經營與創新研發，建立全方位通路平台，為的就是因應世界潮流、掌握市場先趨。未來更將持續挑戰與不同產業合作，透過雲端科技讓消費者帶來便利、安全的網路服務，不分國界達到智慧生活的目標！</li>
                    <p class="headP">FUN!</p>
                    <li style="margin-bottom: 200px">身為「娛樂數位內容提供者」，我們不僅在網路金流平台有所表現，更積極的投入在娛樂相關事業，不論是發行遊戲點數或遊戲代理與研發，持續強化資訊服務，透過消費者角度，打造全方位的電子商務，讓遊戲世界更加有趣！！</li>
                </ul>
            </li>
            <li id="tab3">
                <ul class="blue2" style="margin-bottom: 200px">
                    <li id="blueHeader">重要里程碑</li>
                    <li><span id="timeT">2008.7</span><span>網銀創立 由一群資訊領域團隊設立而成</span></li>
                    <li><span id="timeT">2010.7</span><span>分別與Seattle University和朝陽科大建教合作</span></li>
                    <li><span id="timeT">2010.9</span><span>推出「Safee」金流代收代付交易平台為發展中心，拓展市場佔有率</span></li>
                    <li><span id="timeT">2010.12</span><span>網路安全隨付系統(中華民國 M 393753 號)經濟部財產局核准</span></li>
                    <li><span id="timeT">2011.7</span><span>ISO27001通過資訊安全管理驗證績優廠商</span></li>
                    <li><span id="timeT">2011.7</span><span>投入3D引擎研製，發展獨特3D成像技術，打造流暢真實數位娛樂界面</span></li>
                    <li><span id="timeT">2011.10</span><span>獲得<a href='http://www.managertoday.com.tw/?p=7610' style='color: #0685b7;' target='_blank'>《經理人MANAGER today雜誌》</a>專題報導</span></li>
                    <li><span id="timeT">2011.11</span><span>以通訊身分識別之概念，結合食衣住行育樂計劃，推動<br />
                        「moLo」全方位數位雲端平台</span></li>
                    <li><span id="timeT">2012.3</span><span>整合遊e卡發行業務，跨足遊戲通路市場</span></li>
                    <li><span id="timeT">2012.8</span><span>職業電競隊伍「yoe鋼鐵人」成為正式員工</span></li>
                    <li><span id="timeT">2013.4</span><span>納入「彩金俱樂部」線上遊戲，朝向遊戲娛樂產業推進</span></li>
                    <li><span id="timeT">2013.8</span><span>職業電競隊伍「yoe鋼鐵人」重新更名為「yoe閃電狼(Flash Wolves)」</span></li>
                    <li><span id="timeT">2013.10</span><span>宣佈取得「星城平台」全球運營權</span></li>
                    <li><span id="timeT">2013.12</span><span>以服務專業玩家為宗旨，成立遊戲論壇(鉄人)</span></li>
                </ul>
            </li>
            <li id="tab4">
                <ul class="blue">
                    <li id="blueHeader">未來願景</li>
                    <li>全世界己經進入了網路e化的時代，讓消費者帶來便利性、安全性的網路交易模式，透過雲端運算發展科技化服務，達到智慧生活的目標，顯然已是必然的趨勢。 
網銀國際將秉持一貫的經營信念，努力發展促進新興產業的雲端服務為最終使命！
                    </li>
                </ul>
            </li>
            <li id="tab5">
                <div style="float: left; width:30%;">
                    <ul>
                        <li id="blueHeader">網銀季刊</li>
                        <li style="margin-bottom: 0;">
                            <img alt="" src="image/waninBook.png" /></li>
                        <li style="margin: 0 0 0 20px; line-height: 25px">網銀季刊創刊號</li>
                        <li class="booklink" style="margin: 0 0 0 20px; line-height: 25px">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">下載</asp:LinkButton>
                            | <a href="javascript:showView('01')">線上預覽</a></li>
                    </ul>
                </div>
                <div class="bookItem" style="float: left; width:30%;">
                    <ul>
                        <li>&nbsp</li>
                        <li style="margin-bottom: 0;">
                            <img alt="" src="image/waninBook02.jpg" /></li>
                        <li style="margin: 0 0 0 12px; line-height: 25px">《網銀人》NO.2</li>
                        <li class="booklink" style="margin: 0 0 0 20px; line-height: 25px">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">下載</asp:LinkButton>
                            | <a href="javascript:showView('02')">線上預覽</a></li>
                    </ul>
                </div>


                <div class="bookItem" style="float: left; width:30%;">
                    <ul>
                        <li>&nbsp</li>
                        <li style="margin-bottom: 0;">
                            <img alt="" src="image/waninBook03.jpg" /></li>
                        <li style="margin: 0 0 0 12px; line-height: 25px">《網銀人》NO.3</li>
                        <li class="booklink" style="margin: 0 0 0 20px; line-height: 25px">
                            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">下載</asp:LinkButton>
                            | <a href="javascript:showView('03')">線上預覽</a></li>
                    </ul>
                </div>


                <div style="clear: both;" />
                <%--download/waninBook01.pdf--%>
            </li>

        </ul>
    </div>
    <div class="popDivBg" style="display: none;"></div>
    <div class="popDiv" style="display: none;">
        <div class="pobBox">
        </div>
        <%--<a class="btnClose" onclick="closeIronPop()" style="position: absolute;right:8px;top:8px;margin:0;"></a>--%>
    </div>
    <div class="popDivBig" style="display: none;">
        <a style="position: fixed; top: 0; left: 0;" href="javascript:closeZoom()" class="zoomBack"></a>
        <img alt="" src="" />
    </div>
</asp:Content>

