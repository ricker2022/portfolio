<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/_uc/TeamArea.ascx" TagPrefix="uc1" TagName="TeamArea" %>
<%@ Register Src="~/_uc/SearchArea.ascx" TagPrefix="uc1" TagName="SearchArea" %>
<%@ Register Src="~/_uc/DateActionAreaascx.ascx" TagPrefix="uc1" TagName="DateActionAreaascx" %>
<%@ Register Src="~/_uc/VideoArea.ascx" TagPrefix="uc1" TagName="VideoArea" %>
<%@ Register Src="~/_uc/AlbumArea.ascx" TagPrefix="uc1" TagName="AlbumArea" %>
<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="_js/swfobject.js"></script>
    <script>
        //文件開啟時的預設動作
        $(document).ready(function () {
            fnSlideShowAuto(); //開始自動輪播廣告
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="topLogo">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="dSlideshow">
        <div id="dBanner">
            <ul>
                <li style="background:url('../_img/layout/Mainbanner/01.jpg') top center no-repeat;">
                        <div class="dBannerInfo">
                        <div class="dBIIcon">
                            <img src="_img/layout/TeamIcon/01.png" />
                        </div>
                        <div class="dBIName">San</div>
                        <div class="dBILine"></div>
                        <div class="dBIIntro">選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人</div>
                        <div class="dBIMoreBtn"><a href="#"></a></div>
                    </div>
                    <div class="dBISelectBtnArea">
                        <a class="dBILeftBtn" href="#"></a>
                        <a class="dBIRightBtn" href="#"></a>
                    </div>
                </li>

                <li style="background:url('../_img/layout/Mainbanner/02.jpg') top center no-repeat;">
                        <div class="dBannerInfo">
                        <div class="dBIIcon">
                            <img src="_img/layout/TeamIcon/01.png" />
                        </div>
                        <div class="dBIName">SanSanSan</div>
                        <div class="dBILine"></div>
                        <div class="dBIIntro">選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人</div>
                        <div class="dBIMoreBtn"><a href="#"></a></div>
                    </div>
                    <div class="dBISelectBtnArea">
                        <a class="dBILeftBtn" href="#"></a>
                        <a class="dBIRightBtn" href="#"></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="MainLeftArea">
            <div class="NNewsArea">
                <div class="NNewsTitle">
                    <input type="button" class="NNewsMoreBtn" />
                </div>
                <div class="NNewsContent">
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

