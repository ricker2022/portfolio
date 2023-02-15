<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Member_PW.aspx.vb" Inherits="en_Member_PW" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Member Area</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDPWtitle">My Account</div>
            <asp:Label ID="Label1" runat="server" Text="目前密碼" class="IDPWsectitle">Current password</asp:Label>
            <div class="IDPWLine"></div>
            <asp:Label ID="Label2" runat="server" Text="目前密碼" class="IDPWsectitle">New password</asp:Label>
            <div class="IDPWLine"></div>
            <asp:Label ID="Label3" runat="server" Text="目前密碼" class="IDPWsectitle">Retype new password</asp:Label>
            <div class="IDPWLine"></div>
            <div class="IDPWtip">Note：6-20 English letters , numbers</div>
            <div class="IDPWLvl">Strong：
                <div class="IDPWpic"></div>
            </div>
            <a href="#" class="IDPWStoredBtn">Change Password</a>
            <a href="#" class="IDPWCancelBtn">Cancel</a>
        </div>
    </div>
</asp:Content>

