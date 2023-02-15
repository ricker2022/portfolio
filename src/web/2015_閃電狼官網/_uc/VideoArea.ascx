<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoArea.ascx.cs" Inherits="_uc_VideoArea" %>
 
<script type="text/javascript">
    //var V_i = 0;
    var V_now = 0;
    var V_i = 0;
    var timeout_video = 0;
    var Video_timer_count = 0;
    var V_img_string, V_date_string, V_info_string, V_icon1_string, V_icon2_string, V_icon3_string, V_img_arr, V_date_arr, V_info_arr, V_arr_length, V_icon1_arr, V_icon2_arr, V_icon3_arr;

    $(document).ready(function () {
        V_id_string = $('.V_id_string').val();
        if (V_id_string != null)
        {
            V_img_string = $('.V_img_string').val();
            V_date_string = $('.V_date_string').val();
            V_info_string = $('.V_info_string').val();
            V_icon1_string = $('.V_icon1_string').val();
            V_icon2_string = $('.V_icon2_string').val();
            V_icon3_string = $('.V_icon3_string').val();
            V_id_arr = V_id_string.split(",");
            V_img_arr = V_img_string.split(",");
            V_date_arr = V_date_string.split(",");
            V_info_arr = V_info_string.split(",");
            V_icon1_arr = V_icon1_string.split(",");
            V_icon2_arr = V_icon2_string.split(",");
            V_icon3_arr = V_icon3_string.split(",");
            V_arr_length = V_img_arr.length;

            $("#date").text(V_date_arr[0]);
            $("#Video_pic").attr("src", V_img_arr[0]);
            $("#Video_link").attr("href", 'VideoPage.aspx?video=' + V_id_arr[0]);
            $("#Video_link").attr("target", "_blank");
            $("#VideoInfo").text(V_info_arr[0]);

            if (V_icon1_arr[0] == '') {
                $("#icon1").attr("style", "display:none;");
            } else {
                $("#icon1").attr("style", "display:block;");
                $("#icon1").attr("src", V_icon1_arr[0]);
            }
            if (V_icon2_arr[0] == '') {
                $("#icon2").attr("style", "display:none;");
            } else {
                $("#icon2").attr("style", "display:block;");
                $("#icon2").attr("src", V_icon2_arr[0]);
            }
            if (V_icon3_arr[0] == '') {
                $("#icon3").attr("style", "display:none;");
            } else {
                $("#icon3").attr("style", "display:block;");
                $("#icon3").attr("src", V_icon3_arr[0]);
            }
            輪播_影音();
        }
    });

    function 輪播_影音() {        
        Video_timer_count++;
        if (Video_timer_count % 3 == 0) {
            Video_timer_count = 0;
            if (V_now+1 == V_arr_length) {
                V_now = 0;
            } else
            {
                V_now++;
            }
            $("#date").text(V_date_arr[V_now]);
            $("#Video_pic").attr("src", V_img_arr[V_now]);
            $("#Video_link").attr("href", 'VideoPage.aspx?video=' + V_id_arr[V_now]);
            $("#Video_link").attr("target", "_blank");
            $("#VideoInfo").text(V_info_arr[V_now]);
            if (V_icon1_arr[V_now] == '') {
                $("#icon1").attr("style", "display:none;");
            } else {
                $("#icon1").attr("style", "display:block;");
                $("#icon1").attr("src", V_icon1_arr[V_now]);
            }
            if (V_icon2_arr[V_now] == '') {
                $("#icon2").attr("style", "display:none;");
            } else {
                $("#icon2").attr("style", "display:block;");
                $("#icon2").attr("src", V_icon2_arr[V_now]);
            }
            if (V_icon3_arr[V_now] == '') {
                $("#icon3").attr("style", "display:none;");
            } else {
                $("#icon3").attr("style", "display:block;");
                $("#icon3").attr("src", V_icon3_arr[V_now]);
            }
            //console.log('V_now:' + V_now);       
        }        
        timeout_video = setTimeout("輪播_影音()", 1000);
        //console.log(Video_timer_count);
    }
    function prev() {
        Video_timer_count = 0;              
        if (V_now == 0) // 如果下一個是1，目前就是0，上一個就會是最後一個。
        {
            V_i = V_arr_length - 1;
        } else {
            V_i = V_now - 1;
        }
        $("#date").text(V_date_arr[V_i]);
        $("#Video_pic").attr("src", V_img_arr[V_i]);
        $("#Video_link").attr("href", 'VideoPage.aspx?video=' + V_id_arr[V_i]);
        $("#Video_link").attr("target", "_blank");
        $("#VideoInfo").text(V_info_arr[V_i]);
        if (V_icon1_arr[V_i] == '') {
            $("#icon1").attr("style", "display:none;");
        } else {
            $("#icon1").attr("style", "display:block;");
            $("#icon1").attr("src", V_icon1_arr[V_i]);
        }
        if (V_icon2_arr[V_i] == '') {
            $("#icon2").attr("style", "display:none;");
        } else {
            $("#icon2").attr("style", "display:block;");
            $("#icon2").attr("src", V_icon2_arr[V_i]);
        }
        if (V_icon3_arr[V_i] == '') {
            $("#icon3").attr("style", "display:none;");
        } else {
            $("#icon3").attr("style", "display:block;");
            $("#icon3").attr("src", V_icon3_arr[V_i]);
        }
        V_now = V_i;
        //console.log('V_now:' + V_now);
    }
    function next() {
        Video_timer_count = 0;
        if (V_now == V_arr_length - 1) // 如果是最後1個，下一個就會是第1個。
        {
            V_i = 0;
        } else {
            V_i = V_now + 1;
        }
        $("#date").text(V_date_arr[V_i]);
        $("#Video_pic").attr("src", V_img_arr[V_i]);
        $("#Video_link").attr("href", 'VideoPage.aspx?video=' + V_id_arr[V_i]);
        $("#Video_link").attr("target", "_blank");
        $("#VideoInfo").text(V_info_arr[V_i]);
        if (V_icon1_arr[V_i] == '') {
            $("#icon1").attr("style", "display:none;");
        } else {
            $("#icon1").attr("style", "display:block;");
            $("#icon1").attr("src", V_icon1_arr[V_i]);
        }
        if (V_icon2_arr[V_i] == '') {
            $("#icon2").attr("style", "display:none;");
        } else {
            $("#icon2").attr("style", "display:block;");
            $("#icon2").attr("src", V_icon2_arr[V_i]);
        }
        if (V_icon3_arr[V_i] == '') {
            $("#icon3").attr("style", "display:none;");
        } else {
            $("#icon3").attr("style", "display:block;");
            $("#icon3").attr("src", V_icon3_arr[V_i]);
        }
        V_now = V_i;
        //console.log('V_now:' + V_now);
    }
