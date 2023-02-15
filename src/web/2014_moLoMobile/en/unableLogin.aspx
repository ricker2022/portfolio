<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="unableLogin.aspx.vb" Inherits="en_unableLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../_js/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <div class="ULtitle">
            <span style="font-size: 28px;">✕</span> If unable to login -
            <br />
            <span style="font-size: 20px; font-weight: bold; color: #636967; padding:0 0 0 26px; letter-spacing:-0.5px;">please select the issue that applies to you</span>
        </div>

        <div class="ULSelect">
            <div class="ULSelectItems">
                <input id="Radio1" name="radios" type="radio" checked="checked" value="r1" /><label for="Radio1">Forgot password<span></span></label>
            </div>
            <div class="ULSelectItems">
                <input id="Radio2" name="radios" type="radio" value="r2" /><label for="Radio2">Could not register<span></span></label>
            </div>
            <div class="ULS1Area">
                <div class="SelectClass">
                    <asp:DropDownList ID="Selecttype" runat="server" CssClass="SelectBg2">
                        <asp:ListItem Text="Country code " Value="no"></asp:ListItem>
                        <asp:ListItem Text="Taiwan" Value="tw" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="HongKong" Value="hk"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="PWLine"></div>
                <asp:Label ID="Label2" runat="server" Text="Label" class="ULScontent">Mobile Account</asp:Label>
                <div class="PWLine"></div>
                <div class="ULStip">Mobile phone number format error!</div>
                <a class="ULSBtn">Confirm</a>
            </div>
            <div class="ULS2Area" style="display: none;">
                <div class="ULS2tip">
                    If you cannot register in moLo the first time you register, please contact our customer service department to solve<br />
                    the problem.<br />
                    <br />
                    Our service time is<br />
                    from Monday to Sunday 24hr (UTC +8)<br />
                    <br />
                    Customer service E-mail: service@cs.waninbank.com
                </div>
            </div>
        </div>
    </div>
</asp:Content>

