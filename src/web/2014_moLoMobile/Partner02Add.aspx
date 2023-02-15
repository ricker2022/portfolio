<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Partner02Add.aspx.vb" Inherits="Service" %>

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
            <div class="Partner02AddContent">
                <div class="P02IinfoTitle">我的服務</div>
                <div class="P02IinfoContent">合作廠商您好!即日起推出客製化品牌登入入口網站。詳細操作內容請點閱。</div>
            </div>
            <div class="P02AddSerItems">
                <ul>
                    <li>
                        <div class="P02ASItitle">服務編號</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label1" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle">服務名稱</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label2" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle">聯絡人</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label3" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle">IP位址</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label4" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle">服務區碼</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label5" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle">狀態</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label6" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <a href="#" class="P02ASIEditBtn">編輯</a>
            <a href="#" class="P02ASIDelBtn">移除</a>
    </div>
        </div>
</asp:Content>

