<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_member.aspx.cs" Inherits="S_home" %>
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
            <div class="SmemberTitle">會員中心</div>
            <div class="SmemberContent">
                <ul class="SMCitem">
                    <li>會員帳號：0932-868686</li>
                    <li>中文姓名：<input id="Text1" type="text" class="SMCinput" style="width:256px;" /></li>
                    <li>手機號碼：<input id="Text2" type="text" class="SMCinput" style="width:256px;" /></li>
                    <li>電子郵件：<input id="Text3" type="text" class="SMCinput" style="width:256px;" /></li>
                    <li>聯絡地址：<select id="Select1" style="margin-right:6px;height:32px;"><option>請選擇縣市</option></select><select id="Select2" style="margin-right:6px;height:32px;"><option>請選擇區域</option></select>
                        <input id="Text4" type="text" class="SMCinput" style="width:65px;margin-right:6px;" /><input id="Text5" type="text" class="SMCinput" style="width:338px;" />
                    </li>
                </ul>
                <input id="Button1" type="button" value="button" class="SBtn_storeModify" />
            </div>
            <div class="SorderRecordTitle">訂單紀錄</div>
            <div class="SorderRecordContent">
                <table id="SorderRecordTab">
                    <tr>
                        <th>訂購日期</th>
                        <th>訂單編號</th>
                        <th>付款方式</th>
                        <th>處理進度</th>
                        <th>應付金額</th>
                        <th>訂單取消/退貨辦理</th>
                        <th>發票</th>
                    </tr>
                    <tr>
                        <td>2015-06-12</td>
                        <td><a class="SorderNum" href="#">123456789012</a></td>
                        <td>信用卡</td>
                        <td>已完成取件</td>
                        <td>1,100</td>
                        <td><a class="Sreturn" href="#">我要退貨</a></td>
                        <td>1234567899</td>
                    </tr>
                    <tr>
                        <td>2015-06-12</td>
                        <td><a class="SorderNum" href="#">123456789012</a></td>
                        <td>信用卡</td>
                        <td>已完成取件</td>
                        <td>1,100</td>
                        <td><a class="Sreturn" href="#">我要退貨</a></td>
                        <td>1234567899</td>
                    </tr>
                    <tr>
                        <td>2015-06-12</td>
                        <td><a class="SorderNum" href="#">123456789012</a></td>
                        <td>信用卡</td>
                        <td>已完成取件</td>
                        <td>1,100</td>
                        <td><a class="Sreturn" href="#">我要退貨</a></td>
                        <td>1234567899</td>
                    </tr>
                    <tr>
                        <td>2015-06-12</td>
                        <td><a class="SorderNum" href="#">123456789012</a></td>
                        <td>信用卡</td>
                        <td>已完成取件</td>
                        <td>1,100</td>
                        <td><a class="Sreturn" href="#">我要退貨</a></td>
                        <td>1234567899</td>
                    </tr>
                    <tr>
                        <td>2015-06-12</td>
                        <td><a class="SorderNum" href="#">123456789012</a></td>
                        <td>信用卡</td>
                        <td>已完成取件</td>
                        <td>1,100</td>
                        <td><a class="Sreturn" href="#">我要退貨</a></td>
                        <td>1234567899</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <uc1:pagerController runat="server" ID="pagerController" />
</asp:Content>

