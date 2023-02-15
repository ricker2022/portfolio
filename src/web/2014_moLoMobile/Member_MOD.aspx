<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Member_MOD.aspx.vb" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">會員專區</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDPWtitle">帳號設定</div>
            <div class="IDMODsectitle">目前登入模式</div>
            <div class="IDMODseccontent">一般登入</div>
            <div class="IDMODthirdtitle">修改登入模式</div>
            <div class="IDMODSelect">
                <div class="IDMODSelectItems">
                    <input id="Radio1" name="radios" type="radio" /><label for="Radio1">一般模式<span></span></label></div>
                <div class="IDMODSelectItems">
                    <input id="Radio2" name="radios" type="radio" /><label for="Radio2">通訊模式<span></span></label></div>
            </div>

            <a href="#" class="IDMODStoredMailBtn">儲存</a>
            <a href="#" class="IDMODCancelBtn">取消</a>
        </div>
    </div>
</asp:Content>

