<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/controls/main/NewsTabs.ascx" TagPrefix="uc1" TagName="NewsTabs" %>
<%@ Register Src="~/controls/main/SlideBanner.ascx" TagPrefix="uc1" TagName="SlideBanner" %>
<%@ Register Src="~/controls/main/CCalendar.ascx" TagPrefix="uc1" TagName="CCalendar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="gameScoreTitle">
        <ul>
            <li><a href="#">SF</a></li>
            <li><a href="#">KR</a></li>
            <li><a href="#">SCII</a></li>
            <li><a href="#">LOL</a></li>
            <li><a href="#">WOT</a></li>
        </ul>
    </div>
    <uc1:NewsTabs runat="server" ID="NewsTabs" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="dSlideshow">
        <uc1:SlideBanner runat="server" ID="SlideBanner" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <uc1:CCalendar runat="server" ID="CCalendar" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
    <div id="newsTitle_all">
        <div class="newsMore">
            <a href="#"></a>
        </div>
    </div>
    <div id="TableES3" runat="server">
        <table align="left" border="0" cellspacing="0">
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
        </table>
    </div>
    <div id="newsTitle_yoeFW">
        <div class="newsMore">
            <a href="#"></a>
        </div>
    </div>
    <div id="TableES4" runat="server">
        <table align="left" border="0" cellspacing="0">
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
        </table>
    </div>
    <div id="newsTitle_TeSL">
        <div class="newsMore">
            <a href="#"></a>
        </div>
    </div>
    <div id="TableES5" runat="server">
        <table align="left" border="0" cellspacing="0">
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
            <tr>
                <td><a href="#">目前尚無新聞</a> </td>
            </tr>
        </table>
    </div>
</asp:Content>

