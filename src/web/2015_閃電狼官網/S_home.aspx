<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_home.aspx.cs" Inherits="S_home" %>
<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>
<%@ Register Src="~/_uc/SADbanner.ascx" TagPrefix="uc1" TagName="SADbanner" %>
<%@ Register Src="~/_uc/Smenu.ascx" TagPrefix="uc1" TagName="Smenu" %>
<%@ Register Src="~/_uc/pagerController.ascx" TagPrefix="uc1" TagName="pagerController" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="_css/Shopping.css" rel="stylesheet" />
    <link href="_css/Shopping_banner.css" rel="stylesheet" />
    <script src="js/jquery-1.11.0.js"></script>
    <script src="_js/SADbanner.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="pageBG"></div>
    <div id="topLogo" style="margin: 20px 0 0 425px;">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="pagemain" style="height:auto;">
        <div id="Smenu">
            <%--選單--%>
            <uc1:Smenu runat="server" id="Smenu1" />
        </div>
        <div id="SADslider">
            <%--輪播圖--%>
            <uc1:SADbanner runat="server" id="SADbanner" />
        </div>
        <div id="Smain">
            <div id="Sleft">
                <ul>
                    <li class="SLtitle">最新商品 & 現貨</li>
                    <li><a href="#">最新商品最新商品最新最新商品最新商品最新</a></li>
                    <li><a href="#">前期上架</a></li>
                    <li><a href="#">春裝現貨</a></li>
                    <li><a href="#">春裝熱銷預購</a></li>
                    <li><a href="#">1 + 1 優惠</a></li>
                </ul>
                <ul>
                    <li class="SLtitle">優惠 & 活動</li>
                    <li><a href="#">秋冬特賣6折起</a></li>
                    <li><a href="#">現貨</a></li>
                    <li><a href="#">免運</a></li>
                    <li><a href="#">大推!暢銷熱賣</a></li>
                </ul>
            </div>
            <div id="Sright">
                <ul id="SRproducts">
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                    <li>
                        <ul class="Sicon">
                            <li><img src="_img/Shopping/layout/hoticon.png" /></li>
                            <li><img src="_img/Shopping/layout/newicon.png" /></li>
                        </ul>
                        <div class="SproductPic"><img src="_img/Shopping/product/p01.jpg" />
                        </div>
                        <div class="SproductName">閃電狼隊服短T</div>
                        <div class="SproductPrice">$.160</div>
                        <div class="Scolor"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div style="margin-left:150px;">
    <uc1:pagerController runat="server" ID="pagerController" /></div>
</asp:Content>

