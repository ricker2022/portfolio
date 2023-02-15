<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Member_Mail.aspx.vb" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">會員專區</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDtitle">帳號設定</div>
            <div class="IDsectitle">目前E-mail</div>
            <div class="IDseccontent">XXXX@yahoo.com.tw</div>
            <div class="IDthirdtitle">輸入新E-mail</div>
                <asp:Label ID="Label1" runat="server" Text="Label" class="IDthirdcontent">XXXX@yahoo.com.tw</asp:Label>
            <div class="IDthirdLine"></div>
            <a href="#" class="IDStoredMailBtn">儲存E-mail</a>
            <a href="#" class="IDCancelBtn">取消修改</a>
        </div>
    </div>
</asp:Content>

