<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Serv_Qindex.aspx.vb" Inherits="Serv_Qindex" %>

<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">問題通報列表</div>

                <table id="Qtb1" runat="server" border="0" align="center" cellpadding="3" cellspacing="0" class="intro" style="position: absolute; visibility: hidden;">
                    <tr>
                        <td colspan="3" valign="middle" class="bgcolor_ccc">
                            <p class="square">發問時間：<span class="color_c00000">#</span></p>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">是否已回覆：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">伺服器名稱：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">遊戲暱稱：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">問題發生時間：</span></td>
                        <td class="bgcolor"><span class="color_c00000">#</span></td>
                    </tr>
                    <tr>
                        <td width="30%" align="right" valign="middle" class="bgcolor_ccc">問題、狀況描述：</td>
                        <td width="70%" class="bgcolor" valign="middle">
                            <img src="_img/test.jpg" alt="" align="right" /><br />
                            #
                        </td>
                    </tr>
                </table>
                <p>&nbsp;</p>
                <table id="Qtb2" runat="server" border="0" align="center" cellpadding="3" cellspacing="0" class="intro" style="position: absolute; visibility: hidden;">
                    <tr>
                        <td colspan="3" valign="middle" class="bgcolor_ccc">
                            <p class="square">發問時間：<span class="color_c00000">#</span></p>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">是否已回覆：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">伺服器名稱：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">遊戲暱稱：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">問題發生時間：</span></td>
                        <td class="bgcolor"><span class="color_c00000">#</span></td>
                    </tr>
                    <tr>
                        <td width="30%" align="right" valign="middle" class="bgcolor_ccc">問題、狀況描述：</td>
                        <td width="70%" class="bgcolor">
                            <img src="_img/test.jpg" alt="" align="right" /><br />
                            #
                        </td>
                    </tr>
                </table>
                <p>&nbsp;</p>
                <table id="Qtb3" runat="server" border="0" align="center" cellpadding="3" cellspacing="0" class="intro" style="position: absolute; visibility: hidden;">
                    <tr>
                        <td colspan="3" valign="middle" class="bgcolor_ccc">
                            <p class="square">發問時間：<span class="color_c00000">#</span></p>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">是否已回覆：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">伺服器名稱：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">遊戲暱稱：</span></td>
                        <td class="bgcolor"><span>#</span></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle" class="bgcolor_ccc"><span class="bgcolor_ccc">問題發生時間：</span></td>
                        <td class="bgcolor"><span class="color_c00000">#</span></td>
                    </tr>
                    <tr>
                        <td width="30%" align="right" valign="middle" class="bgcolor_ccc">問題、狀況描述：</td>
                        <td width="70%" class="bgcolor">
                            <img src="_img/test.jpg" alt="" align="right" /><br />
                            #
                        </td>
                    </tr>
                </table>
                <table id="Plist" runat="server" class="pageList">
                    <tr></tr>
                </table>



            </div>

        </div>

    </div>
</asp:Content>

