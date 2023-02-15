<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Partner02MyServ.aspx.vb" Inherits="en_Partner02MyServ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Partnership</div>
    <div id="main">
        <div class="Partner02Area">
            <div class="Partner02Items">
                <a class="P02I01" href="Partner01.aspx">Cooperate<br />with moLo</a>
                <a class="P02I02" href="Partner02.aspx">Partner area</a>
            </div>
            <div class="Partner02MSContent">
                <div class="P02AddIinfoTitle">My Service</div>
                <div class="P02AddIinfoContent">Please fill in below information(Using the Backspace key to separate the current IP address)</div>
            </div>
            <div class="P02MSerItems">
                <asp:Label ID="Label1" runat="server" Text="公司名稱" class="P02Itemstitle">Service name</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label2" runat="server" Text="公司名稱" class="P02Itemstitle">Contact</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label3" runat="server" Text="公司名稱" class="P02Itemstitle">IP</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label4" runat="server" Text="公司名稱" class="P02Itemstitle">Service area code</asp:Label>
            <div class="IDPWLine"></div>
            </div>
            <a href="#" class="P02MSIBtn">Contain</a>
            <a href="#" class="P02MSICBtn">Cancel</a>
    </div>
        </div>
</asp:Content>

