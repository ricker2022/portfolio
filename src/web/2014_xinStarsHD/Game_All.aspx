<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Game_All.aspx.vb" Inherits="Game_All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div id="centent" style="width:80%; margin:20px auto 0 auto; padding:20px 0;">
            <div class="GameTitle">遊戲總覽</div>
            <div class="GameItems">
                <ul>
                    <a href="Game_Waterball.aspx"><li><div class="GameLogo"><img src="_img/GameLogo/game02.jpg" /></div><div class="GameName">水球大戰</div></li></a>
                    <a href="#"><li><div class="GameLogo"><img src="_img/GameLogo/game02.jpg" /></div><div class="GameName">百家樂</div></li></a>
                    <a href="#"><li><div class="GameLogo"><img src="_img/GameLogo/game02.jpg" /></div><div class="GameName">百家樂</div></li></a>
                    <a href="#"><li><div class="GameLogo"><img src="_img/GameLogo/game01b.png" /></div><div class="GameName">百家樂</div></li></a>
                    <a href="#"><li><div class="GameLogo"><img src="_img/GameLogo/game01b.png" /></div><div class="GameName">百家樂</div></li></a>
                    <a href="#"><li><div class="GameLogo"><img src="_img/GameLogo/game01b.png" /></div><div class="GameName">百家樂</div></li></a>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

