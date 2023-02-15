<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="News" %>

<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>

<%@ Register Src="~/_uc/TeamArea.ascx" TagPrefix="uc1" TagName="TeamArea" %>
<%@ Register Src="~/_uc/SearchArea.ascx" TagPrefix="uc1" TagName="SearchArea" %>
<%@ Register Src="~/_uc/DateActionAreaascx.ascx" TagPrefix="uc1" TagName="DateActionAreaascx" %>
<%@ Register Src="~/_uc/pagerController.ascx" TagPrefix="uc1" TagName="pagerController" %>
<%@ Register Src="~/_uc/RNewsArea.ascx" TagPrefix="uc1" TagName="RNewsArea" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageBG"></div>
    <div id="topLogo" style="margin: 20px 0 0 425px;">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="pagemain">
        <div class="MainLeftArea">
            <div class="EventsArea">
                <div class="EventsTitle"></div>
                <div class="EventsContent">
                    <ul>
                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
                            </div>
                        </li>

                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
                            </div>
                        </li>

                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
                            </div>
                        </li>

                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
                            </div>
                        </li>

                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
                            </div>
                        </li>

                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
                            </div>
                        </li>

                        <li>
                            <div class="EventsCLeft">
                                <div class="EventsCPic"><img src="_img/Events/EventPic01.png" /></div>
                                <div class="EventsCGameIcon">
                                    <ul>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                        <li><img src="_img/layout/gameIcon.png" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="EventsCRight">
                                <div class="EventsCTitle">LNL春季預選賽賽事名稱，春季預選賽賽事名稱春季預選賽賽事名稱最多兩行.....</div>
                                <div class="EventsCTeamName">yoe閃電狼 vs. AZB TPS</div>
                                <input type="button" class="EventsCLiveBtn" />
                                <div class="EventsCTime">2014-09-16 16:00</div>
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
            <div class="ADBanner" style="padding:7px 0 10px 0;">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>

            <!--↓↓最新新聞↓↓-->
            <uc1:RNewsArea runat="server" id="RNewsArea" />

        </div>
    </div>

</asp:Content>

