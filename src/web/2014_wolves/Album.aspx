<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Album.aspx.cs" Inherits="News" %>

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
            <div class="PageAlbumArea">
                <div class="PageAlbumTitle"></div>
                <div class="PageAlbumContent">
                    <ul>
                        <li>
                            <div class="PageACDate">2014-09-16</div>
                            <div class="PageACLine"></div>
                            <div class="PageACTitle">鉄人盃國際公開邀請賽Day2(上)</div>
                            <div class="PageACGameIcon">
                                <ul>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageACPicArea">
                                <div class="PagePicB"><img src="_img/Media/AlubmB.png" /></div>
                                <div class="PagePicS">
                                    <ul>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                    </ul>
                                </div>
                                <input type="button" class="PageAlbumMoreBtn" />
                            </div>
                        </li>
                        
                        <li>
                            <div class="PageACDate">2014-09-16</div>
                            <div class="PageACLine"></div>
                            <div class="PageACTitle">鉄人盃國際公開邀請賽Day2(上)</div>
                            <div class="PageACGameIcon">
                                <ul>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageACPicArea">
                                <div class="PagePicB"><img src="_img/Media/AlubmB.png" /></div>
                                <div class="PagePicS">
                                    <ul>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                    </ul>
                                </div>
                                <input type="button" class="PageAlbumMoreBtn" />
                            </div>
                        </li>

                        <li>
                            <div class="PageACDate">2014-09-16</div>
                            <div class="PageACLine"></div>
                            <div class="PageACTitle">鉄人盃國際公開邀請賽Day2(上)</div>
                            <div class="PageACGameIcon">
                                <ul>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageACPicArea">
                                <div class="PagePicB"><img src="_img/Media/AlubmB.png" /></div>
                                <div class="PagePicS">
                                    <ul>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                    </ul>
                                </div>
                                <input type="button" class="PageAlbumMoreBtn" />
                            </div>
                        </li>

                        <li>
                            <div class="PageACDate">2014-09-16</div>
                            <div class="PageACLine"></div>
                            <div class="PageACTitle">鉄人盃國際公開邀請賽Day2(上)</div>
                            <div class="PageACGameIcon">
                                <ul>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageACPicArea">
                                <div class="PagePicB"><img src="_img/Media/AlubmB.png" /></div>
                                <div class="PagePicS">
                                    <ul>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                    </ul>
                                </div>
                                <input type="button" class="PageAlbumMoreBtn" />
                            </div>
                        </li>

                        <li>
                            <div class="PageACDate">2014-09-16</div>
                            <div class="PageACLine"></div>
                            <div class="PageACTitle">鉄人盃國際公開邀請賽Day2(上)</div>
                            <div class="PageACGameIcon">
                                <ul>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                    <li><img src="_img/layout/gameIcon.png" /></li>
                                </ul>
                            </div>
                            <div class="PageACPicArea">
                                <div class="PagePicB"><img src="_img/Media/AlubmB.png" /></div>
                                <div class="PagePicS">
                                    <ul>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                        <li><img src="_img/Media/AlubmS.png" /></li>
                                    </ul>
                                </div>
                                <input type="button" class="PageAlbumMoreBtn" />
                            </div>
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

