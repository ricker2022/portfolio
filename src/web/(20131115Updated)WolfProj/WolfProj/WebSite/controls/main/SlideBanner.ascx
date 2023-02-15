<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SlideBanner.ascx.cs" Inherits="controls_main_SlideBanner" %>
<link href="../../_css/bjqs.css" rel="stylesheet" />
<script src="../../_js/bjqs-1.3.js"></script>
    <!--  Outer wrapper for presentation only, this can be anything you like -->
    <div id="banner-slide" >
        <!-- start Basic Jquery Slider -->
   
          <%--     <ul class="bjqs"><li><a href="#"><img src="../../_img/navBanner/banner01.jpg" title="Automatically generated caption 1" alt="" /></a></li>
            <li><a href="#"><img src="../../_img/navBanner/banner02.jpg" title="Automatically generated caption 2" alt="" /></a></li>
            <li><a href="#"><img src="../../_img/navBanner/banner03.jpg" title="Automatically generated caption 3" alt="" /></a></li>
            <li><a href="#"><img src="../../_img/navBanner/banner01.jpg" title="Automatically generated caption 4" alt="" /></a></li>
            <li><a href="#"><img src="../../_img/navBanner/banner02.jpg" title="Automatically generated caption 5" alt="" /></a></li>  </ul>--%>
      
        <!-- end Basic jQuery Slider -->

    </div>
    <!-- End outer wrapper -->

    <script class="secret-source">
       
        $(document).ready(function () {
           

                $.get('http://localhost:49984/CalendarEvent.aspx?banner=t', function (data) {
                    $("#banner-slide").html(data);
                    //alert($("#banner-slide").html());
                    $('#banner-slide').bjqs({
                        height: 262,
                        width: 346,
                        responsive: true,
                        randomstart: true
                    });

                });
         
        });

</script>
<div id="container2">

</div>
