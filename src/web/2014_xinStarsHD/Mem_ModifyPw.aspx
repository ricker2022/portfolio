<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Mem_ModifyPw.aspx.vb" Inherits="Mem_ModifyPw" %>
<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        input
        {
            display:block;
            width:80%;
            height:22px;
            font-size:15px;
            margin:0 auto;
        }
        th {
            border-radius:5px;
            width:40%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">修改登入密碼</div>
            
            <table id="memTbs" border="0" class="intro">
                        <tr>
                            <td class="color_c00000" style="border:0px #fff none; text-align:left;">
                                以下提供兩種方式，協助您重新設定密碼，在適合您的類型中進行密碼變更。<br />
                                (一)使用「身份證號」修改密碼<br />
                                (二)使用「提示問題」修改密碼(如果你只看見第一種方式，代表您當初並未設定提示問題。)<br />
                                請務必確認您填寫的資料是否正確，並注意提示訊息!!
                            </td>
                        </tr>
                    </table>
                    <h4 style="padding:0 20px;">(一)我要使用「身份證號」</h4>
                    <table id="memMPTbs1" border="0" class="intro">
                        <tr>
                                        <th align="right">帳號：</th>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="tAcc" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">暱稱：</th>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="tNick" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">新密碼：</th>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="tNewPw" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">確認密碼：</th>
                                        <td valign="middle" align="left">
                                            <asp:TextBox ID="tcNewPw" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">身份證號：</th>
                                        <td colspan="3" align="left" valign="middle">
                                            <asp:TextBox ID="tIDNO" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center" style="padding:10px 0;">
                                            <asp:LinkButton ID="ModifyPw1" runat="server" class="btn">變更密碼</asp:LinkButton>
                                        </td>
                                    </tr>
                    </table>
                    <h4 id="TQA" runat="server" style="padding:0 20px;">(二)我要使用「提示問題」</h4>
                    <table id="memMPTbs2" border="0" class="intro">
                                    <tr>
                                        <th align="right">提示問題：</th>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="tQtn" runat="server" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">提示答案：</th>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="tAns" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">設定密碼：</th>
                                        <td align="left" valign="middle">
                                            <asp:TextBox ID="tNewPw2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th align="right">確認密碼：</th>
                                        <td valign="middle" align="left">
                                            <asp:TextBox ID="tcNewPw2" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center" style="padding:10px 0;">
                                            <asp:LinkButton ID="ModifyPw2" runat="server" class="btn">變更密碼</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                </div>
            </div>
        </div>
</asp:Content>

