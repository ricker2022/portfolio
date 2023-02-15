<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="News" %>

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
            <div class="PageVideoArea">
                <div class="PageVideoTitle"></div>
                <div class="PageVideoContent">
                    <ul>
                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
                        </li>

                        <li>
                            <div class="PageVideoCPic"><img src="_img/Media/PageVideoPic.png" /></div>
                            <div class="PageVideoCDate">2014-09-16  10:40</div>
                            <div class="PageVideoCGameIcon">
                                <ul class="PageVCGI">
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageVideoCTxt">鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄鉄人盃國際公開邀請賽鉄人盃國際公開邀請賽鉄</div>
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

