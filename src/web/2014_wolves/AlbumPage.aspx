<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AlbumPage.aspx.cs" Inherits="News" %>

<%@ Register Src="~/_uc/TopLogo.ascx" TagPrefix="uc1" TagName="TopLogo" %>
<%@ Register Src="~/_uc/pagerController.ascx" TagPrefix="uc1" TagName="pagerController" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pageBG"></div>
    <div id="topLogo" style="margin: 20px 0 0 425px;">
        <uc1:TopLogo runat="server" ID="TopLogo1" />
    </div>
    <div id="pagemain">
        <div class="PageAlubmAllArea">
            <div class="PageAlbumAllTop">
                <div class="PageAATitle">測試字元測試字元測試字元測試字元測試字元測試字元</div>
                <div class="PageAADate">2014/10/22 10:30</div>
                <input type="button" class="PageAAMoreBtn" />
            </div>
            <div class="PageAAContent">
                <ul>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>

                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>

                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>

                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>

                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                    <li><img src="_img/Media/PageAlbumPic.png" /></li>
                </ul>
            </div>
            <uc1:pagerController runat="server" ID="pagerController" />
        </div>
        <div class="MainLeftArea">
            <!--↓↓FB留言區↓↓-->
            <div class="PageNewsFBArea" style="border:none;">
                <div class="PageNewsFBTitle"></div>
                <div class="PageNewsFBContent"></div>
            </div>
        </div>

        <div class="MainRightArea">
            <!--↓↓廣告區↓↓-->
            <div class="ADBanner">
                <ul>
                    <li>
                        <img src="_img/layout/AD/01.jpg" /></li>
                </ul>
            </div>
        </div>
    </div>

</asp:Content>

