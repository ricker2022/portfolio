<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Partner02.aspx.vb" Inherits="en_Partner02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Partnership</div>
    <div id="main">
        <div class="Partner02Area">
            <div class="Partner02Items">
                <a class="P02I01" href="Partner01.aspx">Cooperate<br />with moLo</a>
                <a class="P02I02" href="Partner02.aspx">Partner area</a>
            </div>
            <div class="Partner02Content">
                <div class="P02IinfoTitle">My Service</div>
                <div class="P02IinfoContent">Exclusive Customization login system，free network and media resources，moLo is your best partner and welcome to join us！</div>
            </div>
            <a href="Partner02Add.aspx" class="P02ItemsBtn">Update Service</a>
            <div class="P02ServiceItems">
                <div class="P02SItitle">Current Service</div>
                <div class="P02SIcontent">No service!</div>
                <a href="#" class="P02ItemsBtn" style="display:none;">遊戲滿屋</a>
                <a href="#" class="P02ItemsBtn" style="display:none;">遊戲庫</a>
                <a href="#" class="P02ItemsBtn" style="display:none;">moLo 領航員</a>
            </div>
        </div>
    </div>
</asp:Content>

