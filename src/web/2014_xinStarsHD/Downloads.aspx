<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Downloads.aspx.vb" Inherits="Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <div id="downloadAPK">
            <div class="downloadAPKimg">
                <img src="_img/APKimg/01.jpg" alt="星城熱門遊戲APK下載" /></div>
            <a class="downloadApkBtn" href="#"></a>
        </div>       
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">其他載點</div>
                <div class="dItem">
                    <ul class="downElse">
                        <li>載點名稱01</li>
                        <li>載點名稱03</li>
                        <li>載點名稱05</li>
                    </ul>
                    <ul class="downElse">
                        <li>載點名稱02</li>
                        <li>載點名稱04</li>
                        <li>載點名稱06</li>
                    </ul>
                </div>
            </div>
            <div class="normalContent">
                <div class="normalTitle">遊戲載點</div>
                <div class="dItem">
                  <ul class="downGame">
                      <li><a href="#"><img src="_img/GameLogo/game01s.png" /></a></li>
                      <li><a href="#"><img src="_img/GameLogo/game01s.png" /></a></li>
                      <li><a href="#"><img src="_img/GameLogo/game01s.png" /></a></li>
                      <li><a href="#"><img src="_img/GameLogo/game01s.png" /></a></li>
                  </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

