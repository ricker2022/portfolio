<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="onMobileLineBook.aspx.cs" Inherits="onMobileLineBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="_js/jquery.lazyload.js"></script>
    <script type="text/javascript">
        $(function () {
            $('img').lazyload();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">

        <section>
            <div id="pageTitle">網銀季刊</div>
            <div class="dContent pageBorder dCont980 dContMobile">
                <div class="conConten conTxt">
                    <div id="bookImg" runat="server">

                    </div>
                </div>
            </div>
        </section>
    </div>


</asp:Content>

