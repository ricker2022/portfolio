<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="schedule_down.aspx.cs" Inherits="schedule_down" %>

<%@ Register Src="~/_uc/BtnControl.ascx" TagPrefix="uc1" TagName="BtnControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="main">
        <div class="schedule_downA">
            <div class="scheduleDownTop">
                <ul>
                    <li><img src="_img/starcraftLogos.png" /></li>
                    <li><img src="_img/hearthstoneLogos.png" /></li>
                </ul>
            </div>
            <div class="scheduleDownTopTxt">
                <ul><li>August16</li>
                    <li>August17</li>
                </ul>
            </div>
            <div class="scheduleDownBottom">
                <div class="scheduleDBtab1">時程表
                    <table id="TableES" border="0" align="center" cellpadding="3" cellspacing="0">
                        <tr class="tab_tr1">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr2">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr1">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr2">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr1">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                    </table>
                </div>

                <div class="scheduleDBtab2">時程表
                    <table id="TableES1" border="0" align="center" cellpadding="3" cellspacing="0">
                        <tr class="tab_tr1">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr2">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr1">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr2">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                        <tr class="tab_tr1">
                            <td align="center"><a href="schedule.aspx">2014/08/01</a></td>
                            <td style="padding:0 0 0 10px;"><a href="schedule.aspx">yoe FlashWolves VS. yoe FlashWolves</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="indexTimer"><img src="_img/index/TimerBg.png" /></div>
            <uc1:BtnControl runat="server" ID="BtnControl" />
    </div>
</asp:Content>

