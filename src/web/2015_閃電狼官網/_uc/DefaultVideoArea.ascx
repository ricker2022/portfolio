<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVideoArea.ascx.cs" Inherits="_DefaultVideoArea" %>
<script>
    var 影片批 = parseInt('<%=影片批%>');
    $(function () {        
        影片輪播();
        $('.DefaultVideoController_left').click(function () {
            var 目前影片批 = parseInt($('#影片批').val());
            if (目前影片批 > 1) {
                $('#影片批').val((目前影片批 - 1 > 0) ? 目前影片批 - 1 : 0);
                目前影片批 = $('#影片批').val();
                var position = (目前影片批 - 1) * 650;
                $('.DefaultVideoBox').animate({ left: -position + "px" });
                Video_timer_count = 0;
            }
        })
        $('.DefaultVideoController_right').click(function () {
            var 目前影片批 = parseInt($('#影片批').val());
            if (目前影片批 < 影片批) {
                $('#影片批').val((目前影片批 + 1 > 影片批) ? 影片批 : 目前影片批 + 1);
                目前影片批 = $('#影片批').val();
                var position = (目前影片批 - 1) * 650;
                $('.DefaultVideoBox').animate({ left: -position + "px" });
                Video_timer_count = 0;
            }
        })
        $('.DefaultVideoContent').hover(function () {
            $('.DefaultVideoController_left').fadeIn();
            $('.DefaultVideoController_right').fadeIn();
        }, function () {
            $('.DefaultVideoController_left').fadeOut();
            $('.DefaultVideoController_right').fadeOut();
        })
    })
    var Video_timer_count = 0;
    function 影片輪播() {
        Video_timer_count++;
        if (Video_timer_count % 3 == 0) {
            var 目前影片批 = parseInt($('#影片批').val());
            if (目前影片批 < 影片批 + 1) {
                $('#影片批').val((目前影片批 + 1 > 影片批) ? 1 : 目前影片批 + 1);
                目前影片批 = $('#影片批').val();
                var position = (目前影片批 - 1) * 650;
                $('.DefaultVideoBox').animate({ left: -position + "px" });
            }
        }
        timeout = setTimeout("影片輪播()", 1000);
    }
</script>
<asp:Panel ID="Panel1" runat="server">
    <div class="PageTMICVideoArea" id="MRVideoArea" runat="server">
        <div class="VideoTitle"></div>
        <div class="DefaultVideoContent" >
            <input type="hidden" id="影片批" value="1" />
            <div style="width:618px;height:250px;overflow:hidden;padding-left:8px;">
                <div class="DefaultVideoLeftBtn"><div class="DefaultVideoController_left DefaultVideoController" <%--style="width:60px;height:175px;background-color:rgba(255, 255, 255,0.5);left:0;z-index:10;position:absolute;"--%>><div <%-- style="background-image:url('_img/layout/blck-arrow-left.png');background-repeat:no-repeat;position:absolute;top:70px;left:20px;width:60px;height:60px;"--%>></div></div></div>
                <div class="DefaultVideoRightBtn"><div class="DefaultVideoController_right DefaultVideoController" <%--style="width:60px;height:175px;background-color:rgba(255, 255, 255,0.5);right:0;z-index:10;position:absolute;"--%>><div <%--style="background-image:url('_img/layout/blck-arrow-right.png');background-repeat:no-repeat;position:absolute;top:70px;right:-20px;width:60px;height:60px;"--%>></div></div></div>
                <div class="DefaultVideoBox" runat="server" id="DefaultVideoBox">
                    <ul id="DefaultVideoContent_ul">
                        <%=html %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Panel>