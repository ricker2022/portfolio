<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Partner01.aspx.vb" Inherits="en_Partner01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Partnership</div>
    <div id="main">
        <div class="Partner01Area">
            <div class="Partner01Items">
                <a class="P01I01" href="Partner01.aspx">Cooperate<br />with moLo</a>
                <a class="P01I02" href="Partner02.aspx">Partner area</a>
            </div>
            <div class="Partner01Content">
                <div class="P01IinfoTitle">My Service</div>
                <div class="P01IinfoContent">moLo have around million members! Exclusive Customization login system, free network and media resources, moLo is your best partner and welcome to join us! </div>
            </div>
            <div class="P01Items">
                <asp:Label ID="Label1" runat="server" Text="公司名稱" class="P01Itemstitle">Company</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label2" runat="server" Text="公司名稱" class="P01Itemstitle">Unified Business No</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label3" runat="server" Text="公司名稱" class="P01Itemstitle01">E-mail</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label4" runat="server" Text="公司名稱" class="P01Itemstitle01">Mobile phone number</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label5" runat="server" Text="公司名稱" class="P01Itemstitle01">Needs</asp:Label>
            <div class="IDPWLine"></div>
            </div>
            <a href="#" class="PItemsSBtn">Send</a>
            <a href="#" class="PItemsCBtn">Cancel</a>
        </div>
    </div>
</asp:Content>

