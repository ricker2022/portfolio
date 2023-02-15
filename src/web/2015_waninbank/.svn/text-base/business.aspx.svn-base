<%@ Page Title="" Language="C#" MasterPageFile="~/menuPage.master" AutoEventWireup="true" CodeFile="business.aspx.cs" Inherits="business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>網銀國際-社會責任</title>
    <script src="css/jquery.min.js" type="text/javascript"></script>
    <script src="css/pageTab.js" type="text/javascript"></script>
    <link href="css/subPage.css" rel="stylesheet" type="text/css" />
    <script src="css/cookie.js" type="text/javascript"></script>
    <style>
    #mask{width:100%; height:100%; background:#000; position:absolute; left:0; top:0; filter:alpha(opacity=75); opacity:0.75; display:none; z-index:2;}
    #popBox 
    {
       position:fixed; z-index:5;top:50%;margin-top:-280px; left:50%;margin-left:-530px;
    }
    </style>
    <script>

        $(function () {
            //$('.tab_container').css("background-image", "url(image/businesBG_02.jpg)");

            $(".subTagM li a").bind("click", function () {
                var $this = $(this),
                _clickHref = $this.attr('href');

                if (_clickHref == "#tab4" || _clickHref == "#tab3") {

                    $('.tab_container').css("background-image", "url(image/pinkBG__02.jpg)");
                    $(".subTagM").attr("id", "list03");
                }
                else {
                    $('.tab_container').css("background-image", "url(image/businesBG_02.jpg)");
                    $(".subTagM").attr("id", "list02");
                }

            });

        });
    //開啟彈出式窗
        function sData() {
        if (screen.width <= 1024) {
            $("#popBox img").width(800);
            $("#popBox").css("margin-left","-400px");
            $("#popBox a").css("left","735px");
        }
         $("#mask").show();
        $("#popBox").show();
}
function hidePop() {
    $("#popBox,#mask").hide();
}


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="subTag">
      <ul class="subTagM" id="list02">
         <li><a href="#tab1">組織架構</a></li>
         <%--<li><a href="#tab2">合作夥伴</a></li>--%>
         <li><a href="#tab3">人文關懷</a></li>
         <li><a href="#tab4">影音專區</a></li>
        </ul>
        <ul class="tab_container" style="background:bottom no-repeat #ffffff url(image/businesBG_02.jpg); ">
         <li id="tab1">
          <ul>
           <li id="greenHeader">組織架構</li>
           <li style="padding:0; margin:0 auto; width:630px"><a onclick="sData()" style="display:block; cursor:pointer"><img src="image/businessBG_07.png" width="616" height="166" style="margin-top:30px;"/></a></li>
          </ul>
         </li>
         <li id="tab2">
          <ul class="partner">
           <li id="greenHeader">合作夥伴</li>
           <li style="height:103px"><a href="http://www.focus.game.tw/intro.html" target="_blank"><img src="image/partner_01.jpg" width="386" height="93" /></a></li>
           <li style="height:103px"><a href="http://www.s-van.com/" target="_blank"><img src="image/partner_03.jpg" width="386" height="93" /></a></li>
           <li style="margin-bottom:200px;height:103px"><a href="http://www.wagame.com.tw/" target="_blank"><img src="image/partner_04.jpg" width="386" height="93" /></a></li>
          </ul>
         </li>
         <li id="tab3">
          <ul>
           <li id="pinkHeader">人文關懷</li>
           <li style="text-align:center; color:#ff0474; margin-bottom:30px">
           <p>人生中的每個開始、每個挫折、每個成長，都有它的意義。</p>
<p>因為努力，我們不斷成長茁壯。</p>
<p>因為堅持，我們繼續勇敢向前行。</p>
<p>因為有愛，使我們的世界更加美妙。</p>
</li>
          </ul>
          <ul class="pink">
          <li>本集團除持續發展外，我們秉持感念當下，以「取之社會，用之社會」精神，用行動落實企業責任，運用已身資源，積極參與社區活動、公益贊助及發票捐贈，並協助推動網銀基金會運作，響應2013年度活動-網銀慈善音樂會活動，與員工一同對社會盡份心力，成就「幸福．微笑．我們的世代」。</li>
          <p class="foundation" style="margin:30px 0 0 0; height:103px"><a href="http://wanin-fund.org.tw/" target="_blank"><img src="image/businesBG_03.jpg" width="386" height="93" /></a></p>
          <p class="foundation" style="margin:20px 0 200px 0; height:103px"><a href="http://web.syinlu.org.tw/" target="_blank"><img src="image/businesBG_04.jpg" width="386" height="93" /></a></p>
          </ul>
         </li>
         <li id="tab4">
          <ul>
           <li id="pinkHeader">影音專區</li>
           <table width="600" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto">
  <tr>
    <td>
    <p style="background:url(image/arrow__01.png) 0px 0px no-repeat;line-height:25px;padding-left:20px">【moLoSport】操作介紹</p>
    <iframe width="288" height="162" src="http://www.youtube.com/embed/SYAdU_91cJc" frameborder="0" allowfullscreen></iframe></td>
    <td>
    <p style="background:url(image/arrow__01.png) 0px 0px no-repeat;line-height:25px;padding-left:20px">【moLoSport】互動式娛樂健身車</p>
    <iframe width="288" height="162" src="http://www.youtube.com/embed/NCBFzoT8pds" frameborder="0" allowfullscreen></iframe></td>
  </tr>
  <tr>
    <td style="padding:20px 0 200px 0">
    <p style="background:url(image/arrow__01.png) 0px 0px no-repeat;line-height:25px;padding-left:20px">【網銀基金會】公益廣告</p>
    <iframe width="288" height="162" src="http://www.youtube.com/embed/qQr1ed7ZygM" frameborder="0" allowfullscreen></iframe></td>
    <td>&nbsp;</td>
  </tr>
</table>

          </ul>
         </li>
        </ul>
    </div>
<!-- popup -->
<div id="mask"></div>
<div id="popBox" style="display:none;">
    <img alt="" src="image/businessBG_07.png" width="1061" height="287"/><br />
    <a onclick="hidePop()" style="color:#ffffff; text-decoration:underline; position:relative; left:995px;top:20px; cursor:pointer">關閉視窗</a>
    </div>
</asp:Content>

