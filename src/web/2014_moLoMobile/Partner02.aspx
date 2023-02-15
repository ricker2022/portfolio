<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Partner02.aspx.vb" Inherits="Service" %>

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
            <div class="Partner02Content">
                <div class="P02IinfoTitle">我的服務</div>
                <div class="P02IinfoContent">合作廠商您好！<br />
                    專屬客製化登入系統，免費媒體資源使用。<br />
                    moLo是您最佳合作夥伴，歡迎您的加入！</div>
            </div>
            <a href="Partner02Add.aspx" class="P02ItemsBtn">新增服務</a>
            <div class="P02ServiceItems">
                <div class="P02SItitle">現有服務</div>
                <div class="P02SIcontent" style="display:none;">目前暫無服務!</div>
                <a href="#" class="P02ItemsBtn">遊戲滿屋</a>
                <a href="#" class="P02ItemsBtn">遊戲庫</a>
                <a href="#" class="P02ItemsBtn">moLo 領航員</a>
            </div>
        </div>
    </div>
</asp:Content>

