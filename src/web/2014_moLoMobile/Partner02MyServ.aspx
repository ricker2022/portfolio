<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Partner02MyServ.aspx.vb" Inherits="Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">合作夥伴</div>
    <div id="main">
        <div class="Partner02Area">
            <div class="Partner02Items">
                <a class="P02I01" href="Partner01.aspx">想與moLo合作</a>
                <a class="P02I02" href="Partner02.aspx">夥伴專區</a>
            </div>
            <div class="Partner02MSContent">
                <div class="P02AddIinfoTitle">我的服務</div>
                <div class="P02AddIinfoContent">新增的服務項目(多組IP請以空白鍵隔開)</div>
            </div>
            <div class="P02MSerItems">
                <asp:Label ID="Label1" runat="server" Text="公司名稱" class="P02Itemstitle">服務名稱</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label2" runat="server" Text="公司名稱" class="P02Itemstitle">聯絡人</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label3" runat="server" Text="公司名稱" class="P02Itemstitle">IP位址</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label4" runat="server" Text="公司名稱" class="P02Itemstitle">服務區碼</asp:Label>
            <div class="IDPWLine"></div>
            </div>
            <a href="#" class="P02MSIBtn">確定</a>
            <a href="#" class="P02MSICBtn">取消</a>
    </div>
        </div>
</asp:Content>

