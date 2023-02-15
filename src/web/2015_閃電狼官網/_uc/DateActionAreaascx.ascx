<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DateActionAreaascx.ascx.cs" Inherits="_DateActionAreaascx" %>
<div class="DateActionArea">
    <link href="_css/calen.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script type="text/javascript" src="_js/jquery.min.js"></script>
        <style>
            #calen_ul {
                width:280px;
                line-height:60px;
            }
        </style>
    <script type="text/javascript">
            var now = new Date();
            var time = new Date();
            var month_0, date_0, hours_0, minutes_0;
            if ((now.getMonth() + 1).toString().length == 1) {
                month_0 = '0' + (now.getMonth() + 1).toString();
            } else {
                month_0 = (now.getMonth() + 1).toString();
            }
            if (now.getDate().toString().length == 1) {
                date_0 = '0' + now.getDate().toString();
            } else {
                date_0 = now.getDate().toString();
            }
            if (now.getHours().toString().length == 1) {
                hours_0 = '0' + now.getHours().toString();
            } else {
                hours_0 = now.getHours().toString();
            }
            if (now.getMinutes().toString().length == 1) {
                minutes_0 = '0' + now.getMinutes().toString();
            } else {
                minutes_0 = now.getMinutes().toString();
            }
            time = now.getFullYear().toString() + "/" + month_0 + "/" + date_0 + " " + hours_0 + ":" + minutes_0;
            var today = new Date();
            today = now.getFullYear().toString() + "/" + month_0 + "/" + date_0;
            var _todate = new Date();
            _todate = now.getFullYear().toString() + month_0 + date_0;
            $(document).ready(function () {
                var btn_class = ".date_btn_" + _todate;
                $(btn_class).css({ "font-weight": "bold", "color": "black" });
                $(btn_class).attr("id", "date_btn_clicked");
                var t1 = '<%=比賽日期%>';
                var t2 = '<%=賽事圖片 %>';
                var t3 = '<%=基本介紹 %>';
                var t4 = '<%=賽事名稱 %>';
                var t5 = '<%=直播時間 %>';
                var t6 = '<%=日期id %>';
                var t7 = '<%=直播網址 %>';
                var t8 = '<%=賽事網址 %>';
                var t9 = '<%=類別 %>';
                var date_list = t1.split(",");
                var img_list = t2.split(",");
                var info_list = t3.split(",");
                var game_list = t4.split(",");
                var time_list = t5.split(",");
                var date_id_list = t6.split(",");
                var live_list = t7.split(",");
                var website_list = t8.split(",");
                var type_list = t9.split(",");
                var start_time, end_time;
                //alert(string);
                var last_date_id = null;
                var date, now, diff, year, month, date, h, m;
                for (var i = 0; i < date_list.length; i++) {
                    if (last_date_id == date_list[i])   //處理同一天有一個以上的賽事
                    {
                        var string = "<div class=\"DACALeft\">" +
                                        "<div class=\"DACAPic\">" +
                                            "<img src=\"" + img_list[i] + "\" />" +
                                        "</div>";
                        if (live_list[i] != '') {
                            start_time = time_list[i].slice(11, 16);
                            end_time = time_list[i].slice(19, 24);
                            start_time = time_list[i].slice(0, 10) + " " + start_time;
                            end_time = time_list[i].slice(0, 10) + " " + end_time;
                            if ((time >= start_time) && (time < end_time)) {
                                if (type_list[i] == "2賽事") {
                                    string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"DACABtnOn\"></a>";
                                } else {
                                    if (type_list[i] == "1生日") {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"BDBtn\"></a>";
                                    } else {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"FBinfoBtn\"></a>";
                                    }
                                }
                            } else {
                                if (type_list[i] == "2賽事") {
                                    string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"DACABtn\"></a>";
                                } else {
                                    if (type_list[i] == "1生日") {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"BDBtn\"></a>";
                                    } else {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"FBinfoBtn\"></a>";
                                    }
                                }
                            }
                        }
                        string = string + "</div>" +
                                    "<div class=\"DACARight\">" +
                                        "<a href=\"" + website_list[i] + "\" target=\"_blank\"><div class=\"DACATitle\">" + game_list[i] + "</div></a>" +
                                        "<div class=\"DACATeams\">" + info_list[i] + "</div>" +
                                        "<div class=\"DACADate\">" + time_list[i] + "</div>" +
                                    "</div>";
                        var append_div_id = "#Div_" + last_date_id;
                        $(append_div_id).append(string);
                    }
                    else {
                        var string = "<div class=\"DACAtion\" id=\"Div_" + date_list[i] + "\">" +
                                    "<div class=\"DACALeft\">" +
                                        "<div class=\"DACAPic\">" +
                                            "<img src=\"" + img_list[i] + "\" />" +
                                        "</div>";

                        if (live_list[i] != '') {
                            start_time = time_list[i].slice(11, 16);
                            end_time = time_list[i].slice(19, 24);
                            start_time = time_list[i].slice(0, 10) + " " + start_time;
                            end_time = time_list[i].slice(0, 10) + " " + end_time;
                            if ((time >= start_time) && (time < end_time)) {
                                if (type_list[i] == "2賽事") {
                                    string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"DACABtnOn\"></a>";
                                } else {
                                    if (type_list[i] == "1生日") {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"BDBtn\"></a>";
                                    } else {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"FBinfoBtn\"></a>";
                                    }
                                }
                            } else {
                                if (type_list[i] == "2賽事") {
                                    string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"DACABtn\"></a>";
                                } else {
                                    if (type_list[i] == "1生日") {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"BDBtn\"></a>";
                                    } else {
                                        string = string + "<a href=\"" + live_list[i] + "\" target=\"_blank\" class=\"FBinfoBtn\"></a>";
                                    }
                                }
                            }
                        }
                        string = string + "</div>" +
                                    "<div class=\"DACARight\">" +
                                        "<a href=\"" + website_list[i] + "\" target=\"_blank\"><div class=\"DACATitle\">" + game_list[i] + "</div></a>" +
                                        "<div class=\"DACATeams\">" + info_list[i] + "</div>" +
                                        "<div class=\"DACADate\">" + time_list[i] + "</div>" +
                                    "</div>" +
                                "</div>";
                        $("#DAContent").append(string);
                    }
                    if (date_id_list[i] != today) {    //當天沒賽事隱藏資訊
                        var div_id = '#Div_' + date_list[i];
                        $(div_id).hide();
                    }
                    last_date_id = date_list[i];
                }
            });
        //賽事顯示or隱藏
        function Action() {
            var current_class = $("#DACActionBtn").attr('class');
            if (current_class == 'DACActionBtn')
            {
                $(".DACAtion").slideUp();
                $("#DACActionBtn").attr('class', 'DACActionBtn_click');

            }else
            {
                var date_btn_class = $("#date_btn_clicked").attr('class');
                var div_id = '#Div_' + date_btn_class.replace("date_btn_", "");
                var btn_class = ".date_btn_" + date_btn_class.replace("date_btn_", "");
                $(btn_class).css({ "font-weight": "bold", "color": "black" });
                $(btn_class).attr("id", "date_btn_clicked");
                $(div_id).slideDown();
                $("#DACActionBtn").attr('class', 'DACActionBtn');
            }            
        }

        //點選日期
        function change_date(date) {
            //判別賽事是否隱藏，處理css
            $("#DACActionBtn").attr('class', 'DACActionBtn');
            //處理之前被點選的日期
            $("#date_btn_clicked").css({ "font-weight": "", "color": "" });
            var date_btn_class = $("#date_btn_clicked").attr('class');
            $("#date_btn_clicked").attr("id", date_btn_class);
            //處理這次被點選的日期
            var btn_class = ".date_btn_" + date;
            $(btn_class).css({ "font-weight": "bold", "color": "black" });
            $(btn_class).attr("id", "date_btn_clicked");
            //處理賽事資訊
            var div_id = '#Div_' + date;
            $(".DACAtion").slideUp();
            $(div_id).slideDown();
        }
        function 上個月() {
            var hide_panel_id = '.Panel' + $('#now_month').val();
            var show_panel_id = '.Panel' + (parseInt($('#now_month').val()) - 1);
            $(hide_panel_id).attr("style", "display:none");
            $(show_panel_id).attr("style", "display:block");
            $('#now_month').val(parseInt($('#now_month').val()) - 1);
            處理年月標題();
        }
        function 下個月() {
            var hide_panel_id = '.Panel' + $('#now_month').val();
            var show_panel_id = '.Panel' + (parseInt($('#now_month').val()) + 1);
            $(hide_panel_id).attr("style", "display:none");
            $(show_panel_id).attr("style", "display:block");
            $('#now_month').val(parseInt($('#now_month').val()) + 1);
            處理年月標題();
        }
        function 處理年月標題()
        {
            if ($('#now_month').val() == 0) {
                $('.lb_year_month').text('<%=lb_year_month_0 %>');
                $('#prev_month').hide();
                $('#next_month').show();
            }
            if ($('#now_month').val() == 1) {
                $('.lb_year_month').text('<%=lb_year_month_1 %>');
                $('#prev_month').show();
                $('#next_month').show();
            }
            if ($('#now_month').val() == 2) {
                $('.lb_year_month').text('<%=lb_year_month_2 %>');
                $('#prev_month').show();
                $('#next_month').hide();
            }
        }
        $(function () {

        })
    </script>
    <div class="DATitle"></div>
    <div class="DAContent" id="DAContent">
        <div class="DACCalendar">
            <div class="pagination-holder clearfix"><div style="width:280px;height:30px;text-align:center;">
                <%--<%=比賽日期 %>--%>
                <table>
                    <tr>
                        <td style="width:20px;"><i id="prev_month" style="float:left;font-size:24pt;color:#535353;cursor:pointer;" class="fa fa-caret-left" onclick="上個月()"></i></td>
                        <td style="width:240px;"><asp:Label ID="lb_year_month" CssClass="lb_year_month" runat="server" Text="" style="line-height:2;color:white;font-family:'Microsoft JhengHei'"></asp:Label></td>
                        <td style="width:20px;"><i id="next_month" style="float:right;font-size:24pt;color:#535353;cursor:pointer;" class="fa fa-caret-right" onclick="下個月()"></i></td>
                    </tr>
                </table>
                </div>
                <input type="hidden" id="now_month" value="1" />
                <asp:Panel ID="Panel0" runat="server" style="display:none;" class="pagination light-theme simple-pagination Panel0" HorizontalAlign="Center"></asp:Panel>     
                <asp:Panel ID="Panel1" runat="server"  class="pagination light-theme simple-pagination Panel1" HorizontalAlign="Center"></asp:Panel>     
                <asp:Panel ID="Panel2" runat="server" style="display:none;" class="pagination light-theme simple-pagination Panel2" HorizontalAlign="Center"></asp:Panel>     
        </div>         
        <input type="button" class="DACActionBtn" id="DACActionBtn" onclick="Action();" />    
        </div>        
    </div>
</div>
