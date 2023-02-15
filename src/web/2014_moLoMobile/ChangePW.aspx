<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ChangePW.aspx.vb" Inherits="ChangePW" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="TipArea">別忘了立即提高您的帳號安全！<br />
            請您先變更密碼及E-mail並至個人信箱回點系統連結，驗證成功後即可使用完整的moLo服務。</div>
        <div class="PWtitle">密碼修改</div>
        <div class="PWnoTitle">moLo帳號：</div>
        <div class="PWno">09XXXXXXXX</div>
        <asp:Label ID="Label1" runat="server" Text="Label" class="PWcontent">新密碼</asp:Label>
        <div class="PWLine"></div>
        <div class="PWtip">*請輸入6-20碼英數字</div>

        <asp:Label ID="Label2" runat="server" Text="Label" class="PWcontent">再次輸入新密碼</asp:Label>
        <div class="PWLine"></div>
        <div class="PWtip">*請輸入6-20碼英數字</div>

        <asp:Label ID="Label3" runat="server" Text="Label" class="PWcontent">電子信箱</asp:Label>
        <div class="PWLine"></div>
        <div class="PWtip">*請輸入正確電子信箱</div>

        <div class="RedTip">順利通過E-mail資料驗證才能使用完整moLo服務</div>
        <a href="#" class="PWBtn">確認</a>
    </div> 
</asp:Content>

