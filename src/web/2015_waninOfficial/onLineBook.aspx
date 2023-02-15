<%@ Page Language="C#" AutoEventWireup="true" CodeFile="onLineBook.aspx.cs" Inherits="onLineBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="_css/popBox.css" rel="stylesheet" />
    <script>
        $(function () {

            $(".hotDiv a").bind("click", function () {
                var imgUrl = $(this).children().attr("src");
                $("#bigImg img").attr("src", imgUrl);
                clearStyle();
                $(this).css("border", "3px #00b0ff solid");
                $(this).children().css("width", "214px");
                $(this).children().css("height", "144px");
            });

            $(".hotDiv a:first").css("border", "3px #00b0ff solid");
            $(".hotDiv img:first").css("width", "214px");
            $(".hotDiv img:first").css("height", "144px");
            for (a = 0; a < 5 ; a++) {
                lazyImg(a);
            }
            function lazyImg(item) {
                $('.bookImg').eq(item).attr('src', $('.bookImg').eq(item).attr('lazy'));
            }

        });

        function clearStyle() {
            $(".hotDiv a").each(function () {
                $(this).removeAttr('style');
                $(this).children().removeAttr('style');
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <div class="photoBar">
        <ul>
            <li style="width:29px"></li>
            <li id="bigImg" runat="server">
                                
            </li>
            <li style="vertical-align:top">
                <a id="closeB" href="javascript:closePop()" class="closeB" style="margin-top:0"></a>
                <a id="zoomB" href="javascript:zoomB()" class="zoomB"></a>
            </li>
         </ul>
        <ul>
            <li><a class="preB" href="javascript:preB()"></a></li>
            <li class="gameHot">
                <div style="width:100%; overflow: hidden; position:relative; height:170px;">
                    <ul class="hotDiv" runat="server" id="bookUl">
                    </ul>
                </div>
            </li>
            <li style="width:45px"><a href="javascript:nextB()" class="nextB"></a></li>
         </ul>
    </div>
    </form>
</body>
</html>
