<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="en_Default" %>

<%@ Register Src="~/en/_uc/MainBanner.ascx" TagPrefix="uc1" TagName="MainBanner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MainBanner runat="server" ID="MainBanner" />

    <div id="main">
        <div class="LogBtnArea">
            <!--↓↓未登入狀態↓↓-->
            <a class="MloginBtn" href="#">Sign up / Login</a>
            <a class="MdownloadinBtn" href="#">Free Download</a>

            <!--↓↓已登入狀態↓↓-->
            <%--<a class="MlogoutBtn" href="#">Sign out</a>
            <a class="MdownloadoutBtn" href="#">Free Download</a>--%>
        </div>
        <div class="SloganTxt">Just have a mobile phone number, moLo can make you cross network platform entertainment
        </div>
        <div class="ItemsArea">
            <div class="pcArea">
                <div class="pcimg"><img src="../_img/layout/PC.png" /></div>
                <div class="pctxt">
                    <p style="font-size:28px; color:#373737; margin:30px 0 5px 0;">PC-moLo Navigator</p>
                    Your personal gaming tour guide, entrance of over 5,000 free games 
                </div>
            </div>
            <div class="mobileArea">
                <div class="mobileimg"><img src="../_img/layout/Mobile.png" /></div>
                <div class="mobiletxt">
                    <p style="font-size:28px; color:#373737; margin:39px 0 5px 0;">Mobile-moLo App</p>
                    moLo App able to free call and send message. Also treasure box Events will be privide irregularly, moLo App won't let you miss any promotion and events
                </div>
            </div>
            <div class="sportArea">
                <div class="sportimg"><img src="../_img/layout/Sport.png" /></div>
                <div class="soprttxt">
                    <p style="font-size:28px; line-height:30px; color:#373737; margin:38px 0 8px 0; letter-spacing:0px;">Home Entertainment-moLo Sport</p>
                    Interactive exercise bike.Fun, health, and social networking all at once Bring you a new sport experience!
                </div>
            </div>
        </div>
    </div>
</asp:Content>

