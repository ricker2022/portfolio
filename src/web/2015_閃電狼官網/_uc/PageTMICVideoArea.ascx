<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageTMICVideoArea.ascx.cs" Inherits="PageTMICVideoArea" %>
<%@ Register Src="~/_uc/TMICVpager.ascx" TagPrefix="uc1" TagName="TMICVpager" %>
<script>
    var video_now, string_id, string_title, string_date, string_img, id, title, date, img, len, video_link1, video_link2, video_next2, video_prev1, video_prev2;

    $(function () {
        video_now = 0;
        string_id = $(".video_id_temp").val();
        string_title = $(".video_title_temp").val();
        string_date = $(".video_date_temp").val();
        string_img = $(".video_img_temp").val();
        id = string_id.split(",");
        title = string_title.split(",");
        date = string_date.split(",");
        img = string_img.split(",");
        len = id.length;
        //console.log(len);
        video_link1='./VideoPage.aspx?video=' + id[0];
        video_link2='./VideoPage.aspx?video=' + id[1];
        $("#TMICVPic1").attr("src", img[0]);
        $("#TMICVTitle1").text(title[0]);
        $("#TMICVDate1").text(date[0]);
        $("#TMICVLink1").attr("href", video_link1);
        $("#TMICVPic2").attr("src", img[1]);
        $("#TMICVTitle2").text(title[1]);
        $("#TMICVDate2").text(date[1]);
        $("#TMICVLink2").attr("href", video_link2);
        var html = "<li>" +
                    "<div class=\"TMICV01\">" +
                    "<div class=\"TMICVPic\">" +
                    "<a href=\"http://www.google.com.tw\" ><img src=\"" + img[0] + "\" width=\"250px\" \" /></a>" +
                    "</div>" +
                    "<div class=\"TMICVTitle\">" + title[0] + "</div>" +
                    "<div class=\"TMICVDate\">" + date[0] + "</div>" +
                    "</div>" +
                    "</li>" +
                    "<li>" +
                    "<div class=\"TMICV02\">" +
                    "<div class=\"TMICVPic\">" +
                    "<img src=\"" + img[1] + "\" width=\"250px\" \" />" +
                    "</div>" +
                    "<div class=\"TMICVTitle\">" + title[1] + "</div>" +
                    "<div class=\"TMICVDate\">" + date[1] + "</div>" +
                    "</div>" +
                    "</li>";
        //alert(html);
        //$("#TMICVArea_ul").append(html);
    })
    function prev() {
        if (video_now == 0) {
            if (len % 2 == 1) {
                //len-1,li.hie()
                video_prev1 = len - 1;
                video_link1 = './VideoPage.aspx?video=' + id[video_prev1];
                $("#TMICVPic1").attr("src", img[video_prev1]);
                $("#TMICVTitle1").text(title[video_prev1]);
                $("#TMICVDate1").text(date[video_prev1]);
                $("#TMICVLink1").attr("href", video_link1);
                $("#li2").hide();
                video_now = len - 1;
            } else
            {
                video_prev1 = len - 2;
                video_prev2 = len - 1;
                video_link1 = './VideoPage.aspx?video=' + id[video_prev1];
                video_link2 = './VideoPage.aspx?video=' + id[video_prev2];
                $("#li2").show();
                $("#TMICVPic1").attr("src", img[video_prev1]);
                $("#TMICVTitle1").text(title[video_prev1]);
                $("#TMICVDate1").text(date[video_prev1]);
                $("#TMICVLink1").attr("href", video_link1);
                $("#TMICVPic2").attr("src", img[video_prev2]);
                $("#TMICVTitle2").text(title[video_prev2]);
                $("#TMICVDate2").text(date[video_prev2]);
                $("#TMICVLink2").attr("href", video_link2);
                video_now = len - 2;
            }
        }else {
            video_prev1 = video_now - 2;
            video_prev2 = video_now - 1;
            video_link1 = './VideoPage.aspx?video=' + id[video_prev1];
            video_link2 = './VideoPage.aspx?video=' + id[video_prev2];
            $("#li2").show();
            $("#TMICVPic1").attr("src", img[video_prev1]);
            $("#TMICVTitle1").text(title[video_prev1]);
            $("#TMICVDate1").text(date[video_prev1]);
            $("#TMICVLink1").attr("href", video_link1);
            $("#TMICVPic2").attr("src", img[video_prev2]);
            $("#TMICVTitle2").text(title[video_prev2]);
            $("#TMICVDate2").text(date[video_prev2]);
            $("#TMICVLink2").attr("href", video_link2);
            video_now = video_prev1;
        }
    }
    function next() {
        console.log(video_now + ':' + len);

        if (video_now + 2 == len - 1) {
            video_now = video_now + 2;
            video_link1 = './VideoPage.aspx?video=' + id[video_now];
            $("#TMICVPic1").attr("src", img[video_now]);
            $("#TMICVTitle1").text(title[video_now]);
            $("#TMICVDate1").text(date[video_now]);
            $("#TMICVLink1").attr("href", video_link1);
            $("#li2").hide();
        }
        else if (video_now + 2 < len - 1) {
            $("#li2").show();
            video_now = video_now + 2;
            video_next2 = video_now + 1;
            video_link1 = './VideoPage.aspx?video=' + id[video_now];
            video_link2 = './VideoPage.aspx?video=' + id[video_next2];
            $("#TMICVPic1").attr("src", img[video_now]);
            $("#TMICVTitle1").text(title[video_now]);
            $("#TMICVDate1").text(date[video_now]);
            $("#TMICVLink1").attr("href", video_link1);
            $("#TMICVPic2").attr("src", img[video_next2]);
            $("#TMICVTitle2").text(title[video_next2]);
            $("#TMICVDate2").text(date[video_next2]);
            $("#TMICVLink2").attr("href", video_link2);
        }
        else if (video_now * 2 >= len)
        {
            video_now = 0;
            $("#li2").show();
            video_link1 = './VideoPage.aspx?video=' + id[0];
            video_link2 = './VideoPage.aspx?video=' + id[1];
            $("#TMICVPic1").attr("src", img[0]);
            $("#TMICVTitle1").text(title[0]);
            $("#TMICVDate1").text(date[0]);
            $("#TMICVLink1").attr("href", video_link1);
            $("#TMICVPic2").attr("src", img[1]);
            $("#TMICVTitle2").text(title[1]);
            $("#TMICVDate2").text(date[1]);
            $("#TMICVLink2").attr("href", img[video_prev2]);
        }
    }
