<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Mem_ModifyTradingPw.aspx.vb" Inherits="Mem_ModifyTradingPw" %>

<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        input
        {
            display:block;
            width:80%;
            height:30px;
            font-size:15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">變更交易密碼</div>
            
            <table id="memMTPTbs" border="0" class="intro">
                <tr>
                    <th valign="middle">舊交易密碼：</th>
                </tr>
                <tr>

                    <td style="text-align:left; padding:10px 20px;">
                        <asp:TextBox ID="tOldPw" runat="server"></asp:TextBox><br />
                        若您<span class="color_c00000">『未』</span>申請過交易密碼，則<span class="color_c00000">「不用」</span>輸入<span class="color_c00000">「舊」</span>交易密碼
                    直接在<span class="color_c00000">「新交易密碼」</span>處設定您想設定的密碼即可</td>
                </tr>
                <tr>
                    <th>新交易密碼：</th>
                </tr>
                <tr>

                    <td valign="middle" style="text-align:left;padding:10px 20px;">
                        <asp:TextBox ID="tNewPw" runat="server"></asp:TextBox><br />交易密碼格式為半型英數字(4~12位數)</td>
                </tr>
                <tr>
                    <th valign="middle">確認新交易密碼：</th>
                </tr>
                <tr>

                    <td valign="middle" style="text-align:left;padding:10px 20px;">
                        <asp:TextBox ID="tcNewPw" runat="server"></asp:TextBox><br />
                        (再輸入一次新交易密碼)
                        <br />
                        設定完後請按<span class="color_c00000">「變更密碼」</span>即完成申請。</td>
                </tr>
                <tr>
                    <td valign="middle" colspan="2" style="padding:10px 0">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn">變更密碼</asp:LinkButton></td>
                </tr>
            </table>
                </div>
        </div>
    </div>
</asp:Content>

