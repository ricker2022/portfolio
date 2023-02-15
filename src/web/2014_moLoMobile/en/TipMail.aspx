<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="TipMail.aspx.vb" Inherits="en_TipMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="TipTitle">Personal Data Security</div>
        <div class="TipContent">
            Please click the link in your set E-mail<br />
            to finish setting up your account.<br />
            If you have any problem, please<br />
            contact the <a href="Service.aspx">Help Center</a>
        </div>

        <div class="YellowArea">
            <div class="YTitle">Didn't get the email?</div>
            <div class="YContent">Check your spam folder to make sure it didn't end up there. If you have any problem, please contact the help Center.</div>
        </div>
    </div>
</asp:Content>

