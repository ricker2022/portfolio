<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsPage.aspx.cs" Inherits="News" %>

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
        <div class="PageNewsArea">
                <div class="PageNewsTitle">PartinG「跳」進台灣，正式加入yoe FlashWolves SCII團隊！</div>
                <div class="PageNewsGameIcon">
                    <ul>
                        <li><img src="_img/layout/gameIcon.png" /></li>
                        <li><img src="_img/layout/gameIcon.png" /></li>
                        <li><img src="_img/layout/gameIcon.png" /></li>
                    </ul>
                </div>
                <div class="PageNewsTime">2014-09-16</div>
                <input type="button" class="PageNewsShareFBBtn" />
            </div>
        <div class="MainLeftArea">
            <div class="PageNewsContent">
                全球知名的韓國《星海爭霸II》選手PartinG（원이삭）在今日（10/16）和網銀國際旗下職業電競團隊yoe FlashWolves正式簽約，成為繼San（강초원）、Leenock（이동녕）之後，第三位加入yoe FlashWolves的韓國選手。為此，yoe FlashWolves隊經理Leaf（張宇）特地於昨日飛往韓國，並在今日一早抵達簽約地點：ZOWIE GEAR Korea辦公室，並在鉄人論壇、韓國媒體inven、DAILY eSPORTS等見證下，和PartinG完成簽約儀式。<br />
                <p style="padding:33px 0 0 0; text-align:center;"><img src="_img/News/pageNewsPic.jpg" /><br />
                    ＜yoe FlashWolves隊經理Leaf飛往韓國，今與PartinG正式簽約。＞
                </p>
                <br />
                yoe FlashWolves近年來積極經營電子競技，不但擁有《星海爭霸II》、《英雄聯盟》、《爐石戰記》和《Special Force 2》四支電競團隊，為台灣最多團隊之電競戰隊，更是國內首支簽下韓國SCII選手（San）的戰隊，對電競的熱誠不言而喻！yoe FlashWolves隊經理Leaf在簽約會上表示，在簽下San和Leenock這兩位韓國選手後，yoe FlashWolves除了國際能見度的增加外，國內選手的受益也是非常顯著。「當時決定簽下韓國選手的原因之一，是想從團隊內部給予台灣選手更多的幫助；這次PartinG的加入，我希望能進一步強化yoe FlashWolves的戰力。」<br />
                Leaf說對戰隊而言，選手沒有台灣、韓國之分，他們都是yoe FlashWolves的選手，「PartinG離開SK Telecom T1也不表示就會放鬆，接下來我們會全力幫助他調整，讓他回到當時在StarTale的狀態。」
            </div>

            <!--↓↓FB留言區↓↓-->
            <div class="PageNewsFBArea">
                <div class="PageNewsFBTitle"></div>
                <div class="PageNewsFBContent"></div>
            </div>
        </div>
        <div class="MainRightArea" style="padding:20px 0 0 4px;">
            <!--↓↓團隊介紹↓↓-->
            <uc1:TeamArea runat="server" ID="TeamArea" />

            <!--↓↓搜尋區↓↓-->
            <uc1:SearchArea runat="server" ID="SearchArea" />

            <!--↓↓近期賽事↓↓-->
            <uc1:DateActionAreaascx runat="server" ID="DateActionAreaascx" />

            <!--↓↓廣告區↓↓-->
            <div class="ADBanner">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>
        </div>
    </div>

</asp:Content>

