<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FB.ascx.cs" Inherits="FB" %>

<div class="mainLeftFB">
    <div id="showFB" class="showSwitcher" style="margin-left: 0px; display: none;">
        <i class="fa fa-facebook" style="color:white;font-size:20pt;"></i>
    </div>
    <%--<div class="mainLeftFBContent">--%>
        <i id="close_fb" class="fa fa-remove" style="color:white;float:right;margin-top:-27px;margin-right:10px;cursor:pointer;position:relative;top:35px;z-index:200"></i>
        <div class="fb-page" data-href="https://www.facebook.com/FlashWolves" data-width="204" data-height="500" data-hide-cover="false" data-show-facepile="false" data-show-posts="true">
            <div class="fb-xfbml-parse-ignore">
                <blockquote cite="https://www.facebook.com/FlashWolves">
                    <a href="https://www.facebook.com/FlashWolves">《Flash Wolves》閃電狼職業電競隊</a>
                </blockquote>
            </div>
        </div>
    <div id="fb-root"></div>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.3";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
   </script>
       <%-- <div id="fb-root">
            <asp:Image ID="Image1" runat="server" ImageUrl="../_img/layout/fb_fan.jpg" /><i id="close_fb" class="fa fa-remove" style="color:white;float:right;margin-top:-27px;margin-right:10px;cursor:pointer;"></i>
            <iframe src="//www.facebook.com/plugins/likebox.php?href=https://zh-tw.facebook.com/FlashWolves;width=204&amp;height=400&amp;colorscheme=light&amp;show_faces=false&amp;header=true&amp;stream=true&amp;show_border=true" scrolling="no" frameborder="0" style="border: none; overflow: hidden; height: 400px; width: 204px;" allowtransparency="true"></iframe>
        </div>--%>
    <%--</div>--%>
</div>




