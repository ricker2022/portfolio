<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/_uc/ADbannerB.ascx" TagPrefix="uc1" TagName="ADbannerB" %>
<%@ Register Src="~/_uc/ADbannerS.ascx" TagPrefix="uc1" TagName="ADbannerS" %>
<%@ Register Src="~/_uc/ADbannerBm.ascx" TagPrefix="uc1" TagName="ADbannerBm" %>
<%@ Register Src="~/_uc/ADbannerSm.ascx" TagPrefix="uc1" TagName="ADbannerSm" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="_css/AD.css" rel="stylesheet" />
    <script src="_js/ADbannerBm.js"></script>

     <script type="text/javascript">
         $(function () {
             /*首頁設定顯示87%*/
             if (navigator.userAgent.toUpperCase().indexOf('FIREFOX') > 0) {
                 //火狐判斷
                 $('#MainContent').attr('style', 'margin:30px auto;-moz-transform:scale(0.87)')
             } else if (navigator.userAgent.indexOf('MSIE 8') > 0) {
                 //IE判斷8
                 $('#MainContent').css('margin', '50px auto 30px auto');
             } else if (navigator.userAgent.indexOf('MSIE 9') > 0) {
                 //IE判斷9
                 $('#MainContent').css('margin', '50px auto 30px auto');
             } else if (navigator.userAgent.indexOf('MSIE 10') > 0) {
                 //IE判斷10
                 $('#MainContent').css('margin', '50px auto 30px auto');
             } else if (navigator.userAgent.indexOf('rv:11.0') > 0) {
                 //IE判斷11
                 $('#MainContent').css('margin', '25px auto 30px auto').css('zoom', '92%');
             } else {
                 //其餘狀況
                 $('#MainContent').css('zoom', '87%');
             }

             
             /*------------------------------------------------------*/

             $("#item02").mouseenter(function () {
                 $("#item02c").show();
             })
             $("#item02").mouseleave(function () {
                 $("#item02c").hide();
             })
             $("#item03").mouseenter(function () {
                 $("#item03c").show();
             })
             $("#item03").mouseleave(function () {
                 $("#item03c").hide();
             })
             $("#item04").mouseenter(function () {
                 $("#item04c").show();
             })
             $("#item04").mouseleave(function () {
                 $("#item04c").hide();
             })
             $("#item05").mouseenter(function () {
                 $("#item05c").show();
             })
             $("#item05").mouseleave(function () {
                 $("#item05c").hide();
             })
             $("#item06").mouseenter(function () {
                 $("#item06c").show();
             })
             $("#item06").mouseleave(function () {
                 $("#item06c").hide();
             })
             $("#item07").mouseenter(function () {
                 $("#item07c").show();
             })
             $("#item07").mouseleave(function () {
                 $("#item07c").hide();
             })
             $("#item08").mouseenter(function () {
                 $("#item08c").show();
             })
             $("#item08").mouseleave(function () {
                 $("#item08c").hide();
             })
             $("#item09").mouseenter(function () {
                 $("#item09c").show();
             })
             $("#item09").mouseleave(function () {
                 $("#item09c").hide();
             })
             $("#item10").mouseenter(function () {
                 $("#item10c").show();
             })
             $("#item10").mouseleave(function () {
                 $("#item10c").hide();
             })
             $("#item11").mouseenter(function () {
                 $("#item11c").show();
             })
             $("#item11").mouseleave(function () {
                 $("#item11c").hide();
             })
             $("#item12").mouseenter(function () {
                 $("#item12c").show();
             })
             $("#item12").mouseleave(function () {
                 $("#item12c").hide();
             })
             $("#item13").mouseenter(function () {
                 $("#item13c").show();
             })
             $("#item13").mouseleave(function () {
                 $("#item13c").hide();
             })
             $("#item14").mouseenter(function () {
                 $("#item14c").show();
             })
             $("#item14").mouseleave(function () {
                 $("#item14c").hide();
             })
             $("#item15").mouseenter(function () {
                 $("#item15c").show();
             })
             $("#item15").mouseleave(function () {
                 $("#item15c").hide();
             })
             $("#item16").mouseenter(function () {
                 $("#item16c").show();
             })
             $("#item16").mouseleave(function () {
                 $("#item16c").hide();
             })
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <section id="MainContent">
            <div class="dContent">
                <div class="item item1">
                    <!--↓↓輪播廣告特效↓↓-->
                    <div id="dSlideshow">
                        <uc1:ADbannerB runat="server" ID="ADbannerB" />
                    </div>
                    <!--↑↑輪播廣告特效↑↑-->
                </div>

                <article id="item02" class="item item2">
                    <h1 class="ItemTitle">關於網銀</h1>
                    <img src="_img/layout/item01.png" alt="關於網銀" />
                    <div id="item02c" class="itemHover item2">
                        <h1 class="ItemTitle ItemHoverTitle"><a href="about.aspx">關於網銀</a></h1>
                        <ul class="hoverText">
                            <li class="hoverTextLiTAC"><a href="concept.aspx">經營理念</a></li>
                            <li class="hoverTextLiTAC"><a href="periodical.aspx">網銀刊物</a></li>
                            <li class="hoverTextLiTAC"><a href="video.aspx">影音專區</a></li>
                        </ul>
                    </div>
                </article>

                <%--<a href="moLo.aspx">--%>
                    <article id="item03" class="item item3">
                        <h1 class="ItemTitle">數位雲端</h1>
                        <img src="_img/layout/ADpic.jpg" />
                        <div id="item03c" class="itemHover item3">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="moLo.aspx">數位雲端</a></h1>
                            <ul class="hoverText" style="margin: 0 0 0 112px;">
                                <li class="hoverTextLiTAL"><a href="moLo.aspx#moLo">moLo領航員</a></li>
                                <li class="hoverTextLiTAL"><a href="moLo.aspx#moLoApp">moLo App</a></li>
                                <li class="hoverTextLiTAL"><a href="moLo.aspx#moLoSport">moLo Sport互動式娛樂健身車</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="games.aspx">--%>
                    <article id="item04" class="item item4">
                        <h1 class="ItemTitle">遊戲娛樂</h1>
                        <img src="_img/layout/item02.png" />
                        <div id="item04c" class="itemHover item4 mtnum">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="games.aspx">遊戲娛樂</a></h1>
                            <ul class="hoverText" style="margin: 0 0 0 40px;">
                                <li class="hoverTextLiTAL"><a href="games.aspx#game1">星城Online</a></li>
                                <li class="hoverTextLiTAL"><a href="games.aspx#game2">劍俠奇緣叁免費版</a></li>
                                <li class="hoverTextLiTAL"><a href="games.aspx#game3">尋龍Online</a></li>
                                <li class="hoverTextLiTAL"><a href="games.aspx#game4">爭龍傳Online</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="gameTeam.aspx">--%>
                    <article id="item05" class="item item5">
                        <h1 class="ItemTitle">職業電競</h1>
                        <img src="_img/layout/item03.png" />
                        <div id="item05c" class="itemHover item5" style="margin: 238px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="gameTeam.aspx">職業電競</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC"><a href="gameTeam.aspx#gameTeam">yoe閃電狼</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="ironforum.aspx">--%>
                    <article id="item06" class="item item6">
                        <h1 class="ItemTitle">遊戲論壇</h1>
                        <img src="_img/layout/item04.png" />
                        <div id="item06c" class="itemHover item6" style="margin: 238px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="ironforum.aspx">遊戲論壇</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC"><a href="ironforum.aspx#iron">鉄人論壇</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="wanin.aspx">--%>
                    <article id="item07" class="item item7">
                        <h1 class="ItemTitle">人文關懷</h1>
                        <img src="_img/layout/item05.png" />
                        <div id="item07c" class="itemHover item7" style="margin: 476px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="wanin.aspx">社會責任</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC"><a href="wanin.aspx#wanin">網銀基金會</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="points.aspx">--%>
                    <article id="item08" class="item item8">
                        <h1 class="ItemTitle">點數加值</h1>
                        <img src="_img/layout/item06.png" />
                        <div id="item08c" class="itemHover item8" style="margin: 476px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="points.aspx">點數加值</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC"><a href="points.aspx#yoe">遊e卡</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="mobileGames.aspx">--%>
                    <article id="item09" class="item item9">
                        <h1 class="ItemTitle">手機遊戲</h1>
                        <img src="_img/layout/item07.png" />
                        <div id="item09c" class="itemHover item9" style="margin: 476px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="mobileGames.aspx">手機遊戲</a></h1>
                            <ul class="hoverText" style="margin: 0 0 0 58px;">
                                <li class="hoverTextLiTAL"><a href="mobileGames.aspx#mg1">星城HD</a></li>
                                <li class="hoverTextLiTAL"><a href="mobileGames.aspx#mg2">星城經典版</a></li>
                                <li class="hoverTextLiTAL"><a href="mobileGames.aspx#mg3">史豔文傳奇</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="wanin.aspx">--%>
                    <article id="item11" class="item item11">
                        <h1 class="ItemTitle">人文關懷</h1>
                        <img src="_img/layout/item05.png" />
                        <div id="item11c" class="itemHover item11" style="margin: 550px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="wanin.aspx">社會責任</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC pt30"><a href="wanin.aspx#wanin">網銀基金會</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="points.aspx">--%>
                    <article id="item12" class="item item12">
                        <h1 class="ItemTitle">點數加值</h1>
                        <img src="_img/layout/item06.png" />
                        <div id="item12c" class="itemHover item12" style="margin: 550px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="points.aspx">點數加值</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC pt30"><a href="points.aspx#yoe">遊e卡</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="mobileGames.aspx">--%>
                    <article id="item13" class="item item13">
                        <h1 class="ItemTitle">手機遊戲</h1>
                        <img src="_img/layout/item07.png" />
                        <div id="item13c" class="itemHover item13" style="margin: 550px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="mobileGames.aspx">手機遊戲</a></h1>
                            <ul class="hoverText" style="margin: 0 0 0 58px;">
                                <li class="hoverTextLiTAL"><a href="mobileGames.aspx#mgM1">星城HD</a></li>
                                <li class="hoverTextLiTAL"><a href="mobileGames.aspx#mgM2">星城經典版</a></li>
                                <li class="hoverTextLiTAL"><a href="mobileGames.aspx#mgM3">史豔文傳奇</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="gameTeam.aspx">--%>
                    <article id="item14" class="item item14">
                        <h1 class="ItemTitle">職業電競</h1>
                        <img src="_img/layout/item03.png" />
                        <div id="item14c" class="itemHover item14" style="margin: 825px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="gameTeam.aspx">職業電競</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC pt30"><a href="gameTeam.aspx#gameTeam">yoe閃電狼</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="moLo.aspx">--%>
                    <article id="item15" class="item item15">
                        <h1 class="ItemTitle">數位雲端</h1>
                        <img src="_img/layout/ADpic.jpg" />
                        <div id="item15c" class="itemHover item15" style="margin:825px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="moLo.aspx">數位雲端</a></h1>
                            <ul class="hoverText" style="margin: 0 0 0 112px;">
                                <li class="hoverTextLiTAL"><a href="moLo.aspx#moLo">moLo領航員</a></li>
                                <li class="hoverTextLiTAL"><a href="moLo.aspx#moLoApp">moLo App</a></li>
                                <li class="hoverTextLiTAL"><a href="moLo.aspx#moLoSport">moLo Sport互動式娛樂健身車</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <%--<a href="ironforum.aspx">--%>
                    <article id="item16" class="item item16">
                        <h1 class="ItemTitle">遊戲論壇</h1>
                        <img src="_img/layout/item04.png" />
                        <div id="item16c" class="itemHover item16" style="margin: 1101px 0 0 0;">
                            <h1 class="ItemTitle ItemHoverTitle"><a href="ironforum.aspx">遊戲論壇</a></h1>
                            <ul class="hoverText">
                                <li class="hoverTextLiTAC pt30"><a href="ironforum.aspx#iron">鉄人論壇</a></li>
                            </ul>
                        </div>
                    </article>
                <%--</a>--%>

                <article class="item item10">
                    <!--↓↓輪播廣告特效↓↓-->
                    <div id="dSlideshowS">
                        <uc1:ADbannerS runat="server" id="ADbannerS" />
                    </div>
                    <!--↑↑輪播廣告特效↑↑-->
                </article>
            </div>
        </section>
        <section id="MainContentM">
            <div class="item item1">
                <!--↓↓輪播廣告特效↓↓-->
                <div id="dSlideshowM">
                    <uc1:ADbannerBm runat="server" ID="ADbannerBm" />
                </div>
                <!--↑↑輪播廣告特效↑↑-->
            </div>

            <a href="moLo.aspx">
                <article id="item02M" class="item item2">
                    <h1 class="ItemTitle">數位雲端</h1>
                    <img class="img-responsive" src="_img/mobile/layout/ADpicM.jpg" />
                </article>
            </a>

            <a href="points.aspx">
                <article id="item03M" class="item item3">
                    <h1 class="ItemTitle">點數加值</h1>
                    <img class="img-responsive" src="_img/mobile/layout/item01m.jpg" />
                </article>
            </a>

            <a href="mobileGames.aspx">
                <article id="item04M" class="item item4 itemMargin">
                    <h1 class="ItemTitle">手機遊戲</h1>
                    <img class="img-responsive" src="_img/mobile/layout/item02m.jpg" />
                </article>
            </a>

            <article class="item item5">
                <!--↓↓輪播廣告特效↓↓-->
                <div id="dSlideshowSM">
                    <uc1:ADbannerSm runat="server" ID="ADbannerSm" />
                </div>
                <!--↑↑輪播廣告特效↑↑-->
            </article>

            <a href="games.aspx">
                <article id="item06M" class="item item6">
                    <h1 class="ItemTitle">遊戲娛樂</h1>
                    <img class="img-responsive" src="_img/mobile/layout/item03m.jpg" />
                </article>
            </a>

            <a href="gameTeam.aspx">
                <article id="item07M" class="item item7 itemMargin">
                    <h1 class="ItemTitle">職業電競</h1>
                    <img class="img-responsive" src="_img/mobile/layout/item04m.jpg" />
                </article>
            </a>
            <a href="ironforum.aspx">
                <article id="item08M" class="item item8">
                    <h1 class="ItemTitle">遊戲論壇</h1>
                    <img class="img-responsive" src="_img/mobile/layout/item05m.jpg" />
                </article>
            </a>

            <a href="about.aspx">
                <article id="item09M" class="item item9 itemMargin">
                    <h1 class="ItemTitle">關於網銀</h1>
                    <img class="img-responsive" src="_img/mobile/layout/item06m.jpg" />
                </article>
            </a>

        </section>
    </div>
</asp:Content>

