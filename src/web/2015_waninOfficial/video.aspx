<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="video.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        var vodeoUrl = ['', 'https://www.youtube.com/embed/NCBFzoT8pds', 'https://www.youtube.com/embed/SYAdU_91cJc', 'https://www.youtube.com/embed/qQr1ed7ZygM'];

        $(function () {
            $("#video,#videoCloseBtn, .v1imghover, .v2imghover, .v3imghover").hide();

            $("#v1").click(function () { videoShow(1); });
            $("#v2").click(function () { videoShow(2); });
            $("#v3").click(function () { videoShow(3); });

            $(".vc01").mouseenter(function () {
                $('.v1img').hide();
                $('.v1imghover').show();
            });
            $(".vc01").mouseleave(function () {
                $('.v1img').show();
                $('.v1imghover').hide();
            });
            $(".vc02").mouseenter(function () {
                $('.v2img').hide();
                $('.v2imghover').show();
            });
            $(".vc02").mouseleave(function () {
                $('.v2img').show();
                $('.v2imghover').hide();
            });
            $(".vc03").mouseenter(function () {
                $('.v3img').hide();
                $('.v3imghover').show();
            });
            $(".vc03").mouseleave(function () {
                $('.v3img').show();
                $('.v3imghover').hide();
            });


            $("#videoCloseBtn,#videomask").click(function () {
                $("#video").attr('src', 'http://www.wanin.tw/').hide();
                $("#videoCloseBtn,#videomask").hide();
            });
        });

        function videoShow(no) {
            if (window.innerWidth >= 980 && window.innerWidth <= 1290) {
                window.open(vodeoUrl[parseInt(no)],"_new");
                return;
            }

            $("#video").attr('src', vodeoUrl[parseInt(no)]);
            $("#video").show();
            $("#videoCloseBtn,#videoFrame,#videomask").show();
        }
        window.onresize = function () {
            if (window.innerWidth <= 1290) {
                $("#videoCloseBtn").click();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">

        <section>
            <div id="pageTitle">影音專區</div>
            <div class="dContent pageBorder dCont980 dContMobile mainPageMargin">
                <div class="conConten conTxt">
                    <ul class="videoCon">
                        <li class="vc01">
                            <div class="pinkTitle">moLoSport 互動式娛樂健身車</div>
                            <div id="v1" class="videoImg">
                                <img class="v1img" src="_img/pages/intro/video/01.jpg" />
                                <img class="v1imghover" src="_img/pages/intro/video/01hover.jpg" />
                            </div>
                        </li>
                        <li class="vc02">
                            <div class="pinkTitle">moLoSport 操作介紹</div>
                            <div id="v2" class="videoImg">
                                <img class="v2img" src="_img/pages/intro/video/02.jpg" />
                                <img class="v2imghover" src="_img/pages/intro/video/02hover.jpg" />
                            </div>
                        </li>
                        <li class="vc03" style="margin-top: 40px;">
                            <div class="pinkTitle">網銀基金會 公益影片</div>
                            <div id="v3" class="videoImg">
                                <img class="v3img" src="_img/pages/intro/video/03.jpg" />
                                <img class="v3imghover" src="_img/pages/intro/video/03hover.jpg" />
                            </div>
                        </li>
                    </ul>
                    <div id="videoCloseBtn"></div>
                    <div id="videoFrame">
                        <iframe id="video" width="920" height="520" src="#" frameborder="0" allowfullscreen></iframe>
                    </div>

                    <ul class="videoConM">
                        <li class="vc01">
                            <div class="pinkTitle">moLoSport 互動式娛樂健身車</div>
                            <div id="vM01" class="videoImg">
                                <a href="https://www.youtube.com/embed/NCBFzoT8pds" target="_new">
                                    <img class="v1img img-responsive" src="_img/mobile/page/video01.jpg" />
                                    <img class="v1imghover img-responsive" src="_img/mobile/page/video01hover.jpg" />
                                </a>
                            </div>
                        </li>
                        <li class="vc02 videoConMmargin">
                            <div class="pinkTitle">moLoSport 操作介紹</div>
                            <div id="vM02" class="videoImg">
                                <a href="https://www.youtube.com/embed/SYAdU_91cJc" target="_new">
                                    <img class="v2img img-responsive" src="_img/mobile/page/video02.jpg" />
                                    <img class="v2imghover img-responsive" src="_img/mobile/page/video02hover.jpg" />
                                </a>
                            </div>
                        </li>
                        <li class="vc03 videoConMmargin">
                            <div class="pinkTitle">網銀基金會 公益影片</div>
                            <div id="vM03" class="videoImg">
                                <a href="https://www.youtube.com/embed/qQr1ed7ZygM" target="_new">
                                    <img class="v3img img-responsive" src="_img/mobile/page/video03.jpg" />
                                    <img class="v3imghover img-responsive" src="_img/mobile/page/video03hover.jpg" />
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
    <div id="videomask"></div>
</asp:Content>

