<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="contest_down.aspx.cs" Inherits="contest_down" %>

<%@ Register Src="~/_uc/BtnControl.ascx" TagPrefix="uc1" TagName="BtnControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="contest_downA">
            <div class="contestLogo">
                <ul>
                    <li><a href="contest1.aspx"><img src="_img/starcraftLogo.png" /></a></li>
                    <li><a href="contest2.aspx"><img src="_img/hearthstoneLogo.png" /></a></li>
                </ul>
            </div>
        </div>
        <div class="indexTimer"><img src="_img/index/TimerBg.png" /></div>
        <uc1:BtnControl runat="server" ID="BtnControl" />

    </div>
</asp:Content>

