<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Member.aspx.vb" Inherits="en_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Member Area</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDtitle">My Account</div>
            <div class="IDcontent">0979863***</div>
        </div>
        <div class="InfoItems">
            <ul>
                <li>
                <asp:Label ID="Label1" runat="server" Text="" CssClass="InfoItemsTxt01">mololo@gmail.com</asp:Label>
                    <a class="InfoItemsBtn" href="Member_Mail.aspx">Edit</a>
                </li>
                <li>
                <asp:Label ID="Label2" runat="server" Text="" CssClass="InfoItemsTxt02">******</asp:Label>
                    <a class="InfoItemsBtn" href="Member_PW.aspx">Edit</a>
                </li>
                <li style="letter-spacing:1px;">
                <asp:Label ID="Label3" runat="server" Text="" CssClass="InfoItemsTxt03">一般模式</asp:Label>
                    <a class="InfoItemsBtn" href="Member_MOD.aspx">Edit</a>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

