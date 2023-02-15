<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="about" %>
<%@ Register Src="~/_uc/ADbannerM.ascx" TagPrefix="uc1" TagName="ADbannerM" %>
<%@ Register Src="~/_uc/ADbannerMm.ascx" TagPrefix="uc1" TagName="ADbannerMm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="_css/AD.css" rel="stylesheet" />
    <script src="_js/jquery-1.4.2.min.js"></script>
    <script src="_js/ADbannerBm.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="main">
        <section>
            <div id="pageTitle">人資訊息</div>
            <div class="dContent pageBorder dCont980 dContMobile mainPageMargin">
                <div class="conConten conTxt">
                    <!--↓↓輪播廣告特效↓↓-->
                    <div id="dSlideshowC">
                        <uc1:ADbannerM runat="server" ID="ADbannerM" />
                    </div>
                    <div id="dSlideshowCM">
                        <uc1:ADbannerMm runat="server" ID="ADbannerMm" />
                    </div>
                    <!--↑↑輪播廣告特效↑↑-->
                    <p class="careTxt">本公司是極具發展潛力的熱門產業，我們提供舒適的工作環境，完善的教育訓練，良好的升遷制度及有趣的休閒活動，更有一群熱情友善、幽默風趣、亦師亦友的專業夥伴，等著您和我們e同邁入新時代，共同成長進步，一起分享生活樂趣，創造無限大的可能！</p>
                    <p class="messageBtn"><a style="color:#fff;text-decoration:none;" href="http://www.104.com.tw/jobbank/custjob/index.php?r=cust&j=4c4a42265a6c3e2040583a1d1d1d1d5f2443a363189j99" target="_blank">快來加入我們</a></p>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

