<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/_uc/BtnControl.ascx" TagPrefix="uc1" TagName="BtnControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="indexA">
            <img src="_img/index/index.png" /></div>

        <div class="indexTimer">
            <img src="_img/index/TimerBg.png" /></div>

        <uc1:BtnControl runat="server" ID="BtnControl" />
    </div>
</asp:Content>

