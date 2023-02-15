<%@ Page Title="Lucky Table" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ENmobile._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        $(function () {
            var gamesNum = $("#CasionGames").find("li").length -2 ;
            //console.log(gamesNum);                 
            var deviceW = window.innerWidth;
            $("#comSoon, #comSoon1").hide();
            if (deviceW > 992) {
                if ((gamesNum % 3) == 1) {
                    $("#comSoon, #comSoon1").show();
                } else if ((gamesNum % 3) == 2) {
                    $("#comSoon1").show();
                }
            } else {
                if ((gamesNum % 2) == 1) {
                    $("#comSoon1").show();
                }
            };      
        });
    </script>
    <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10 col-xs-12 titleSet">
        <img class="img-responsive" src="Content/_img/Promotions_titleBG.png" />
    </div>

    <%--silder--%>
    <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10 col-xs-12">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div id="imagegallery" class="carousel-inner" role="listbox">
                <div class="item active">
                    <a href="javascript:void(0);">
                        <img src="Content/_img/banner.jpg" width="990" height="480">
                    </a>
                </div>
                <div class="item">
                    <a href="javascript:void(0);">
                        <img src="Content/_img/banner.jpg" width="990" height="480">
                    </a>
                </div>
                <div class="item">
                    <a href="javascript:void(0);">
                        <img src="Content/_img/banner.jpg" width="990" height="480">
                    </a>
                </div>
                <div class="item">
                    <a href="javascript:void(0);">
                        <img src="Content/_img/banner.jpg" width="990" height="480">
                    </a>
                </div>
                <div class="item">
                    <a href="javascript:void(0);">
                        <img src="Content/_img/banner.jpg" width="990" height="480">
                    </a>
                </div>
            </div>
            <!-- Left and right controls -->
            <a id="prev" class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="arrowLeft" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a id="next" class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="arrowRight" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10 col-xs-12 titleSet_gc">
        <img class="img-responsive" src="Content/_img/CasionGame_titleBG.png" />
    </div>

    <div id="CasionGames">
         <ul>
            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                <div class="new"><img class="img-responsive" src="Content/_img/games/new.png" /></div>
                <img class="img-responsive" src="Content/_img/games/Pandora.png" /></li>
            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                <div class="hot"><img class="img-responsive" src="Content/_img/games/hot.png" /></div>
                <img class="img-responsive" src="Content/_img/games/Robinhood.png" /></li>
            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6"><img class="img-responsive" src="Content/_img/games/Pirate.png" /></li>
            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6"><img class="img-responsive" src="Content/_img/games/LiaoZhai.png" /></li>
            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6"><img class="img-responsive" src="Content/_img/games/Sicbo.png" /></li>
            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6"><img class="img-responsive" src="Content/_img/games/BlackJack.png" /></li>
            <li id="comSoon" class="col-lg-4 col-md-4 col-sm-6 col-xs-6"><img class="img-responsive" src="Content/_img/games/ComeSoon.png" /></li>
            <li id="comSoon1" class="col-lg-4 col-md-4 col-sm-6 col-xs-6"><img class="img-responsive" src="Content/_img/games/ComeSoon.png" /></li>       
        </ul>
    </div>
</asp:Content>
