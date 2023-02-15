<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sponsor.aspx.cs" Inherits="News" %>

<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>

<%@ Register Src="~/_uc/TeamArea.ascx" TagPrefix="uc1" TagName="TeamArea" %>
<%@ Register Src="~/_uc/SearchArea.ascx" TagPrefix="uc1" TagName="SearchArea" %>
<%@ Register Src="~/_uc/DateActionAreaascx.ascx" TagPrefix="uc1" TagName="DateActionAreaascx" %>
<%@ Register Src="~/_uc/pagerController.ascx" TagPrefix="uc1" TagName="pagerController" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageBG"></div>
    <div id="topLogo" style="margin: 20px 0 0 425px;">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="pagemain">
        <div class="MainLeftArea">
            <div class="SponsorArea">
                <div class="SponsorTitle">
                </div>
                <div class="SponsorContent">
                    <div class="SB01">
                        <a class="SB01Pic" href="#"><img src="_img/Sponsor/SB01Pic.png" /></a>
                        <div class="SB01Title">網銀國際股份有限公司</div>
                        <div class="SB01Link"><a href="http://tw.msi.com/">http://tw.msi.com/</a></div>
                        <div class="SB01Content">1986年8月，五位共同創辦人成立微星科技，目前是全世界最大的資訊產業製造商之一。<br />
                            微星以製造主機板及顯示卡起家，跨足消費電子及商務應用市場，其產品線延伸至筆記型電腦、All-in-One桌機、伺服器、工作站電腦、工業電腦、智慧型家電、車用電子、準系統、多媒體及通訊產品等等。</div>
                        <div class="SB01Products">
                            <ul>
                                <li><img src="_img/Sponsor/p01.jpg" /></li>
                                <li><img src="_img/Sponsor/p01.jpg" /></li>
                            </ul>
                        </div>
                    </div>
                    <div class="SB02">
                        <div class="SB02Pic"><img src="_img/Sponsor/SB01Pic.png" /></div>
                        <div class="SB02Title">中國石油化學工業開發股份有限公司</div>
                        <div class="SB02Link"><a href="http://tw.msi.com/">http://tw.msi.com/</a></div>
                        <div class="SB02Content">1986年8月，五位共同創辦人成立微星科技，目前是全世界最大的資訊產業製造商之一。<br />
                            微星以製造主機板及顯示卡起家，跨足消費電子及商務應用市場，其產品線延伸至筆記型電腦、All-in-One桌機、伺服器、工作站電腦、工業電腦、智慧型家電、車用電子、準系統、多媒體及通訊產品等等。</div>
                    </div>
                    <div class="SB01">
                        <a class="SB01Pic" href="#"><img src="_img/Sponsor/SB01Pic.png" /></a>
                        <div class="SB01Title">微星科技微星科技微星</div>
                        <div class="SB01Link"><a href="http://tw.msi.com/">http://tw.msi.com/</a></div>
                        <div class="SB01Content">1986年8月，五位共同創辦人成立微星科技，目前是全世界最大的資訊產業製造商之一。<br />
                            微星以製造主機板及顯示卡起家，跨足消費電子及商務應用市場，其產品線延伸至筆記型電腦、All-in-One桌機、伺服器、工作站電腦、工業電腦、智慧型家電、車用電子、準系統、多媒體及通訊產品等等。</div>
                        <div class="SB01Products">
                            <ul>
                                <li><img src="_img/Sponsor/p01.jpg" /></li>
                                <li><img src="_img/Sponsor/p01.jpg" /></li>
                            </ul>
                        </div>
                    </div>
                    <div class="SB02">
                        <div class="SB02Pic"><img src="_img/Sponsor/SB01Pic.png" /></div>
                        <div class="SB02Title">微星科技微星科技微星微星科技微星科技微星</div>
                        <div class="SB02Link"><a href="http://tw.msi.com/">http://tw.msi.com/</a></div>
                        <div class="SB02Content">1986年8月，五位共同創辦人成立微星科技，目前是全世界最大的資訊產業製造商之一。<br />
                            微星以製造主機板及顯示卡起家，跨足消費電子及商務應用市場，其產品線延伸至筆記型電腦、All-in-One桌機、伺服器、工作站電腦、工業電腦、智慧型家電、車用電子、準系統、多媒體及通訊產品等等。</div>
                    </div>
                </div>
            </div>
            <uc1:pagerController runat="server" ID="pagerController" />
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
                    <li><img src="_img/layout/AD/01.jpg" /></li>
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

