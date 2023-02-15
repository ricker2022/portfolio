<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Bulletin_Event.aspx.vb" Inherits="Bulletin_Event" %>

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
        <div id="content">
            <div class="BulletinBtnArea">
                <a class="BulletinBtn" href="Bulletin_System.aspx">系統公告</a>
                <a class="BulletinBtn select" href="Bulletin_Event.aspx">活動公告</a>
            </div>
            <div class="normalContent">
                <div class="postListContent">
                <ul>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            遊e卡103年2月小額電信購點欠費-帳號暫時凍結說明公告
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2014/09/26 16:13:00</div>
                            <div class="news_txt">
                                各位親愛的玩家您好：<br />
                                每週二為星城固定維護時間!維護時間為:10:00~12:00<br />
                                1.提醒『滿貫大富豪』、『7PK』、『5PK』內之玩家， 避免損失押分，請您提早保留機台後離線。<br />
                                2. 『百家樂』、『骰寶』、『刮刮樂』，系統接手將此局結算，結算結果可能為增加分數或減少分數，機台位子不進行保留。<br />
                                3. 『行星』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，若有獲得特殊燈號(如保送燈)的玩家，將會利用20分鐘的時間完成保送局數。<br />
                                4. 『21點』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，請玩家在伺服器維護前將遊戲牌局完成結算。<br />
                                星城遊戲伺服器若提早開放，將不另行公告，所有機台於12:00起算保留4小時。<br />
                                網銀國際《星城》團隊敬上
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            遊e卡103年2月小額電信購點欠費-帳號暫時凍結說明公告
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2014/09/26 16:13:00</div>
                            <div class="news_txt">
                                各位親愛的玩家您好：<br />
                                每週二為星城固定維護時間!維護時間為:10:00~12:00<br />
                                1.提醒『滿貫大富豪』、『7PK』、『5PK』內之玩家， 避免損失押分，請您提早保留機台後離線。<br />
                                2. 『百家樂』、『骰寶』、『刮刮樂』，系統接手將此局結算，結算結果可能為增加分數或減少分數，機台位子不進行保留。<br />
                                3. 『行星』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，若有獲得特殊燈號(如保送燈)的玩家，將會利用20分鐘的時間完成保送局數。<br />
                                4. 『21點』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，請玩家在伺服器維護前將遊戲牌局完成結算。<br />
                                星城遊戲伺服器若提早開放，將不另行公告，所有機台於12:00起算保留4小時。<br />
                                網銀國際《星城》團隊敬上
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            遊e卡103年2月小額電信購點欠費-帳號暫時凍結說明公告
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2014/09/26 16:13:00</div>
                            <div class="news_txt">
                                各位親愛的玩家您好：<br />
                                每週二為星城固定維護時間!維護時間為:10:00~12:00<br />
                                1.提醒『滿貫大富豪』、『7PK』、『5PK』內之玩家， 避免損失押分，請您提早保留機台後離線。<br />
                                2. 『百家樂』、『骰寶』、『刮刮樂』，系統接手將此局結算，結算結果可能為增加分數或減少分數，機台位子不進行保留。<br />
                                3. 『行星』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，若有獲得特殊燈號(如保送燈)的玩家，將會利用20分鐘的時間完成保送局數。<br />
                                4. 『21點』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，請玩家在伺服器維護前將遊戲牌局完成結算。<br />
                                星城遊戲伺服器若提早開放，將不另行公告，所有機台於12:00起算保留4小時。<br />
                                網銀國際《星城》團隊敬上
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            遊e卡103年2月小額電信購點欠費-帳號暫時凍結說明公告
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2014/09/26 16:13:00</div>
                            <div class="news_txt">
                                各位親愛的玩家您好：<br />
                                每週二為星城固定維護時間!維護時間為:10:00~12:00<br />
                                1.提醒『滿貫大富豪』、『7PK』、『5PK』內之玩家， 避免損失押分，請您提早保留機台後離線。<br />
                                2. 『百家樂』、『骰寶』、『刮刮樂』，系統接手將此局結算，結算結果可能為增加分數或減少分數，機台位子不進行保留。<br />
                                3. 『行星』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，若有獲得特殊燈號(如保送燈)的玩家，將會利用20分鐘的時間完成保送局數。<br />
                                4. 『21點』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，請玩家在伺服器維護前將遊戲牌局完成結算。<br />
                                星城遊戲伺服器若提早開放，將不另行公告，所有機台於12:00起算保留4小時。<br />
                                網銀國際《星城》團隊敬上
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            遊e卡103年2月小額電信購點欠費-帳號暫時凍結說明公告
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2014/09/26 16:13:00</div>
                            <div class="news_txt">
                                各位親愛的玩家您好：<br />
                                每週二為星城固定維護時間!維護時間為:10:00~12:00<br />
                                1.提醒『滿貫大富豪』、『7PK』、『5PK』內之玩家， 避免損失押分，請您提早保留機台後離線。<br />
                                2. 『百家樂』、『骰寶』、『刮刮樂』，系統接手將此局結算，結算結果可能為增加分數或減少分數，機台位子不進行保留。<br />
                                3. 『行星』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，若有獲得特殊燈號(如保送燈)的玩家，將會利用20分鐘的時間完成保送局數。<br />
                                4. 『21點』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，請玩家在伺服器維護前將遊戲牌局完成結算。<br />
                                星城遊戲伺服器若提早開放，將不另行公告，所有機台於12:00起算保留4小時。<br />
                                網銀國際《星城》團隊敬上
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="active_icon">
                            [活動公告]
                        </div>
                        <div class="news_title">
                            遊e卡103年2月小額電信購點欠費-帳號暫時凍結說明公告
                        </div>
                        <div class="news_content">
                            <div class="news_region">
                                <img src="_img/Global.png" /><img src="_img/TW.png" /></div>
                            <div class="news_date">公告時間：2014/09/26 16:13:00</div>
                            <div class="news_txt">
                                各位親愛的玩家您好：<br />
                                每週二為星城固定維護時間!維護時間為:10:00~12:00<br />
                                1.提醒『滿貫大富豪』、『7PK』、『5PK』內之玩家， 避免損失押分，請您提早保留機台後離線。<br />
                                2. 『百家樂』、『骰寶』、『刮刮樂』，系統接手將此局結算，結算結果可能為增加分數或減少分數，機台位子不進行保留。<br />
                                3. 『行星』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，若有獲得特殊燈號(如保送燈)的玩家，將會利用20分鐘的時間完成保送局數。<br />
                                4. 『21點』停機前20分鐘，該館的所有玩家將會停止押注，以便進行伺服器維護，請玩家在伺服器維護前將遊戲牌局完成結算。<br />
                                星城遊戲伺服器若提早開放，將不另行公告，所有機台於12:00起算保留4小時。<br />
                                網銀國際《星城》團隊敬上
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            </div>
            <div class="pageBtnArea">
                <a class="pageBtn">第一頁</a>
                <a class="pageBtn">第二頁</a>
                </div>
        </div>
    </div>
</asp:Content>

