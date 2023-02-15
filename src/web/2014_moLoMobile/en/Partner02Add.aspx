<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Partner02Add.aspx.vb" Inherits="en_Partner02Add" %>

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
            <div class="Partner02AddContent">
                <div class="P02IinfoTitle">My Service</div>
                <div class="P02IinfoContent">Hello Parter, Customize with your Own Branding Login entrance page as from today. Please check operation step here.</div>
            </div>
            <div class="P02AddSerItems">
                <ul>
                    <li>
                        <div class="P02ASItitle">Service<br />code</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label1" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle">Service<br />name</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label2" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle01">Contact</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label3" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle01">IP</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label4" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle" style="letter-spacing:0px;">Service<br />area code</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label5" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                    <li>
                        <div class="P02ASItitle01">State</div>
                        <div class="P02ASIcontent">
                            <asp:Label ID="Label6" runat="server" Text="Label" CssClass="P02ASItxt">123654</asp:Label>
                            <div class="P02ASILine"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <a href="#" class="P02ASIEditBtn">Edit</a>
            <a href="#" class="P02ASIDelBtn">Delete</a>
    </div>
        </div>
</asp:Content>

