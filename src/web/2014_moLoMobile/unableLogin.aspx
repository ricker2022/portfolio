<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="unableLogin.aspx.vb" Inherits="unableLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="_js/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <div class="ULtitle"><span style="font-size: 28px;">✕</span> 無法登入- <span style="font-size: 20px; font-weight: bold; color: #636967;">請選擇無法登入狀況</span></div>

        <div class="ULSelect">
            <div class="ULSelectItems">
                <input id="Radio1" name="radios" type="radio" checked="checked" value="r1" /><label for="Radio1">忘記密碼<span></span></label>
            </div>
            <div class="ULSelectItems">
                <input id="Radio2" name="radios" type="radio" value="r2" /><label for="Radio2">門號無法註冊<span></span></label>
            </div>
            <div class="ULS1Area">
                <div class="SelectClass">
                    <asp:DropDownList ID="Selecttype" runat="server" CssClass="SelectBg2">
                        <asp:ListItem Text="請選擇國家/地區" Value="no"></asp:ListItem>
                        <asp:ListItem Text="台灣" Value="tw" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="香港" Value="hk"></asp:ListItem>
                        <asp:ListItem Text="馬來西亞" Value="my"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="PWLine"></div>
                <asp:Label ID="Label2" runat="server" Text="Label" class="ULScontent">請輸入手機門號</asp:Label>
                <div class="PWLine"></div>
                <div class="ULStip">手機門號格式錯誤!</div>
                <a class="ULSBtn">確認</a>
            </div>
            <div class="ULS2Area" style="display: none;">
                <div class="ULS2tip">
                    若第一次使用moLo而無法註冊時，<br />
                    請洽客服中心協助處理：<br />
                    <br />
                    客服信箱：service@cs.waninbank.com<br />
                    客服專線：04-27085191<br />
                    傳真號碼：04-24525191<br />
                    服務時間：週一至週日 24hr
                </div>
            </div>
        </div>
    </div>
</asp:Content>

