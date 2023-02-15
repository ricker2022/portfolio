<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_orderList.aspx.cs" Inherits="S_home" %>
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
            <div class="SorderNumTxt">您的訂單編號為：<span style="color:#7d0000;">150606076621</span></div>
            <input id="Button1" type="button" value="button" class="SbackOrderListBtn" />
            <div class="SorderListContent">
                <div class="SorderListTitle">購物明細</div>
                <div class="SorderListTab">
                    <table id="SLtab">
                        <tr>
                            <th style="width:310px;text-align:left; padding-left:65px;">商品名稱</th>
                            <th>顏色</th>
                            <th>尺寸</th>
                            <th>數量</th>
                            <th>單價</th>
                            <th>折扣價</th>
                            <th>小計</th>
                        </tr>
                        <tr>
                            <td style="text-align:left;"><span class="SLtabspan SOLspan">閃電狼圖T</span></td>
                            <td>白</td>
                            <td>M</td>
                            <td>2</td>
                            <td>199</td>
                            <td>199</td>
                            <td>199</td>
                        </tr>
                        <tr><td style="text-align:left;"><span class="SLtabspan SOLspan">閃電狼運動毛巾</span></td>
                            <td>紅</td>
                            <td>L</td>
                            <td>1</td>
                            <td>199</td>
                            <td>199</td>
                            <td>199</td>
                        </tr>
                        <tr>
                            <td style="text-align:left;"><span class="SLtabspan SOLspan">閃電狼運動杯</span></td>
                            <td>黑</td>
                            <td>M</td>
                            <td>1</td>
                            <td>199</td>
                            <td>199</td>
                            <td>199</td>
                        </tr>
                        <tr>
                            <td style="text-align:left;"><span class="SLtabspan SOLspan"></span></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="color:#7d0000;">訂單金額總計</td>
                            <td style="color:#7d0000;">3,600</td>
                        </tr>
                    </table>
                </div>
                <div class="SorderProcessingStatus">訂單處理狀態 :成功</div>
                <div class="SLogisticsStatus">物流狀態 : 處理中</div>
                <div class="SPayWay">付款方式 : 信用卡刷卡</div>
                <div class="SReceiverInfoArea">
                    <div class="SReceiverInfoTitle">收件資訊 :</div>
                    <div class="SReceiverInfoContent">寄送地址：407 台中市市政北二路668號6樓<br />收件人：閃電狼</div>
                </div>
                <div class="SInvoiceArea">
                    <div class="SInvoiceTitle">發票資訊 :</div>
                    <div class="SInvoiceContent">發票類型：二聯式電子發票<br />
                        受買人：<br />
                        <a class="SEInvoiceIntro" href="#">電子發票說明</a>，依據「電子發票實施作業要點」開立</div>
                </div>
                </div>
            </div>
        </div>
</asp:Content>

