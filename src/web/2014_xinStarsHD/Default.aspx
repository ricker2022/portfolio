<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $(document).ready(function () {

            //公告
            var lastobj;
            $(".news_content").hide();
            $(".news_title").click(function () {
                $(".news_content").slideUp();
                if ($(this).next(".news_content").css("display") == "block") {
                    $(this).next(".news_content").slideUp();
                } else {
                    $(this).next(".news_content").slideDown();
                }
                return false;
            })
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <div id="marqueeList">★恭喜玩家「咬我阿笨蛋」獲得LOGO連線星幣$511586★</div>
        <div id="downloadAPK">
            <div class="downloadAPKimg">
                <img src="_img/APKimg/01.jpg" alt="星城熱門遊戲APK下載" /></div>
            <a class="downloadApkBtn" href="#"></a>
        </div>
        <div id="postList">
            <a class="postListMoreBtn" href="Bulletin_System.aspx">More</a>
            <div class="postListTitle">最新公告</div>
            <div id ="postContent" class="postListContent" runat="server">
                    <ul>
                        <li>
                            <div class="system_icon">
                                [系統公告]
                            </div>
                            <div class="news_title">
                                無消息
                            </div>
                            <div class="news_content">
                                <div class="news_region">
                                    <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                                <div class="news_date">公告時間：2013/01/01 00:00</div>
                                <div class="news_txt">
                                    無消息
                                </div>
                            </div>
                    </li>
                    <li>
                        <div class="system_icon">
                            [系統公告]
                        </div>
                        <div class="news_title">
                            無消息
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2013/01/01 00:00</div>
                            <div class="news_txt">
                                無消息
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="system_icon">
                            [系統公告]
                        </div>
                        <div class="news_title">
                            無消息
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2013/01/01 00:00</div>
                            <div class="news_txt">
                                無消息
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            無消息
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2013/01/01 00:00</div>
                            <div class="news_txt">
                                無消息
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            無消息
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2013/01/01 00:00</div>
                            <div class="news_txt">
                                無消息
                            </div>
                        </div>
                   </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            無消息
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2013/01/01 00:00</div>
                            <div class="news_txt">
                                無消息
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div id="gameOverView">
            <div class="gameOverViewTitleArea">
            <div class="gameOverViewTitle">遊戲總覽</div>
            <div class="gameOverViewSecTitle">Game Overview</div>
            </div>
            <div class="gameOverViewItems">
                <ul>
                    <li>
                        <img src="_img/GameLogo/game01b.png" /></li>
                    <li>
                        <img src="_img/GameLogo/game01b.png" /></li>
                    <li>
                        <img src="_img/GameLogo/game01b.png" /></li>
                </ul>
            </div>
            <a class="gameOverViewMoreBtn" href="Game_All.aspx"></a>
        </div>
    </div>
    </div>
    </div>
</asp:Content>

