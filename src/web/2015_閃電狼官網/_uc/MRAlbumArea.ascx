<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MRAlbumArea.ascx.cs" Inherits="_MRAlbumArea" %>
<%--<script type="text/javascript" src="js/jquery-1.10.2.js"></script>   
<script type="text/javascript" src="_js/jquery.min.js"></script>  --%>
<script type="text/javascript">
    var i = 0;
    var Album_timer_count = 0;
    var id_prev, id_now, id_next;
    var date_next;
    var img_next;
    var info_next;
    var id_string, id_arr, img_string, date_string, info_string, img_arr, date_arr, info_arr, arr_length;
    
    $(document).ready(function () {
        
        id_string = $('.id_string').val();
        img_string = $('.img_string').val();
        date_string = $('.date_string').val();
        info_string = $('.info_string').val();
        id_arr = id_string.split(",");
        img_arr = img_string.split(",");
        date_arr = date_string.split(",");
        info_arr = info_string.split(",");
        arr_length = img_arr.length;

        $("#MRAlbumdate").text(date_arr[0]);
        $("#Album_pic").attr("src", img_arr[0]);
        $("#MRAlbumInfo").text(info_arr[0]);       
        //$("#Album_link").attr("href", 'AlbumPage.aspx?album=' + id_arr[0] + '&page=1');
        //$("#Album_link").attr("target", "_blank");
        $(".album_id").val(id_arr[0]);
        相簿輪播();

    });

    function 相簿輪播() {
        Album_timer_count++;
        if (Album_timer_count % 5 == 0) {
            Album_timer_count = 0;
            if (i + 1 == arr_length) {
                i = 0;
            } else {
                i++;
            }
            $("#MRAlbumdate").text(date_arr[i]);
            $("#Album_pic").attr("src", img_arr[i]);
            $("#MRAlbumInfo").text(info_arr[i]);            
            //$("#Album_link").attr("href", 'AlbumPage.aspx?album=' + id_arr[i] + '&page=1');
            //$("#Album_link").attr("target", "_blank");
            $(".album_id").val(id_arr[i]);
        }
        timeout = setTimeout("相簿輪播()", 1000);
    }
    function prev_相簿() {
        Album_timer_count = 0;
        if (i == 0) // 如果下一個是1，目前就是0，上一個就會是最後一個。
        {
            i = arr_length - 1;
        } else {
            i = i - 1;
        }
        $("#MRAlbumdate").text(date_arr[i]);
        $("#Album_pic").attr("src", img_arr[i]);
        $("#MRAlbumInfo").text(info_arr[i]);
        //$("#Album_link").attr("href", 'AlbumPage.aspx?album=' + id_arr[i] + '&page=1');
        //$("#Album_link").attr("target", "_blank");
        $(".album_id").val(id_arr[i]);
    }
    function next_相簿() {
        Album_timer_count = 0;
        if (i == arr_length - 1) // 如果是最後1個，下一個就會是第1個。
        {
            i = 0;
        } else {
            i = i + 1;
        }
        $("#MRAlbumdate").text(date_arr[i]);
        $("#Album_pic").attr("src", img_arr[i]);
        $("#MRAlbumInfo").text(info_arr[i]);
        //$("#Album_link").attr("href", 'AlbumPage.aspx?album=' + id_arr[i] + '&page=1');
        //$("#Album_link").attr("target", "_blank");
        $(".album_id").val(id_arr[i]);
    }
    function 寫入相簿瀏覽次數_點擊相簿() {
        $('.按鈕_寫入相簿瀏覽次數').click();
    }
</script>

<div class="AlbumArea" id="MRAlbumArea" runat="server">
    <div class="MRAlbumTitle"></div>
    <div style="display:none;">
           <input id="album_id" class="album_id" type="hidden" runat="server" />
           <asp:Button ID="按鈕_寫入相簿瀏覽次數" runat="server" Text="Button" OnClick="按鈕_寫入相簿瀏覽次數Click" CssClass="按鈕_寫入相簿瀏覽次數" />
    </div>
    <div class="AlbumContent">
        <input type="hidden" value="" runat="server" id="id_string" class="id_string" />
        <input type="hidden" value="" runat="server" id="img_string" class="img_string" />
        <input type="hidden" value="" runat="server" id="date_string" class="date_string" />
        <input type="hidden" value="" runat="server" id="info_string" class="info_string" />
        <div class="AlbumPic">
            <%--<a id="Album_link" href="">--%>
                <img id="Album_pic" class="Album_pic" src="_img/empty.png" width="222" onclick="寫入相簿瀏覽次數_點擊相簿()" style="cursor:pointer" />
            <%--</a>--%>
        </div>
        <%--<input type="button" class="AlbumLeftBtn" onclick="move('prev')" />
        <input type="button" class="AlbumRightBtn" onclick="move('next')" />--%>
        <input type="button" class="AlbumLeftBtn" style="cursor:pointer;" onclick="prev_相簿()" />
        <input type="button" class="AlbumRightBtn" style="cursor:pointer;" onclick="next_相簿()" />
        <div class="MRAlbumInfo" id="MRAlbumInfo" style= "height:15px;width:300px;overflow:hidden;display:block;white-space:nowrap;text-overflow:ellipsis;">111LOL香港電子競技大賽全面壓倒性勝利的比賽噢</div>          
        <div class="MRAlbumdate" id="MRAlbumdate">1111-09-16</div> 
    </div>
</div>
