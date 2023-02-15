<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="live_down.aspx.cs" Inherits="live_down" %>

<%@ Register Src="~/_uc/BtnControl.ascx" TagPrefix="uc1" TagName="BtnControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="main">
        <div class="live_downA">
            <div class="liveDownLeft">
                <div class="liveDownLeftMovie">
                    <img src="_img/movie01.jpg" /></div>
            </div>

            <div class="liveDownRight">
                <div class="liveDownRightCh"><span style="padding:0 0 0 15px;">中文直播</span>
                    <ul>
                        <li><a href="live_on.aspx"><img src="_img/twitch.png" /></a></li>
                        <li><a href="live_on.aspx"><img src="_img/youtube.png" /></a></li>
                        <li><a href="live_on.aspx"><img src="_img/twitch.png" /></a></li>
                    </ul>
                </div>
                <div class="liveDownRightEn"><span style="padding:0 0 0 15px;">English</span>
                    <ul>
                        <li><a href="live_on.aspx"><img src="_img/twitch.png" /></a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="indexTimer"><img src="_img/index/TimerBg.png" /></div>
            <uc1:BtnControl runat="server" ID="BtnControl" />

    </div>
</asp:Content>

