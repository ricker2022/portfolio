<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_shoppingStep.aspx.cs" Inherits="S_home" %>
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
            <div class="SproductShoppingStepArea">
                <ul style="height:97px;">
                    <li><img src="_img/Shopping/layout/SproductShoppingStep01_select.png" /></li>
                    <li><img src="_img/Shopping/layout/SproductShoppingStep02.png" /></li>
                    <li><img src="_img/Shopping/layout/SproductShoppingStep03.png" /></li>
                    <li style="margin-right:0px;"><img src="_img/Shopping/layout/SproductShoppingStep04.png" /></li>
                </ul>
            </div>
            <div class="SproductShoppingStepContent">
                <ul>
                    <li id="STATE01" style="display:block;">
                        <table id="Stab01">
                            <tr>
                                <th style="text-align:left;width:390px;">商品資訊</th>
                                <th>顏色</th>
                                <th>尺寸</th>
                                <th>數量</th>
                                <th>原價</th>
                                <th>折扣價</th>
                                <th style="width:40px;">刪除</th>
                            </tr>
                            <tr>
                                <td><span class="SproductTabpic"><img src="_img/Shopping/product/Sproductitem01.png" /></span><span class="SproductTabname">商品名稱商品名稱商品名稱商品名稱商品名稱....</span></td>
                                <td>黑</td>
                                <td>F</td>
                                <td><input id="Text1" type="text" value="1" style="width:60px;text-align:center;height:30px;" /></td>
                                <td>$1100</td>
                                <td>$660</td>
                                <td><input id="Button1" type="button" value="button" class="SproductDeleteBtn" /></td>
                            </tr>
                            <tr>
                                <td><span class="SproductTabpic"><img src="_img/Shopping/product/Sproductitem01.png" /></span><span class="SproductTabname">商品名稱商品名稱商品名稱商品名稱商品名稱....</span></td>
                                <td>黑</td>
                                <td>F</td>
                                <td><input id="Text2" type="text" value="1" style="width:60px;text-align:center;height:30px;" /></td>
                                <td>$1100</td>
                                <td>$660</td>
                                <td><input id="Button2" type="button" value="button" class="SproductDeleteBtn" /></td>
                            </tr>
                            <tr>
                                <td><span class="SproductTabpic"><img src="_img/Shopping/product/Sproductitem01.png" /></span><span class="SproductTabname">商品名稱商品名稱商品名稱商品名稱商品名稱....</span></td>
                                <td>黑</td>
                                <td>F</td>
                                <td><input id="Text3" type="text" value="1" style="width:60px;text-align:center;height:30px;" /></td>
                                <td>$1100</td>
                                <td>$660</td>
                                <td><input id="Button3" type="button" value="button" class="SproductDeleteBtn" /></td>
                            </tr>
                            <tr>
                                <td style="border:0;height:46px;"></td>
                                <td style="border:0;height:46px;"></td>
                                <td style="border:0;height:46px;"></td>
                                <td style="border:0;height:46px;"></td>
                                <td style="border:0;height:46px;color:#265476;">總計</td>
                                <td style="border:0;height:46px;color:#265476;">$3600</td>
                                <td style="border:0;height:46px;"></td>
                            </tr>
                        </table>
                        <input id="Button4" type="button" value="button" class="ScontinueShoppingBtn" /><input id="Button5" type="button" value="button" class="ScheckoutBtn" />
                    </li>
                    <li id="STATE02" style="display:none;">
                        <ul class="S2BLOCK">
                            <li class="S2Title">收件資料</li>
                            <li class="S2Content"><span>姓名：<input id="Text4" type="text" style="width:290px;height:30px;" /></span><span style="margin-left:40px;">手機號碼：<input id="Text5" type="text" style="width:290px;height:30px;" /></span></li>
                            <li class="S2Content">電子郵件：<input id="Text6" type="text" style="width:674px;height:30px;" /></li>
                            <li class="S2Content">收件地址：<select id="Select1" style="margin-right:6px;height:32px;"><option>請選擇縣市</option></select><select id="Select2" style="margin-right:6px;height:32px;"><option>請選擇區域</option></select>
                                <input id="Text7" type="text" class="SMCinput" style="width:65px;margin-right:6px;" /><input id="Text8" type="text" class="SMCinput" style="width:399px;" />
                            </li>
                        </ul>
                        <ul class="S2BLOCK" style="border:none;">
                            <li class="S2Title">發票資訊</li>
                            <li class="S2Content"><span><input id="Radio1" type="radio" />捐贈發票</span><span style="margin-left:46px;"><input id="Radio2" type="radio" />二聯式電子發票</span><span style="margin-left:46px;"><input id="Radio3" type="radio" />三聯式電子發票</span></li>
                            <li class="S2Content"><span style="float:left;display:block;"><span style="letter-spacing:6.5px;">愛心碼</span>：<input id="Text9" type="text" style="width:224px;height:27px;" /></span><span style="float:left;display:block;margin-left:10px;margin-top:8px;"><input id="Button6" type="button" value="查詢愛心碼" class="S2blockBtn" /></span></li>
                            <li class="S2Content" style="clear:both;"><span style="float:left;display:block;">手機載具：<input id="Text10" type="text" style="width:224px;height:27px;" /></span><span style="float:left;display:block;margin-left:10px;margin-top:8px;"><input id="Button7" type="button" value="手機載具說明" class="S2blockBtn"  /></span><span style="font-size:14px;margin-left:18px;">※若您持有手機載具，請【點選填寫】載具條碼。</span></li>
                            <li class="S2Content">抬頭名稱：<input id="Text11" type="text" style="width:224px;height:27px;" /></li>
                            <li class="S2Content">統編號碼：<input id="Text12" type="text" style="width:224px;height:27px;" /></li>
                            <input id="Button8" type="button" value="button" class="ScontinueShoppingBtn" /><input id="Button9" type="button" value="button" class="ScheckoutBtn" />
                        </ul>
                    </li>
                   <li id="STATE03" style="display:none;">
                       <ul class="S2BLOCK">
                           <li class="S2Title">付款方式</li>
                           <li class="S2Content"><span><input id="Radio4" type="radio" />便利商店代碼繳費</span><span style="margin-left:46px;"><input id="Radio5" type="radio" />webatm</span><span style="margin-left:46px;"><input id="Radio6" type="radio" />信用卡付費</span></li>
                       </ul>
                       <ul class="S2BLOCK" style="border:none;">
                           <li class="S2Title">付款與寄件說明</li>
                           <li>
                               <ul class="S3note">
                                   <li>1. 商品結帳後統一以郵局掛號寄送，運費含掛號及包裝費用。</li>
                                   <li>2. 如須是用郵局存局後領，請在備註欄註明，若住處或公司不方便收件可自行到郵局取貨。</li>
                                   <li>3. 選擇銀行ATM付款:將產生一組虛擬帳號，提供多家銀行轉帳，虛擬帳好的繳費期限為三天。</li>
                                   <li>4. 商品結帳後統一以郵局掛號寄送，運費含掛號及包裝費用。</li>
                                   <li>5. 如須是用郵局存局後領，請在備註欄註明，若住處或公司不方便收件可自行到郵局取貨。</li>
                                   <li>6. 選擇銀行ATM付款:將產生一組虛擬帳號，提供多家銀行轉帳，虛擬帳好的繳費期限為三天。</li>
                               </ul>
                           </li>
                       </ul>
                       <input id="Button10" type="button" value="button" class="ScontinueShoppingBtn" /><input id="Button11" type="button" value="button" class="ScheckoutBtn" />
                   </li>
                    <li id="STATE04" style="display:none;">
                        <ul class="S2BLOCK">
                            <li class="S4txt">恭喜你已經成功訂購完成閃電狼的商品，以下為你的訂單資料：</li>
                            <li class="S4txt" style="font-size:16px;">您的訂單編號為:<span style="color:#7d0000;">150606076621</span></li>
                            <li>
                            <table id="Stab02">
                            <tr>
                                <th style="text-align:left;width:390px;">商品資訊</th>
                                <th>顏色</th>
                                <th>尺寸</th>
                                <th>數量</th>
                                <th>原價</th>
                                <th>折扣價</th>
                            </tr>
                            <tr>
                                <td><span class="SproductTabpic"><img src="_img/Shopping/product/Sproductitem01.png" /></span><span class="SproductTabname">商品名稱商品名稱商品名稱商品名稱商品名稱....</span></td>
                                <td>黑</td>
                                <td>F</td>
                                <td><input id="Text13" type="text" value="1" class="SproductTabNum" /></td>
                                <td>$1100</td>
                                <td>$660</td>
                            </tr>
                            <tr>
                                <td><span class="SproductTabpic"><img src="_img/Shopping/product/Sproductitem01.png" /></span><span class="SproductTabname">商品名稱商品名稱商品名稱商品名稱商品名稱....</span></td>
                                <td>黑</td>
                                <td>F</td>
                                <td><input id="Text14" type="text" value="1" class="SproductTabNum" /></td>
                                <td>$1100</td>
                                <td>$660</td>
                            </tr>
                            <tr>
                                <td><span class="SproductTabpic"><img src="_img/Shopping/product/Sproductitem01.png" /></span><span class="SproductTabname">商品名稱商品名稱商品名稱商品名稱商品名稱....</span></td>
                                <td>黑</td>
                                <td>F</td>
                                <td><input id="Text15" type="text" value="1" class="SproductTabNum" /></td>
                                <td>$1100</td>
                                <td>$660</td>
                            </tr>
                        </table>
                                <p class="S4sumArea"><span class="S4spantitle">總計</span><span class="S4spanprice">$3600</span></p>
                            </li>
                        </ul>
                    <ul>
                    <li class="S4introTitle" style="border-bottom:1px #b5b5b5 solid;">付款方式 : 信用卡刷卡</li>
                    <li>
                        <ul style="border-bottom:1px #b5b5b5 solid;padding-bottom:5px;">
                            <li class="S4introTitle">收件資訊 :</li>
                            <li class="S4introContent">寄送地址：台中市市政北二路668號6樓</li>
                            <li class="S4introContent">收件人：閃電狼</li>
                        </ul>
                        <ul>
                            <li class="S4introTitle">發票資訊 :</li>
                            <li class="S4introContent">發票類型：二聯式電子發票</li>
                            <li class="S4introContent">受買人：</li>
                            <li class="S4introContent"><span style="color:#1d2088;text-decoration:underline;"><a href="#">電子發票說明</a></span>，依據「電子發票實施作業要點」開立</li>
                        </ul>
                    </li>
                    </ul>
                    </li>
                    <li id="STATE05" style="display:none;">
                        <ul>
                            <li class="S5txt" style="display:block;margin:90px 0 40px 0;">訂購發生錯誤，請在數分鐘後再次嘗試。<br />
                                或與客服連絡：<a style="color:#1d2088;text-decoration:underline;" href="mailto:flashwolves2013@gmail.com">flashwolves2013@gmail.com</a></li>
                            <li style="display:table;margin:0 auto 200px auto;"><input id="Button12" type="button" value="button" class="S5backHomeBtn" /></li>
                        </ul>
                    </li>
                </ul>
            </div>
            </div>
        </div>
</asp:Content>

