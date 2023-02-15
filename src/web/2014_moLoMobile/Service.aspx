<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Service.aspx.vb" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="_JS/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">客服中心</div>
    <div id="main">
        <div class="ServiceArea">
            <div class="ServTitle">聯絡moLo</div>
            <div class="ServContent">
                <ul>
                    <li>
                        <div class="SCtitle">客服信箱：</div>
                        <div class="SCcontent">service@cs.waninbank.com</div>
                    </li>
                    <li>
                        <div class="SCtitle">客服專線：</div>
                        <div class="SCcontent">04-27085191</div>
                    </li>
                    <li>
                        <div class="SCtitle">傳真號碼：</div>
                        <div class="SCcontent">04-24525191</div>
                    </li>
                    <li>
                        <div class="SCtitle">服務時間：</div>
                        <div class="SCcontent">週一至週日 24hr</div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

