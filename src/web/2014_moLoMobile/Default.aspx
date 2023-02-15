<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="~/_uc/MainBanner.ascx" TagPrefix="uc1" TagName="MainBanner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:mainbanner runat="server" id="MainBanner" />

    <div id="main">
        <div class="LogBtnArea">
            <!--↓↓未登入狀態↓↓-->
            <a class="MloginBtn" href="#">立即登入</a>
            <a class="MdownloadinBtn" href="#">免費下載</a>

            <!--↓↓已登入狀態↓↓-->
            <%--<a class="MlogoutBtn" href="#">登出</a>
            <a class="MdownloadoutBtn" href="#">免費下載</a>--%>
        </div>
        <div class="SloganTxt">只要擁有手機門號，moLo就能讓你暢遊
        </div>
        <div class="ItemsArea">
            <div class="pcArea">
                <div class="pcimg"><img src="_img/layout/PC.png" /></div>
                <div class="pctxt">
                    <p style="font-size:28px; color:#373737; margin:25px 0 19px 0;">PC端-moLo領航員</p>
                    超<span style="letter-spacing:-2px;">過５</span>千款以上網路遊戲<br />，滙集百萬會員的實力!透過接介moLo平台，一起創造消費人潮。 
                </div>
            </div>
            <div class="mobileArea">
                <div class="mobileimg"><img src="_img/layout/Mobile.png" /></div>
                <div class="mobiletxt">
                    <p style="font-size:28px; color:#373737; margin:39px 0 10px 0;">行動服務-moLo App</p>
                    除了免費通話傳訊息，還有不定期推出的寶箱好康讓你隨時娛樂不漏接！
                </div>
            </div>
            <div class="sportArea">
                <div class="sportimg"><img src="_img/layout/Sport.png" /></div>
                <div class="soprttxt">
                    <p style="font-size:28px; color:#373737; margin:38px 0 8px 0; letter-spacing:0px;">運動平台-moLo Sport</p>
                    首創結合運動、娛樂、社群的互動式娛樂健身車，給你全新的運動體驗！
                </div>
            </div>
        </div>
    </div>
</asp:Content>

