<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PlayerArea.ascx.cs" Inherits="PlayerArea" %>

    <script type="text/javascript">
        var timer_count = 0;
        var player_count = 0;
        var player_now = 0;
        var player_prev = 0;
        var player_next = 0;
        var player_now_id = '';
        var player_prev_id = '';
        var player_next_id = '';
        //var player_divs = ["#player_div0", "#player_div1", "#player_div2"];
        var player_divs = '';
        var player_teams = '';
        var player_id = '';
        var player_link = '';
        $(document).ready(function () {
            var html = $(".dBanner_temp").val();
            $("#dBanner_ul").append(html);
            var divs = $(".dBanner_temp_div").val();
            player_divs = divs.split(",");
            var teams = $(".dBanner_temp_team").val();
            player_teams = teams.split(",");
            var id = $(".dBanner_temp_id").val();
            player_id = id.split(",");

            player_link = "TeamsMemberIntro.aspx?player=" + player_id[player_now];
            $("#dBIMoreBtn").attr("href", player_link);
            $(player_divs[0]).show();
            player_count=player_divs.length;
            Player_Timer();
        });
        function show_next_player() {
            player_prev = player_now - 1;
            player_next = player_now + 1;
            if (player_now == player_count - 1) {
                player_next = 0;
            }
            player_now_id = '#player_div' + player_now.toString();
            player_next_id = '#player_div' + player_next.toString();

            $(player_now_id).fadeOut("slow");
            $(player_next_id).fadeIn("slow");
            player_link = "TeamsMemberIntro.aspx?player=" + player_id[player_next];
            
            $("#dBIMoreBtn").attr("href", player_link);
            if (player_now == player_count - 1) {
                player_now = 0;
            } else {
                player_now++;
            }
            timer_count = 0;
        }
        function show_prev_player() {
            player_prev = player_now - 1;
            player_next = player_now + 1;
            if (player_now == 0) {
                player_prev = player_count - 1;
            }
            player_now_id = '#player_div' + player_now.toString();
            player_prev_id = '#player_div' + player_prev.toString();

            $(player_now_id).fadeOut("slow");
            $(player_prev_id).fadeIn("slow");
            player_link = "TeamsMemberIntro.aspx?player=" + player_id[player_prev];
            $("#dBIMoreBtn").attr("href", player_link);
            if (player_now == 0) {
                player_now = player_count - 1;
            } else {
                player_now--;
            }
            timer_count = 0;
        }
        function Player_Timer() {    
            timer_count++;
            //console.log(timer_count);
            if (timer_count % 8 == 0) {                
                timer_count = 0;
                player_prev = player_now - 1;
                player_next = player_now + 1;
                if (player_now == 0) {
                    player_prev = player_count - 1;
                }
                if (player_now == player_count - 1) {
                    player_next = 0;
                }
                player_now_id = '#player_div' + player_now.toString();
                player_prev_id = '#player_div' + player_prev.toString();
                player_next_id = '#player_div' + player_next.toString();

                //console.log(player_now_id + ' next:' + player_next);
                $(player_now_id).fadeOut("slow");
                $(player_next_id).fadeIn("slow");
                player_link = "TeamsMemberIntro.aspx?player=" + player_id[player_next];
                //console.log(player_now);
                $("#dBIMoreBtn").attr("href", player_link);
                if (player_now == player_count - 1) {
                    player_now = 0;
                } else {
                    player_now++;
                }
                
            }
            setTimeout("Player_Timer()", 1000);
        }
    </script>
<style>
    #a {
        background: url(_img/layout/Mainbanner/01.jpg) top left no-repeat;
        height:575px;
    }
</style>
<input type="hidden" value="" runat="server" id="P_id_string" class="P_id_string" />
<%--<input type="text" value="" runat="server" id="P_img_string" class="P_img_string" />--%>
<input type="hidden" value="" runat="server" id="P_info_string" class="P_info_string" />
<input type="hidden" value="" runat="server" id="P_icon_string" class="P_icon_string" />
<input type="hidden" value="" runat="server" id="選手ID_string" class="選手ID_string" />



<input type="hidden" id="dBanner_temp" class="dBanner_temp" runat="server" />
<input type="hidden" id="dBanner_temp_div" class="dBanner_temp_div" runat="server" />
<input type="hidden" id="dBanner_temp_id" class="dBanner_temp_id" runat="server" />
<input type="hidden" id="dBanner_temp_team" class="dBanner_temp_team" runat="server" />
<div id="dSlideshow">
    <div id="dBanner">
        <div class="dBISelectBtnArea">
            <a class="dBILeftBtn" href="#" onclick="show_prev_player()"></a>
            <a class="dBIRightBtn" href="#" onclick="show_next_player()"></a>
            <div class="dBIMoreBtn"><a id="dBIMoreBtn" href="TeamsMemberIntro.aspx?id=&player"></a></div>
        </div>
        
              <ul id="dBanner_ul">
               <%-- <li>
                    <div id="player_div0" style="background:url('_img/layout/Mainbanner/01.jpg') top left no-repeat;height:575px;display:none;">
                        <div class="dBannerInfo">
                            <div class="dBIIcon">
                                <img src="_img/layout/TeamIcon/01.png" />
                            </div>
                            <div class="dBIName">San</div>
                            <div class="dBILine"></div>
                            <div class="dBIIntro">選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人</div>
                            <div class="dBIMoreBtn"><a href="#"></a></div>
                        </div>
                    </div>
                </li>

                <li>
                    <div id="player_div1" style="background:url('_img/layout/Mainbanner/02.jpg') top left no-repeat;height:575px;display:none;">
                        <div class="dBannerInfo">
                            <div class="dBIIcon">
                                <img src="_img/layout/TeamIcon/01.png" />
                            </div>
                            <div class="dBIName">2SanSanSan</div>
                            <div class="dBILine"></div>
                            <div class="dBIIntro">選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人</div>
                            <div class="dBIMoreBtn"><a href="#"></a></div>
                        </div>
                    </div>
                </li>
                  <li>
                    <div id="player_div2" style="background:url('_img/layout/Mainbanner/03.jpg') top left no-repeat;height:575px;display:none;">
                        <div class="dBannerInfo">
                            <div class="dBIIcon">
                                <img src="_img/layout/TeamIcon/01.png" />
                            </div>
                            <div class="dBIName">3SanSanSan</div>
                            <div class="dBILine"></div>
                            <div class="dBIIntro">選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人介紹選手個人</div>
                            <div class="dBIMoreBtn"><a href="#"></a></div>
                        </div>
                    </div>
                </li>--%>
            </ul>
    </div>
</div>
