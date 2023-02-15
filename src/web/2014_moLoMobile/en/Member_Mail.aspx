<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Member_Mail.aspx.vb" Inherits="en_Member_Mail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Member Area</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDtitle">My Account</div>
            <div class="IDsectitle">Current E-mail</div>
            <div class="IDseccontent">XXXX@yahoo.com.tw</div>
            <div class="IDthirdtitle">New E-mail</div>
                <asp:Label ID="Label1" runat="server" Text="Label" class="IDthirdcontent">XXXX@yahoo.com.tw</asp:Label>
            <div class="IDthirdLine"></div>
            <a href="#" class="IDStoredMailBtn">Change E-mail</a>
            <a href="#" class="IDCancelBtn">Cancel</a>
        </div>
    </div>
</asp:Content>

