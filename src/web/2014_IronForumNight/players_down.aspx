<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="players_down.aspx.cs" Inherits="players_down" %>

<%@ Register Src="~/_uc/BtnControl.ascx" TagPrefix="uc1" TagName="BtnControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <div class="players_downA">
            <div class="playersDownTop">
                <ul>
                    <li><img src="_img/starcraftLogos.png" /></li>
                    <li><img src="_img/hearthstoneLogos.png" /></li>
                    <%--<li><asp:Button ID="btnS1" runat="server" CssClass="playersDownTop1" OnClick="btnS1_Click" /></li>
                    <li><asp:Button ID="btnS2" runat="server" CssClass="playersDownTop2" OnClick="btnS2_Click" /></li>--%>
                </ul>
            </div>

            <%--<asp:Panel ID="Pan_星海" runat="server">--%>
                <div class="playersDownBottom">

                    <div class="playersDBLeft">
                        <div class="playersDBTeam">
                            <div class="playersDBTLogo"><a href="team.aspx"><img src="_img/teamLogo01.png" /></a></div>
                            <div class="playersDBTName"><a href="team.aspx">yoe FlashWolves</a></div>
                        </div>

                        <div class="playersDBTeam1">
                            <div class="playersDBTLogo"><a href="team01.aspx"><img src="_img/teamLogo01.png" /></a></div>
                            <div class="playersDBTName"><a href="team01.aspx">Acer</a></div>
                        </div>

                    </div>
                    <div class="playersDBRight">
                        <div class="playersDBRinvite">
                            邀請選手
                        <ul>
                            <li><a href="players00.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players01.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players02.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players03.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players04.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players05.aspx"><img src="_img/players01.jpg" /></a></li>
                        </ul>
                        </div>

                        <div class="playersDBRopen">
                            公開賽選手
                        <ul>
                            <li><a href="players06.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players07.aspx"><img src="_img/players01.jpg" /></a></li>
                        </ul>
                        </div>
                    </div>

                </div>

            <%--</asp:Panel>--%>

            <%--<asp:Panel ID="Pan_爐石" runat="server" Visible="false">
                <div class="playersDownBottom">

                    <div class="playersDBLeft">
                        <div class="playersDBTeam">
                            <div class="playersDBTLogo"><a href="team.aspx"><img src="_img/teamLogo01.png" /></a></div>
                            <div class="playersDBTName"><a href="team.aspx">yoe FlashWolves111</a></div>
                        </div>

                        <div class="playersDBTeam1">
                            <div class="playersDBTLogo"><a href="team.aspx"><img src="_img/teamLogo01.png" /></a></div>
                            <div class="playersDBTName"><a href="team.aspx">yoe FlashWolves111</a></div>
                        </div>

                    </div>
                    <div class="playersDBRight">
                        <div class="playersDBRinvite">
                            邀請選手
                        <ul>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                        </ul>
                        </div>

                        <div class="playersDBRopen">
                            公開賽選手
                        <ul>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="players.aspx"><img src="_img/players01.jpg" /></a></li>
                        </ul>
                        </div>
                    </div>

                </div>

            </asp:Panel>--%>

        </div>
        <div class="indexTimer">
            <img src="_img/index/TimerBg.png" /></div>
        <uc1:BtnControl runat="server" ID="BtnControl" />
    </div>

</asp:Content>

