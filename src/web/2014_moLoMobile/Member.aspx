<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Member.aspx.vb" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">會員專區</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDtitle">帳號設定</div>
            <div class="IDcontent">0979863***</div>
        </div>
        <div class="InfoItems">
            <ul>
                <li>
                <asp:Label ID="Label1" runat="server" Text="" CssClass="InfoItemsTxt01">mololo@gmail.com</asp:Label>
                    <a class="InfoItemsBtn" href="Member_Mail.aspx">編輯</a>
                </li>
                <li>
                <asp:Label ID="Label2" runat="server" Text="" CssClass="InfoItemsTxt02">******</asp:Label>
                    <a class="InfoItemsBtn" href="Member_PW.aspx">編輯</a>
                </li>
                <li style="letter-spacing:1px;">
                <asp:Label ID="Label3" runat="server" Text="" CssClass="InfoItemsTxt03">一般模式</asp:Label>
                    <a class="InfoItemsBtn" href="Member_MOD.aspx">編輯</a>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

