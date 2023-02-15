<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Teams.aspx.cs" Inherits="News" %>

<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>

<%@ Register Src="~/_uc/TeamArea.ascx" TagPrefix="uc1" TagName="TeamArea" %>
<%@ Register Src="~/_uc/SearchArea.ascx" TagPrefix="uc1" TagName="SearchArea" %>
<%@ Register Src="~/_uc/DateActionAreaascx.ascx" TagPrefix="uc1" TagName="DateActionAreaascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageBG"></div>
    <div id="topLogo" style="margin: 20px 0 0 425px;">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="pagemain">
        <div class="MainLeftArea">
            <div class="TTeamsArea">
                <div class="TTeamsTitle">
                </div>
                <div class="TTeamsContent">
                    <ul>
                        <li>
                            <div class="TTeamsCPic">
                                <img src="_img/Teams/SC2.jpg" />
                            </div>
                            <input type="button" class="TTeamsCMoreBtn" />
                        </li>
                        <li>
                            <div class="TTeamsCPic">
                                <img src="_img/Teams/L.jpg" />
                            </div>
                            <input type="button" class="TTeamsCMoreBtn" />
                        </li>
                        <li>
                            <div class="TTeamsCPic">
                                <img src="_img/Teams/SF.jpg" />
                            </div>
                            <input type="button" class="TTeamsCMoreBtn" />
                        </li>
                        <li>
                            <div class="TTeamsCPic">
                                <img src="_img/Teams/HS.jpg" />
                            </div>
                            <input type="button" class="TTeamsCMoreBtn" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="MainRightArea">
            <!--↓↓團隊介紹↓↓-->
            <uc1:TeamArea runat="server" ID="TeamArea" />

            <!--↓↓搜尋區↓↓-->
            <uc1:SearchArea runat="server" ID="SearchArea" />

            <!--↓↓近期賽事↓↓-->
            <uc1:DateActionAreaascx runat="server" ID="DateActionAreaascx" />

            <!--↓↓廣告區↓↓-->
            <div class="ADBanner" style="padding-bottom:16px;">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>

            <div class="ADBanner" style="padding-bottom:15px;">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>

            <div class="ADBanner">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>
        </div>
    </div>

</asp:Content>

