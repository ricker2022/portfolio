<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AboutEven.ascx.cs" Inherits="_AboutEven" %>
<meta name="description" content="Content Timeline HTML5/jQuery plugin">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href="_uc/TimeLine/css/flat.css" rel="stylesheet" type="text/css" />
<link href="_uc/TimeLine/css/style.css" rel="stylesheet" type="text/css" />
<%--<link href="css/lightbox.css" rel="stylesheet" type="text/css" />--%>
<link href="_uc/TimeLine/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]>
<link href="css/ie8fix.css" rel="stylesheet" type="text/css" />
<![endif]-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="_uc/TimeLine/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="_uc/TimeLine/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="_uc/TimeLine/js/jquery.timeline.js"></script>
<script type="text/javascript" src="_uc/TimeLine/js/image.js"></script>
<script type="text/javascript" src="_uc/TimeLine/js/lightbox.js"></script>
<div class="AboutEventsContent">
    <script>
$(window).load(function() {
    var html = $(".temp_html").val();
    $("#timeline_div").append(html);
    // light
    if (html != null) {
        $('.t2').timeline({
            openTriggerClass: '.read_more',
            startItem: '13/10/2014',
            closeText: 'x',
            closeItemOnTransition: true
        });
        $('.t2').on('ajaxLoaded.timeline', function (e) {
            //console.log(e.element.find('.timeline_open_content span'));

            var height = e.element.height() - 60 - e.element.find('h2').height();
            e.element.find('.timeline_open_content span').css('max-height', height).mCustomScrollbar({
                autoHideScrollbar: true,
                theme: "light-thin"
            });
        });
    }
});	
</script>
    <input type="hidden" id="temp_html" class="temp_html" runat="server" />
<div id="timeline" runat="server">
<div class="timelineLoader" id="timelineLoader">
	<img src="_uc/TimeLine/images/timeline/loadingAnimation.gif" />
</div>
<!-- BEGIN TIMELINE -->    
<div class="timelineFlat t2" id="timeline_div" style="background-image:url('_uc/TimeLine/images/bg.jpg')">
       <%-- <div class="item" data-id="04/05/2012" data-description="Lorem ipsum">
            <img src="_uc/TimeLine/images/flat/default/1.jpg" alt=""/>
			<h2>MAY, 4</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="04/05/2012">Read more</div>
		</div>
		<div class="item_open" data-id="04/05/2012" data-access="_uc/TimeLine/content.aspx?page=10">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>--%>


<%--		<div class="item" data-id="04/05/2012" data-description="Lorem ipsum">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/1.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/1.jpg" alt=""/>
			</a>
			<h2>MAY, 4</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="04/05/2012">Read more</div>
		</div>
		<div class="item_open" data-id="04/05/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="12/05/2012" data-description="Lorem ipsum dolor sit">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/2.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/2.jpg" alt=""/>
			</a>
			<div class="post_date">12<span>MAY</span></div>
			<h2>MAY, 12</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="12/05/2012">Read more</div>
		</div>
		<div class="item_open" data-id="12/05/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="21/06/2012" data-description="Lorem ipsum dolor">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/3.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/3.jpg" alt=""/>
			</a>
			<div class="post_date">21<span>JUN</span></div>
			<h2>JUNE, 21</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="21/06/2012">Read more</div>
		</div>
		<div class="item_open" data-id="21/06/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>


		<div class="item" data-id="27/06/2012" data-description="Lorem ipsum">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/4.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/4.jpg" alt=""/>
			</a>
			<div class="post_date">27<span>JUN</span></div>
			<h2>JUNE, 27</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="27/06/2012">Read more</div>
		</div>
		<div class="item_open" data-id="27/06/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		
		<div class="item" data-id="03/07/2012" data-description="Lorem ipsum dolor">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/5.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/5.jpg" alt=""/>
			</a>
			<div class="post_date">21<span>JUL</span></div>
			<h2>JULY, 3</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="03/07/2012">Read more</div>
		</div>
		<div class="item_open" data-id="03/07/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		
		
		<div class="item" data-id="13/07/2012" data-description="Lorem ipsum dolor">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/6.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/6.jpg" alt=""/>
			</a>
			<div class="post_date">13<span>JUL</span></div>
			<h2>JULY, 13</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="13/07/2012">Read more</div>
		</div>
		<div class="item_open" data-id="13/07/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="17/07/2012" data-description="Lorem ipsum dolor sit amet">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/7.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/7.jpg" alt=""/>
			</a>
			<div class="post_date">17<span>JUL</span></div>
			<h2>JULY, 17</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="17/07/2012">Read more</div>
		</div>
		<div class="item_open" data-id="17/07/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="25/07/2012" data-description="Lorem ipsum">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/8.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/8.jpg" alt=""/>
			</a>
			<div class="post_date">25<span>JUL</span></div>
			<h2>JULY, 25</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="25/07/2012">Read more</div>
		</div>
		<div class="item_open" data-id="25/07/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="06/08/2012" data-description="Lorem ipsum dolor">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/9.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/9.jpg" alt=""/>
			</a>
			<div class="post_date">6<span>AUG</span></div>
			<h2>AUGUST, 6</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="06/08/2012">Read more</div>
		</div>
		<div class="item_open" data-id="06/08/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="15/08/2012" data-name="August 15th" data-description="Lorem ipsum dolor sit">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/10.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/10.jpg" alt=""/>
			</a>
			<div class="post_date">15<span>AUG</span></div>
			<h2>AUGUST, 15</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="15/08/2012">Read more</div>
		</div>
		<div class="item_open" data-id="15/08/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="20/08/2012" data-description="Lorem ipsum">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/11.jpg" rel="lightbox[timeline]">
			<img src="_uc/TimeLine/images/flat/portfolio/11.jpg" alt=""/>
			</a>
			<div class="post_date">20<span>AUG</span></div>
			<h2>AUGUST, 20</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="20/08/2012">Read more</div>
		</div>
		<div class="item_open" data-id="20/08/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>
		
		<div class="item" data-id="26/08/2012" data-description="Lorem ipsum dolor">
			<a class="image_rollover_bottom con_borderImage" data-description="ZOOM IN" href="images/flat/portfolio/12.jpg" rel="lightbox[timeline]">
				<img src="_uc/TimeLine/images/flat/portfolio/12.jpg" alt=""/>
			</a>
			<div class="post_date">26<span>AUG</span></div>
			<h2>AUGUST, 26</h2>
			<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc...</span>
			<div class="read_more" data-id="26/08/2012">Read more</div>
		</div>
		<div class="item_open" data-id="26/08/2012" data-access="ajax-content-no-image.html">
			<div class="item_open_content">
				<img class="ajaxloader" src="_uc/TimeLine/images/timeline/loadingAnimation.gif" alt="" />
			</div>
		</div>--%>
</div> <!-- /END TIMELINE -->
    </div>
    <div id="no_data" runat="server" style="font-family:'Microsoft JhengHei';">目前沒有資料</div>
</div>
