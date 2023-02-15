<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Member_PW.aspx.vb" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">會員專區</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDPWtitle">帳號設定</div>
            <asp:Label ID="Label1" runat="server" Text="目前密碼" class="IDPWsectitle">目前密碼</asp:Label>
            <div class="IDPWLine"></div>
            <asp:Label ID="Label2" runat="server" Text="目前密碼" class="IDPWsectitle">輸入新密碼</asp:Label>
            <div class="IDPWLine"></div>
            <asp:Label ID="Label3" runat="server" Text="目前密碼" class="IDPWsectitle">確認新密碼</asp:Label>
            <div class="IDPWLine"></div>
            <div class="IDPWtip">*請輸入6-20碼英數字</div>
            <div class="IDPWLvl">強度：
                <div class="IDPWpic"></div>
            </div>
            <a href="#" class="IDPWStoredBtn">儲存密碼</a>
            <a href="#" class="IDPWCancelBtn">取消修改</a>
        </div>
    </div>
</asp:Content>

