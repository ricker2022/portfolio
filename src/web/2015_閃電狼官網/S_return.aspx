<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="S_return.aspx.cs" Inherits="S_home" %>
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
                            <td style="text-align:left;"><span class="SLtabspan"><input id="Checkbox1" type="checkbox" />閃電狼圖T</span></td>
                            <td>白</td>
                            <td>M</td>
                            <td>2</td>
                            <td>199</td>
                            <td>199</td>
                            <td>199</td>
                        </tr>
                        <tr><td style="text-align:left;"><span class="SLtabspan"><input id="Checkbox2" type="checkbox" />閃電狼運動毛巾</span></td>
                            <td>紅</td>
                            <td>L</td>
                            <td>1</td>
                            <td>199</td>
                            <td>199</td>
                            <td>199</td>
                        </tr>
                        <tr>
                            <td style="text-align:left;"><span class="SLtabspan"><input id="Checkbox3" type="checkbox" />閃電狼運動杯</span></td>
                            <td>黑</td>
                            <td>M</td>
                            <td>1</td>
                            <td>199</td>
                            <td>199</td>
                            <td>199</td>
                        </tr>
                    </table>
                </div>
                <div class="SruteruReasonArea">
                <div class="SruternReasonTitle">退貨原因</div>
                <div class="SruternReasonContent">
                    <textarea id="TextArea1" cols="20" rows="2" class="SruternReasonContent"></textarea></div>
                </div>
                <div class="SruternDescriptionArea">
                <div class="SruternDescriptionTitle">退貨說明</div>
                <div class="SruternDescriptionContent">
                    <ul>
                        <li>1.退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明。</li>
                        <li>2.退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明。</li>
                        <li>3.退貨說明退貨說明退貨說明退貨說明退貨說明。</li>
                        <li>4.退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明退貨說明。</li>
                    </ul>
                </div>
                </div>
                <input id="Button1" type="button" value="button" class="SruternSubmitBtn" />
            </div>
        </div>
</asp:Content>