</script>
<div class="PageTMICVideoArea" id="MRVideoArea" runat="server">
    <div class="PageTMICVTitle"></div>
    <div class="PageTMICVContent">
        <div class="TMICVArea">
            <input type="hidden" id="video_id_temp" class="video_id_temp" runat="server" />
            <input type="hidden" id="video_title_temp" class="video_title_temp" runat="server" />
            <input type="hidden" id="video_date_temp" class="video_date_temp" runat="server" />
            <input type="hidden" id="video_img_temp" class="video_img_temp" runat="server" />
            <ul>
                <li id="li1">
                    <div class="TMICV01">
                    <div class="TMICVPic">
                        <a href="" id="TMICVLink1" target="_blank"><img id="TMICVPic1" width="250px" /></a></div>
                    <div class="TMICVTitle"><div id="TMICVTitle1" style="height:15px;width:260px;overflow:hidden;display:block;white-space:nowrap;text-overflow:ellipsis;"></div></div>
                    <div class="TMICVDate"><span id="TMICVDate1"></span></div>
                    </div>
                </li>
                <li id="li2">
                    <div class="TMICV02">
                    <div class="TMICVPic">
                        <a href="" id="TMICVLink2" target="_blank"><img id="TMICVPic2" width="250px" /></a></div>
                    <div class="TMICVTitle"><div id="TMICVTitle2"  style="height:15px;width:260px;overflow:hidden;display:block;white-space:nowrap;text-overflow:ellipsis;"></div></div>
                    <div class="TMICVDate"><span id="TMICVDate2"></span></div>
                    </div>
                </li>
            </ul>
        </div>
        <input type="button" class="TMICVLeftBtn" onclick="prev();" />
        <input type="button" class="TMICVRightBtn" onclick="next();" />
        <%--<uc1:tmicvpager runat="server" id="TMICVpager" />--%>
    </div>
</div>
