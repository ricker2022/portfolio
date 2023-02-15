<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="ChangePW.aspx.vb" Inherits="en_ChangePW" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="TipArea">Don't forget to improve your account security！
Please change password and Ｅ-mail first.
Simply click the link in the email to finish setting up your account
You can use complete  moLo Service After successful validation.</div>
        <div class="PWtitle">Change your Password</div>
        <div class="PWnoTitle">moLo Account：</div>
        <div class="PWno">09XXXXXXXX</div>
        <asp:Label ID="Label1" runat="server" Text="Label" class="PWcontent">New Password</asp:Label>
        <div class="PWLine"></div>
        <div class="PWtip">*Please enter 6-20 English letters, numbers</div>

        <asp:Label ID="Label2" runat="server" Text="Label" class="PWcontent">Reenter password </asp:Label>
        <div class="PWLine"></div>
        <div class="PWtip">*Please enter 6-20 English letters, numbers</div>

        <asp:Label ID="Label3" runat="server" Text="Label" class="PWcontent">E-mail</asp:Label>
        <div class="PWLine"></div>
        <div class="PWtip">*Please enter e-mail address</div>

        <div class="RedTip">The email address for your account needs to be verified.</div>
        <a href="#" class="PWBtn">Confirm</a>
    </div> 
</asp:Content>

