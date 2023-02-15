<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="News" %>

<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>

<%@ Register Src="~/_uc/TeamArea.ascx" TagPrefix="uc1" TagName="TeamArea" %>
<%@ Register Src="~/_uc/SearchArea.ascx" TagPrefix="uc1" TagName="SearchArea" %>
<%@ Register Src="~/_uc/DateActionAreaascx.ascx" TagPrefix="uc1" TagName="DateActionAreaascx" %>
<%@ Register Src="~/_uc/VideoArea.ascx" TagPrefix="uc1" TagName="VideoArea" %>
<%@ Register Src="~/_uc/AlbumArea.ascx" TagPrefix="uc1" TagName="AlbumArea" %>
<%@ Register Src="~/_uc/pagerController.ascx" TagPrefix="uc1" TagName="pagerController" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageBG"></div>
    <div id="topLogo" style="margin: 20px 0 0 425px;">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="pagemain">
        <div class="AboutArea">
            <div class="AboutMainArea">
                <div class="AboutMainBtnArea">
                    <input type="button" class="AboutMB01" onclick="javacript: location.href = '#01'" />
                    <input type="button" class="AboutMB02" onclick="javacript: location.href = '#02'" />
                    <input type="button" class="AboutMB03" onclick="javacript: location.href = '#03'" />
                    <input type="button" class="AboutMB04" onclick="javacript: location.href = '#04'" />
                </div>
                <div class="AboutMainPic">
                    <img src="_img/About/AboutMainPic.png" /></div>
            </div>
            <div class="AboutInfo" id="01">
                <div class="AboutInfoTitle">
                    <div class="AboutITtxt">yoe FlashWolves</div>
                    <div class="AboutITline"></div>
                </div>
                <div class="AboutInfoContent">
                    <img src="_img/About/AboutInfoContent.png" /></div>
            </div>
            <div class="AboutEvents" id="02">
                <div class="AboutEventsTitle">
                    <div class="AboutETtxt">yoe FlashWolves大事件</div>
                    <div class="AboutETline"></div>
                </div>
                <div class="AboutEventsContent">
                    <img src="_img/About/AboutEventsContent.png" />
                </div>
            </div>
            <div class="AboutBackTeam" id="03">
                <div class="AboutBackTeamTitle">
                    <div class="AboutBTTtxt">yoe FlashWolves幕後團隊</div>
                    <div class="AboutBTTline"></div>
                </div>
                <div class="AboutBackTeamContent">
                    <ul>
                        <li>
                            <div class="AboutBTCLeft">
                                <div class="AboutBTCPic">
                                    <img src="_img/About/AboutBTCPic.png" /></div>
                                <div class="AboutBTCTitle">英雄聯盟 戰術分析師</div>
                                <div class="AboutBTCName">胡裕強 JoJo</div>
                            </div>
                            <div class="AboutBTCRight">
                                <div class="AboutBTCContent">
                                    選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，意圖吞噬所有生命的外星蟲族感染了這個星球，外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，.......
                                </div>
                            </div>
                        </li>
                        
                        <li>
                            <div class="AboutBTCLeft">
                                <div class="AboutBTCPic">
                                    <img src="_img/About/AboutBTCPic.png" /></div>
                                <div class="AboutBTCTitle">英雄聯盟 戰術分析師</div>
                                <div class="AboutBTCName">胡裕強 JoJo</div>
                            </div>
                            <div class="AboutBTCRight">
                                <div class="AboutBTCContent">
                                    選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，意圖吞噬所有生命的外星蟲族感染了這個星球，外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，.......
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="AboutBTCLeft">
                                <div class="AboutBTCPic">
                                    <img src="_img/About/AboutBTCPic.png" /></div>
                                <div class="AboutBTCTitle">英雄聯盟 戰術分析師</div>
                                <div class="AboutBTCName">胡裕強 JoJo</div>
                            </div>
                            <div class="AboutBTCRight">
                                <div class="AboutBTCContent">
                                    選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，意圖吞噬所有生命的外星蟲族感染了這個星球，外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，.......
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="AboutBTCLeft">
                                <div class="AboutBTCPic">
                                    <img src="_img/About/AboutBTCPic.png" /></div>
                                <div class="AboutBTCTitle">英雄聯盟 戰術分析師</div>
                                <div class="AboutBTCName">胡裕強 JoJo</div>
                            </div>
                            <div class="AboutBTCRight">
                                <div class="AboutBTCContent">
                                    選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，意圖吞噬所有生命的外星蟲族感染了這個星球，外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空外星蟲族感染了這個星球選手基本介紹在距離地球遙遠外太空的克普魯星區，人類的殖民地瑪而‧薩拉陷入了危機。一群在母巢意志控制之下，.......
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="AboutContact" id="04">
                <div class="AboutContactTitle">
                    <div class="AboutCTtxt">聯繫我們</div>
                </div>
                <div class="AboutContactContent">E-Mail: FlashWolver@waninbank.com</div>
            </div>
        </div>
        <div id="goTop" class="goTop"></div>
    </div>
</asp:Content>

