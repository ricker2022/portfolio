<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="team01.aspx.cs" Inherits="team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="main">
        <div class="teamA">
            <div class="teamContent">
                <div class="teamContentLogo">
                    <img src="_img/wolvesLogo.png" /></div>
                <div class="teamContentMain">
                    <div class="teamCoach">教練 Coach
                        <ul>
                            <li><a href="teamPlayers00.aspx"><img src="_img/newsItemPic01.jpg" /></a></li>
                        </ul>
                    </div>
                    <div class="teamPlayers">選手 Players
                        <ul>
                            <li><a href="teamPlayers01.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="teamPlayers02.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="teamPlayers03.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="teamPlayers04.aspx"><img src="_img/players01.jpg" /></a></li>
                            <li><a href="teamPlayers05.aspx"><img src="_img/players01.jpg" /></a></li>
                        </ul>
                    </div>
                    <div class="teamTxt">
                        Acer
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

