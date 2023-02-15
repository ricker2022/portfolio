<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Member_MOD.aspx.vb" Inherits="en_Member_MOD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Member Area</div>
    <div id="main">
        <div class="IDArea">
            <div class="IDPWtitle">My Account</div>
            <div class="IDMODsectitle">Current Login model：</div>
            <div class="IDMODseccontent">Normal mode</div>
            <div class="IDMODthirdtitle">Change Login model：</div>
            <div class="IDMODSelect">
                <div class="IDMODSelectItems">
                    <input id="Radio1" name="radios" type="radio" /><label for="Radio1">Normal mode<span></span></label></div>
                <div class="IDMODSelectItems">
                    <input id="Radio2" name="radios" type="radio" /><label for="Radio2">Communication mode<span></span></label></div>
            </div>

            <a href="#" class="IDMODStoredMailBtn">Save</a>
            <a href="#" class="IDMODCancelBtn">Cancel</a>
        </div>
    </div>
</asp:Content>

