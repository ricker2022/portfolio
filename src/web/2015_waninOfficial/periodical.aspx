<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="periodical.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="_css/subPage.css" rel="stylesheet" />
    <script src="_js/jquery.min.js"></script>
    <script src="_js/pageTab.js"></script>
    <script src="_js/cookie.js"></script>
    <script>
        
        var i = 5;
        function showView(no) {
            var uA = navigator.userAgent;
            if (uA.match(/iPod/) || uA.match(/iPad/) || uA.match(/iPhone/) || uA.match(/Android/) || uA.match(/Windows Phone/)) {
                location.href = "onMobileLineBook.aspx?no=" + no;
            } else {
                $(".pobBox").load("onLineBook.aspx?no=" + no);
                $(".popDiv").show(); $(".popDivBg").show();
            }

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
            $(".popDivBig img").attr("src", nowUrl).css('width','100%');
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="main">
         
        <section>
            <div id="pageTitle">網銀刊物</div>
            <div class="dContent pageBorder dCont980 dContMobile mainPageMargin">
                <div class="conConten conTxt">
                    <ul class="periodicalCon">
                        <li>
                            <div class="blackTitle">網銀刊物創刊號</div>
                            <div class="pimg"><img class="img-responsive" src="_img/pages/intro/periodical/01.jpg" alt="網銀刊物創刊號" /></div>
                            <a class="ponlineviewBtn" href="javascript:showView('01')"></a>
                            <asp:LinkButton ID="LinkButton1" CssClass="pdownloadBtn" runat="server" OnClick="LinkButton1_Click"></asp:LinkButton>
                        </li>
                        <li class="periodicalConPadding">
                            <div class="blackTitle">《網銀人》NO.2</div>
                            <div class="pimg"><img class="img-responsive" src="_img/pages/intro/periodical/02.jpg" alt="《網銀人》NO.2" /></div>
                            <a class="ponlineviewBtn" href="javascript:showView('02')"></a>
                            <asp:LinkButton ID="LinkButton2" CssClass="pdownloadBtn" runat="server" OnClick="LinkButton2_Click"></asp:LinkButton>
                            
                        </li>
                        <li class="periodicalConPadding">
                            <div class="blackTitle">《網銀人》NO.3</div>
                            <div class="pimg"><img class="img-responsive" src="_img/pages/intro/periodical/03.jpg" alt="《網銀人》NO.3" /></div>
                            <a class="ponlineviewBtn" href="javascript:showView('03')"></a>
                            <asp:LinkButton ID="LinkButton3" CssClass="pdownloadBtn" runat="server" OnClick="LinkButton3_Click"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
</div>
</asp:Content>

