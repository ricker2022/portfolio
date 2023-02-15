<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopLogo.ascx.cs" Inherits="_TopLogo" %>
<style>
    .TopLogo_div {
        position:absolute;
        top:0;
        width:600px;
    }
</style>
<script>
    var now_div = 0;
    var div_count = 0;
    var Logo_timer_count = 0;
    var TopLogo_div_id = '';
    $(function () {
        var html = $('.TopLogotemp').val();
        $('#TopLogo_main').append(html);
        div_count = $('.TopLogo_div').length;
        TopLogo_div_id = '#TopLogo_div' + now_div.toString();
        $(TopLogo_div_id).fadeIn();
        now_div++;
        Logo_Timer();
        //console.log(div_count);
    })

    function Logo_Timer() {
        Logo_timer_count++;
        //console.log('Logo_timer_count:' + Logo_timer_count);
        if (Logo_timer_count % 5 == 0) {
            //console.log(now_div);
            Logo_timer_count = 0;
            for (var i = 0; i < div_count; i++) {
                var div_id = '#TopLogo_div' + i.toString();
                $(div_id).fadeOut();
            }
            TopLogo_div_id = '#TopLogo_div' + now_div.toString();
            $(TopLogo_div_id).fadeIn();
            //console.log(TopLogo_div_id);
            if(now_div==div_count-1)
            {
                now_div = 0;
            }else
            {
                now_div++;
            }
        }
        setTimeout("Logo_Timer()", 1000);
    }   
</script>
<div id="TopLogo_main">
    <input type="hidden" id="TopLogotemp" class="TopLogotemp" runat="server" />
        <ul>
            <li style="background:url(_img/layout/Logo1.png) 0px 0px no-repeat;"><a href="#"></a></li>
            <li style="background:url(_img/layout/Logo2.png) 0px 0px no-repeat;"><a href="#"></a></li>
            <li style="background:url(_img/layout/Logo3.png) 0px 0px no-repeat;"><a href="#"></a></li>
        </ul>
</div>