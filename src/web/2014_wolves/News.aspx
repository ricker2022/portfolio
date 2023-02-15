<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

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
        <div class="MainLeftArea">
            <div class="NewsArea">
                <div class="NewsTitle">
                    <input type="button" class="NewsMoreBtn" />
                </div>
                <div class="NewsContent">
                    <ul>
                        <li>
                            <div class="NewsCPic">
                                <img src="_img/News/pic/01.jpg" />
                            </div>
                            <div class="NewsCTitle">《星海爭霸》Zest奪冠KesPA杯：靠這個冠軍期待戰隊</div>
                            <div class="NewsCDate">2014-09-16</div>
                            <div class="NewsCContent">問：奪冠的感言    答：可能像這樣一路打內戰奪冠的我還是第一個吧。但是很多人並沒有因此責難我，而是得到了大家的祝福，真是謝謝。這是KeSPA杯多年以後重新舉辦。</div>
                            <div class="NewsCTeam">
                                <ul>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <input type="button" class="NewsCMoreBtn" />
                        </li>
                        <li>
                            <div class="NewsCPic">
                                <img src="_img/News/pic/01.jpg" />
                            </div>
                            <div class="NewsCTitle">《星海爭霸》Zest奪冠KesPA杯：靠這個冠軍期待戰隊</div>
                            <div class="NewsCDate">2014-09-16</div>
                            <div class="NewsCContent">問：奪冠的感言    答：可能像這樣一路打內戰奪冠的我還是第一個吧。但是很多人並沒有因此責難我，而是得到了大家的祝福，真是謝謝。這是KeSPA杯多年以後重新舉辦。</div>
                            <div class="NewsCTeam">
                                <ul>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <input type="button" class="NewsCMoreBtn" />
                        </li>
                        <li>
                            <div class="NewsCPic">
                                <img src="_img/News/pic/01.jpg" />
                            </div>
                            <div class="NewsCTitle">《星海爭霸》Zest奪冠KesPA杯：靠這個冠軍期待戰隊</div>
                            <div class="NewsCDate">2014-09-16</div>
                            <div class="NewsCContent">問：奪冠的感言    答：可能像這樣一路打內戰奪冠的我還是第一個吧。但是很多人並沒有因此責難我，而是得到了大家的祝福，真是謝謝。這是KeSPA杯多年以後重新舉辦。</div>
                            <div class="NewsCTeam">
                                <ul>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <input type="button" class="NewsCMoreBtn" />
                        </li>
                        <li>
                            <div class="NewsCPic">
                                <img src="_img/News/pic/01.jpg" />
                            </div>
                            <div class="NewsCTitle">《星海爭霸》Zest奪冠KesPA杯：靠這個冠軍期待戰隊</div>
                            <div class="NewsCDate">2014-09-16</div>
                            <div class="NewsCContent">問：奪冠的感言    答：可能像這樣一路打內戰奪冠的我還是第一個吧。但是很多人並沒有因此責難我，而是得到了大家的祝福，真是謝謝。這是KeSPA杯多年以後重新舉辦。</div>
                            <div class="NewsCTeam">
                                <ul>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <input type="button" class="NewsCMoreBtn" />
                        </li>
                        <li>
                            <div class="NewsCPic">
                                <img src="_img/News/pic/01.jpg" />
                            </div>
                            <div class="NewsCTitle">《星海爭霸》Zest奪冠KesPA杯：靠這個冠軍期待戰隊</div>
                            <div class="NewsCDate">2014-09-16</div>
                            <div class="NewsCContent">問：奪冠的感言    答：可能像這樣一路打內戰奪冠的我還是第一個吧。但是很多人並沒有因此責難我，而是得到了大家的祝福，真是謝謝。這是KeSPA杯多年以後重新舉辦。</div>
                            <div class="NewsCTeam">
                                <ul>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                    <li>
                                        <img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <input type="button" class="NewsCMoreBtn" />
                        </li>
                    </ul>
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
            <div class="ADBanner">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>

            <!--↓↓推薦影片↓↓-->
            <uc1:VideoArea runat="server" ID="VideoArea" />

            <!--↓↓推薦相簿↓↓-->
            <uc1:AlbumArea runat="server" ID="AlbumArea" />
        </div>
    </div>

</asp:Content>

