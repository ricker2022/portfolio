<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="moLoService.aspx.vb" Inherits="Service" %>

<%@ Register Src="~/_uc/MainBanner.ascx" TagPrefix="uc1" TagName="MainBanner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <script type="text/javascript">
            $(function () {
                $(document).ready(function () {
                    $(".isMask").hide();
                })
                $(".SI01").click(function () {
                    $(".isMask").css("margin-top", "0px");
                    $(".isMask").show();
                })
                $(".SI02").click(function () {
                    $(".isMask").css("margin-top", "135px");
                    $(".isMask").show();
                })
                $(".SI03").click(function () {
                    $(".isMask").css("margin-top", "271px");
                    $(".isMask").show();
                })
                $(".SI04").click(function () {
                    $(".isMask").css("margin-top", "407px");
                    $(".isMask").show();
                })
                $(".SI05").click(function () {
                    $(".isMask").css("margin-top", "544px");
                    $(".isMask").show();
                })
            })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">moLo 服務</div>
    <uc1:MainBanner runat="server" ID="MainBanner" />
    <div id="main">
        <div class="moLoServiceItemsArea">
            <div class="isMask"></div>
            <a class="SI01" href="#">moLo App</a>
            <a class="SI02" href="#">moLo Sport<br />
                互動式娛樂健身車</a>
            <a class="SI03" href="#">moLo 福利社</a>
            <a class="SI04" href="#">moLo 遊戲庫</a>
            <a class="SI05" href="#">moLo遊戲滿屋</a>
        </div>
    </div>
</asp:Content>