</script>

<div class="VideoArea" id="VideoArea" runat="server">
    <div class="VideoTitle"></div>
    <div class="VideoContent">
        <div id="VideoPic">
        <input type="hidden" value="" runat="server" id="V_id_string" class="V_id_string" />
        <input type="hidden" value="" runat="server" id="V_img_string" class="V_img_string" />
        <input type="hidden" value="" runat="server" id="V_date_string" class="V_date_string" />
        <input type="hidden" value="" runat="server" id="V_info_string" class="V_info_string" />
        <input type="hidden" value="" runat="server" id="V_icon1_string" class="V_icon1_string" />
        <input type="hidden" value="" runat="server" id="V_icon2_string" class="V_icon2_string" />
        <input type="hidden" value="" runat="server" id="V_icon3_string" class="V_icon3_string" />
            <ul>
                <li><a id="Video_link" href=""><img id="Video_pic" src="_img/empty.png" width="294" /></a></li>
            </ul>
        </div>
        <input type="button" class="VideoLeftBtn" id="VideoLeftBtn" style="cursor:pointer;" onclick="prev()" />
        <input type="button" class="VideoRightBtn" id="VideoRightBtn" style="cursor:pointer;" onclick="next()" />
        <div class="Videodate" id="date">2014-09-16</div>
        <div class="VideoTeamIcon">
            <ul>
                <li>
                    <img id="icon3" src="_img/empty.png" width="28" /></li>
                <li>
                    <img id="icon2" src="_img/empty.png" width="28" /></li>
                <li>
                    <img id="icon1" src="_img/empty.png" width="28" /></li>
            </ul>
        </div>
        <div class="VideoInfo" id="VideoInfo" style= "overflow:hidden;display:block;white-space:nowrap;text-overflow:ellipsis;">LOL香港電子競技大賽全面壓倒性勝利的比賽噢</div>
    </div>
</div>
