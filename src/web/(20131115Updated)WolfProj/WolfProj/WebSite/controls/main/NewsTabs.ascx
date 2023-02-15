<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsTabs.ascx.cs" Inherits="controls_main_NewsTabs" %>

<%-- <script>
    //$(function () {
    //    $("#tabs").tabs();
    //});
    $(function () {
        $("#tabs").tabs({
            beforeLoad: function (event, ui) {
                ui.jqXHR.error(function () {
                    ui.panel.html(
                    "Empty");
                });
            }
        });
    });
</script>--%>

<div id="Stabs">
    <%-- <ul>
        <li><a href="#racecontent">SF</a></li>
        <li><a href="#www.esports.com.tw/schedule_kr_2013.php">KR</a></li>
        <li><a  "http://www.esports.com.tw/schedule_kr_2013.php?krid=1">SCII</a></li>
        <li><a href="http://www.esports.com.tw/schedule_kr_2013.php?krid=1">LOL</a></li>
        <li><a href="http://www.esports.com.tw/schedule_kr_2013.php?krid=1">WOT</a></li>
    </ul>
    --%>
    <div id="racecontent" runat="server">
       
    </div>

</div>
