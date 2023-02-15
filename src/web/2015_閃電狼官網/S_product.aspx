<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_product.aspx.cs" Inherits="S_home" %>
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
        <div id="Smain">
            <div id="Sleft" class="SLmargintop">
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
                <div id="SRtitle">商品分類 >> 上衣</div>
                <ul id="SRproductsPic">
                    <li id="SRproductMainpic"><img src="_img/Shopping/product/productMainpic.jpg" /></li>
                    <li>
                        <ul id="SRproductSecpic">
                            <li><a href="#"><img src="_img/Shopping/product/productSecpic01.jpg" /></a></li>
                            <li><a href="#"><img src="_img/Shopping/product/productSecpic01.jpg" /></a></li>
                            <li><a href="#"><img src="_img/Shopping/product/productSecpic01.jpg" /></a></li>
                            <li class="SRPSecpicLast"><a href="#"><img src="_img/Shopping/product/productSecpic01.jpg" /></a></li>
                        </ul>
                    </li>
                    <li><input id="Button5" type="button" value="button" class="SswitchTopBtn" /></li>
                    <li><input id="Button6" type="button" value="button" class="SswitchDownBtn" /></li>
                </ul>
                <ul id="SRproductinfo">
                    <li class="SRproductName">商品標題和價格18級字</li>
                    <li><span class="SRproductDiscountPrice">NT.930</span><span class="SRproductPrice">NT.1000</span></li>
                    <li class="SRproductColor">商品顏色  紫紅色</li>
                    <li>
                        <ul id="productsColorArea">
                            <li><span class="coloroutside_ae5da1"><span class="colorinside_ae5da1"></span></span></li>
                            <li><span class="coloroutside_b3d465"><span class="colorinside_b3d465"></span></span></li>
                            <li><span class="coloroutside_f19149"><span class="colorinside_f19149"></span></span></li>
                            <li><span class="coloroutside_448aca"><span class="colorinside_448aca"></span></span></li>
                            <li><span class="coloroutside_b28850"><span class="colorinside_b28850"></span></span></li>
                            <li><span class="coloroutside_8957a1"><span class="colorinside_8957a1"></span></span></li>
                            <li><span class="coloroutside_007130"><span class="colorinside_007130"></span></span></li>
                            <li><span class="coloroutside_000"><span class="colorinside_000"></span></span></li>
                            <li><span class="coloroutside_000"><span class="colorinside_fff"></span></span></li>
                        </ul>
                    </li>
                    <li style="clear:both;"><select id="Select1" style="height:26px;width:80px;"><option>F(尺碼)</option></select><select id="Select2" style="height:26px;width:80px; margin-left:8px;"><option>1</option></select><input id="Button1" type="button" value="button" class="SRproductAddCartBtn" /></li>
                    <li><input id="Button2" type="button" value="商品描述" class="SRproductsSelectBtn" /><input id="Button3" type="button" value="商品材質" class="SRproductsSelectBtn" /><input id="Button4" type="button" value="尺寸說明" class="SRproductsSelectBtn" /></li>
                    <li class="SRprodtuctxt">商品材質一行最多24字商品材質一行最多24字商品材質一行最多24字商品材質一行最多24商品材質一行最多24字商品材質一行最多24字商品材質一行最多24字字商品材質一行最多24字商品材質一行最多24字商品材質一行最多24字商品材質一行最多24字....</li> 
                </ul>
                <div id="SRproductBigPic"></div>
                <div id="SRproductRecommendArea">
                    <div class="SRpreductRecommendTitle">商品推薦</div>
                    <ul class="SRpreductRecommendContent">
                        <li><img src="_img/Shopping/product/pr01.jpg" /></li>
                        <li><img src="_img/Shopping/product/pr01.jpg" /></li>
                        <li><img src="_img/Shopping/product/pr01.jpg" /></li>
                        <li style="margin-right:0;"><img src="_img/Shopping/product/pr01.jpg" /></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

