<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultAlbumArea.ascx.cs" Inherits="_DefaultAlbumArea" %>
<%@ Register Src="~/_uc/TMICVpager.ascx" TagPrefix="uc1" TagName="TMICVpager" %>
<script>
    var 相簿批 = parseInt('<%=相簿批%>');
    $(function () {        
        相簿輪播();
        $('.DefaultAlbumController_left').click(function () {
            var 目前相簿批 = parseInt($('#相簿批').val());
            if (目前相簿批 > 1) {
                $('#相簿批').val((目前相簿批 - 1 > 0) ? 目前相簿批 - 1 : 0);
                目前相簿批 = $('#相簿批').val();
                var position = (目前相簿批 - 1) * 650;
                $('.DefaultAlbumBox').animate({ left: -position + "px" });
                Album_timer_count = 0;
            }
        })
        $('.DefaultAlbumController_right').click(function () {
            var 目前相簿批 = parseInt($('#相簿批').val());
            if (目前相簿批 < 相簿批) {
                $('#相簿批').val((目前相簿批 + 1 > 相簿批) ? 相簿批 : 目前相簿批 + 1);
                目前相簿批 = $('#相簿批').val();
                var position = (目前相簿批 - 1) * 650;
                $('.DefaultAlbumBox').animate({ left: -position + "px" });
                Album_timer_count = 0;
            }
        })
        $('.DefaultAlbumContent').hover(function () {
            $('.DefaultAlbumController_left').fadeIn();
            $('.DefaultAlbumController_right').fadeIn();
        }, function () {
            $('.DefaultAlbumController_left').fadeOut();
            $('.DefaultAlbumController_right').fadeOut();
        })
    })
    function 寫入相簿瀏覽次數_點擊相簿D(album) {
        $('.album_idD').val(album);
        $('.按鈕_寫入相簿瀏覽次數D').click();        
    }
    var Album_timer_count = 0;
    function 相簿輪播() {
        Album_timer_count++;
        if (Album_timer_count % 5 == 0) {
            var 目前相簿批 = parseInt($('#相簿批').val());
            if (目前相簿批 < 相簿批 + 1) {
                $('#相簿批').val((目前相簿批 + 1 > 相簿批) ? 1 : 目前相簿批 + 1);
                目前相簿批 = $('#相簿批').val();
                var position = (目前相簿批 - 1) * 650;
                $('.DefaultAlbumBox').animate({ left: -position + "px" });
            }
        }
        timeout = setTimeout("相簿輪播()", 1000);
    }
</script>
<style>
    .按鈕_寫入相簿瀏覽次數D{
        display:none;
    }
</style>
<asp:Panel ID="Panel1" runat="server">
    <div class="PageTMICVideoArea" id="MRAlbumArea" runat="server">
        <input id="album_idD" class="album_idD" type="hidden" runat="server" />
        <asp:Button ID="按鈕_寫入相簿瀏覽次數D" runat="server" Text="Button" OnClick="按鈕_寫入相簿瀏覽次數D_Click" CssClass="按鈕_寫入相簿瀏覽次數D" />
        <div class="AlbumTitle"></div>
        <div class="DefaultAlbumContent" >
            <input type="hidden" id="相簿批" value="1" />
            <div style="width:618px;height:250px;overflow:hidden;padding-left:8px;">
                <div class="DefaultAlbumLeftBtn"><div class="DefaultAlbumController_left DefaultAlbumController" <%--style="width:60px;height:175px;background-color:rgba(255, 255, 255,0.5);left:0;z-index:10;position:absolute;"--%>><div <%-- style="background-image:url('_img/layout/blck-arrow-left.png');background-repeat:no-repeat;position:absolute;top:70px;left:20px;width:60px;height:60px;"--%>></div></div></div>
                <div class="DefaultAlbumRightBtn"><div class="DefaultAlbumController_right DefaultAlbumController" <%--style="width:60px;height:175px;background-color:rgba(255, 255, 255,0.5);right:0;z-index:10;position:absolute;"--%>><div <%--style="background-image:url('_img/layout/blck-arrow-right.png');background-repeat:no-repeat;position:absolute;top:70px;right:-20px;width:60px;height:60px;"--%>></div></div></div>
                <div class="DefaultAlbumBox" runat="server" id="DefaultAlbumBox">
                    <ul id="DefaultAlbumContent_ul">
                        <%=html %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Panel>