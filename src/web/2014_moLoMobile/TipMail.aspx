<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="TipMail.aspx.vb" Inherits="TipMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <div class="TipTitle">個人資料安全性</div>
        <div class="TipContent">
            請至您所設定E-mail收取驗證信，<br />
            回點系統連結已完成驗證。<br />
            <br />
            若有任何問題，歡迎與 <a href="Service.aspx">客服中心</a> 聯繫
        </div>

        <div class="YellowArea">
            <div class="YTitle">貼心小提醒</div>
            <div class="YContent">如未在收件夾收到帳號驗證信，您可以先至［垃圾信件夾］查閱是否有帳號啟動信</div>
        </div>
    </div>
</asp:Content>

