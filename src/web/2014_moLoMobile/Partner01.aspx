<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Partner01.aspx.vb" Inherits="Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">合作夥伴</div>
    <div id="main">
        <div class="Partner01Area">
            <div class="Partner01Items">
                <a class="P01I01" href="Partner01.aspx">想與moLo合作</a>
                <a class="P01I02" href="Partner02.aspx">夥伴專區</a>
            </div>
            <div class="Partner01Content">
                <div class="P01IinfoTitle">我的服務</div>
                <div class="P01IinfoContent">歡迎各位一同加入 moLo 聯合行銷行列<br />，共同創造源源不絕的人潮！<br />
                    請您填寫以下訊息，讓我們了解您的需求，並提供您最完善的服務哦！</div>
            </div>
            <div class="P01Items">
                <asp:Label ID="Label1" runat="server" Text="公司名稱" class="P01Itemstitle">公司名稱</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label2" runat="server" Text="公司名稱" class="P01Itemstitle">公司統編</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label3" runat="server" Text="公司名稱" class="P01Itemstitle01">聯絡 E-mail</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label4" runat="server" Text="公司名稱" class="P01Itemstitle02">手機</asp:Label>
            <div class="IDPWLine"></div>
                <asp:Label ID="Label5" runat="server" Text="公司名稱" class="P01Itemstitle02">需求</asp:Label>
            <div class="IDPWLine"></div>
            </div>
            <a href="#" class="PItemsSBtn">確定</a>
            <a href="#" class="PItemsCBtn">取消</a>
        </div>
    </div>
</asp:Content>

