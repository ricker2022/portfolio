<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_pop.aspx.cs" Inherits="S_pop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="_css/Shopping.css" rel="stylesheet" />
    <link href="_css/Shopping_banner.css" rel="stylesheet" />
    <script src="js/jquery-1.11.0.js"></script>
    <script src="_js/SADbanner.js"></script>
    <script src="_js/jquery.Cart_mCustomScrollbar.concat.js"></script>
    <script src="_js/mcs.js"></script>
    <link href="_css/ShoppingScrollbar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- 商品尺寸表 --%>
    <ul id="popupProductSizeTab" style="display:none;">
        <li class="popupProductSizeTabContent">
            <ul style="padding:33px 22px;">
                <li><span style="font-size:20px;">商品尺寸表</span><span style="font-size:14px;color:#265476;margin-left:24px;">*人工測量與實際尺寸略有誤差，誤差尺寸+2cm範圍內都是屬於正常範圍，並不屬於瑕疵。</span></li>
                <li>
                    <table id="popSizeTab">
                        <tr>
                            <td>單位CM</td>
                            <td>F</td>
                            <td>S</td>
                            <td>M</td>
                            <td>L</td>
                        </tr>
                        <tr>
                            <td>肩寬</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                        </tr>
                        <tr>
                            <td>領口</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                        </tr>
                        <tr>
                            <td>胸寬</td>
                            <td>41</td>
                            <td>41</td>
                            <td>41</td>
                            <td>41</td>
                        </tr>
                        <tr>
                            <td>臂寬</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                        </tr>
                        <tr>
                            <td>袖長</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                        </tr>
                        <tr>
                            <td>袖口寬</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                            <td>--</td>
                        </tr>
                        <tr>
                            <td>下擺寬</td>
                            <td>101</td>
                            <td>101</td>
                            <td>101</td>
                            <td>101</td>
                        </tr>
                        <tr>
                            <td>裙長</td>
                            <td>50</td>
                            <td>50</td>
                            <td>50</td>
                            <td>50</td>
                        </tr>
                    </table>
                </li>
                <li><p style="font-size:14px;margin-bottom:20px;">MOOEL資訊</p>
                    <p style="font-size:14px;line-height:30px;">小彤:身高/168 體重/48 鞋號:39(24.5) 32/25/34.5 褲子穿S(26-27，27居多)<br />
                        心宜:身高/164 體重/42 鞋號:36(23) 32/24/33.5 褲子穿S(26)</p>
                </li>
                <li><p style="font-size:14px;font-weight:bold;margin-top:42px;">#透光度(1不透→5超透)1  #厚度偏薄  #彈性無</p>
                    <p style="font-size:14px;line-height:30px;">(透光度1-2:試穿著狀況/商品顏色 可能須內搭，透光度:以上建議必須內搭)</p>
                </li>
            </ul>
        </li>
        <li><input id="Button4" type="button" value="button" class="popcloseBtn" /></li>
    </ul>

    <%-- 確認視窗 --%>
    <ul id="popupCheckbox" style="display:none;">
        <li class="popupCheckboxContent">
        <p style="padding:30px;font-size:16px;font-family:微軟正黑體;color:#000;line-height:26px;">
            已經收到您的退貨通知，請於近日將商品寄回至407 地址已經收到您的退貨通知，請於近日將商品寄回至407 地址.....
        </p>
        <input id="Button2" type="button" value="button" class="popSubmitBtn" />
        </li>
        <li><input id="Button1" type="button" value="button" class="popcloseBtn" /></li>
    </ul>


    <%-- 購物車 --%>
    <ul id="popupCart" style="display:block;">
        <li class="popCartTitle"></li>
        <li class="popCartTxt">你即將帶他們回家:</li>
        <li id="Cartcontent" class="Cart_index">
            <ul id="CartListBlock">
                <li>
                    <table id="popCartContentTab">
                        <tr>
                            <td class="popCartCTpic"><img src="_img/Shopping/product/popCartsproduct01.jpg" /></td>
                            <td class="popCartCTintro">
                                <p class="popCartCTintrop1">一二三四五六七八九十一二三四五六七</p>
                                <p class="popCartCTintrop2">紫紅     M     1</p>
                            </td>
                            <td class="popCartCTbtn"><input id="Button5" type="button" value="button" class="popCartDelBtn" /></td>
                        </tr>
                        <tr>
                            <td class="popCartCTpic"><img src="_img/Shopping/product/popCartsproduct01.jpg" /></td>
                            <td class="popCartCTintro">
                                <p class="popCartCTintrop1">一二三四五六七八九十一二三四五六七</p>
                                <p class="popCartCTintrop2">紫紅     M     1</p>
                            </td>
                            <td class="popCartCTbtn"><input id="Button6" type="button" value="button" class="popCartDelBtn" /></td>
                        </tr>
                        <tr>
                            <td class="popCartCTpic"><img src="_img/Shopping/product/popCartsproduct01.jpg" /></td>
                            <td class="popCartCTintro">
                                <p class="popCartCTintrop1">一二三四五六七八九十一二三四五六七</p>
                                <p class="popCartCTintrop2">紫紅     M     1</p>
                            </td>
                            <td class="popCartCTbtn"><input id="Button7" type="button" value="button" class="popCartDelBtn" /></td>
                        </tr>
                        <tr>
                            <td class="popCartCTpic"><img src="_img/Shopping/product/popCartsproduct01.jpg" /></td>
                            <td class="popCartCTintro">
                                <p class="popCartCTintrop1">一二三四五六七八九十一二三四五六七</p>
                                <p class="popCartCTintrop2">紫紅     M     1</p>
                            </td>
                            <td class="popCartCTbtn"><input id="Button8" type="button" value="button" class="popCartDelBtn" /></td>
                        </tr>
                        <tr>
                            <td class="popCartCTpic"><img src="_img/Shopping/product/popCartsproduct01.jpg" /></td>
                            <td class="popCartCTintro">
                                <p class="popCartCTintrop1">一二三四五六七八九十一二三四五六七</p>
                                <p class="popCartCTintrop2">紫紅     M     1</p>
                            </td>
                            <td class="popCartCTbtn"><input id="Button9" type="button" value="button" class="popCartDelBtn" /></td>
                        </tr>
                        <tr>
                            <td class="popCartCTpic"><img src="_img/Shopping/product/popCartsproduct01.jpg" /></td>
                            <td class="popCartCTintro">
                                <p class="popCartCTintrop1">一二三四五六七八九十一二三四五六七</p>
                                <p class="popCartCTintrop2">紫紅     M     1</p>
                            </td>
                            <td class="popCartCTbtn"><input id="Button10" type="button" value="button" class="popCartDelBtn" /></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </li>
        <li class="popCartTxt" style="float:right;margin-right:16px;">共6樣商品</li>
        <li class="popCartPriceTotal">NT.60,0000</li>
        <li><input id="Button3" type="button" value="button" class="popCartSubmitBtn" /></li>
        
    </ul>
    <div class="popmask"></div>
</asp:Content>

