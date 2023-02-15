<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Mem_Account.aspx.vb" Inherits="Mem_Account" %>

<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">會員帳號</div>
                <table id="tbs" runat="server" border="0" align="center" cellpadding="7" cellspacing="1" class="intro">
                    <tr>
                        <th width="20%" align="left" valign="middle">項次</th>
                        <th width="50%" align="left" valign="middle">暱 稱</th>
                        <th width="30%" align="left" valign="middle">登入</th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

