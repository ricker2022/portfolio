<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ADBanner.ascx.cs" Inherits="ADBanner" %>
<script>
    var ADBanner_div_count = 0;
    var ADBanner_timer_count = 0;
    var ADBanner_div_id = '';
    $(function () {
        var html = $('.AD_Banner_temp').val();
        $("#slider_AD").append(html);
        ADBanner_div_count = $('.ADBanner_div').length;
        var random = Math.floor((Math.random() * ADBanner_div_count) + 0);
        ADBanner_div_id = '#ADBanner_div' + random.toString();
        $(ADBanner_div_id).fadeIn();
        ADBanner輪播();
    })
    function ADBanner輪播() {
        ADBanner_timer_count++;
        if (ADBanner_timer_count % 5 == 0) {
            ADBanner_timer_count = 0;
            for (var i = 0; i < ADBanner_div_count; i++) {
                var ADBanner_div_id = '#ADBanner_div' + i.toString();
                $(ADBanner_div_id).fadeOut();
            }
            var random = Math.floor((Math.random() * ADBanner_div_count) + 0);
            ADBanner_div_id = '#ADBanner_div' + random.toString();
            $(ADBanner_div_id).fadeIn();                      
        }
        //console.log(ADBanner_now_div);
        timeout = setTimeout("ADBanner輪播()", 1000);
    }
</script>
<input type="hidden" id="AD_Banner_temp" class="AD_Banner_temp" runat="server" />
<input type="hidden" id="AD_Banner_count" class="AD_Banner_count" runat="server" />
<%--<input type="hidden" id="AD_link_temp" class="AD_link_temp" runat="server" />
<input type="hidden" id="AD_img_temp" class="AD_img_temp" runat="server" />--%>
<div id="sliderFrame_AD" runat="server">
    <div id="slider_AD" style="overflow:hidden;width:315px;height:180px;margin-bottom:20px;">
    <%--    <a id="AD_link" href=""><img src="uploads/ad/1.png" /></a>
        <img src="uploads/ad/2.png" />
        <img src="uploads/ad/3.png" />
        <img src="uploads/ad/4.png" />--%>
    </div>
</div>
