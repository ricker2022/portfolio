<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Mem_Status.aspx.vb" Inherits="member" %>

<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
             <div class="normalContent">
                <div class="normalTitle">個人狀態</div>
            <div id="memberInfo">
                <table id="memTbs" border="0" class="intro">
                    <tr>
                        <th>帳號</th>
                    </tr>
                    <tr>
                        <td>xinStars</td>
                    </tr>
                    <tr>
                        <th>暱稱</th>
                    </tr>
                    <tr>
                        <td>Nick</td>
                    </tr>
                    <tr>
                        <th>等級</th>
                    </tr>
                    <tr>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th>點數餘額</th>
                    </tr>
                    <tr>
                        <td>0</td>
                    </tr>
                    <tr>
                        <th>星幣餘額</th>
                    </tr>
                    <tr>
                        <td>2000</td>
                    </tr>
                    <tr>
                        <th>手機號碼</th>
                    </tr>
                    <tr>
                        <td>0988888888</td>
                    </tr>
                    <tr>
                        <th>信箱認證</th>
                    </tr>
                    <tr>
                        <td>xin@waninbank.com(已認證)</td>
                    </tr>
                </table>
            </div>
                 </div>
        </div>
    </div>
</asp:Content>

