<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RNewsArea.ascx.cs" Inherits="_uc_RNewsArea" %>

<div class="RNewsArea" id="RNewsArea" runat="server">
    <div class="RNewsTitle"></div>
    <div class="RNewsContent">
        <ul>
            <li>
                <div class="RNewsCTitle"><asp:Label ID="RNewsCTitle1" runat="server" Text=""></asp:Label></div>
                <div class="RNewsCPic">
                    <asp:Image ID="RNewsCPic1" runat="server" Width="128" /></div>
                <div class="RNewsCTime"><asp:Label ID="RNewsCTime1" runat="server" Text=""></asp:Label></div>
                <div class="RNewsCConent"><asp:Label ID="RNewsCConent1" runat="server" Text=""></asp:Label></div>
                <div class="RNewsCGameIcon">
                    <ul>
                        <asp:Image ID="RNewsCGameIcon1_1" CssClass="sGameIcon" runat="server" />
                        <asp:Image ID="RNewsCGameIcon1_2" CssClass="sGameIcon" runat="server" />
                        <asp:Image ID="RNewsCGameIcon1_3" CssClass="sGameIcon" runat="server" />
                    </ul>
                </div>
                <asp:HyperLink ID="RNewsCMoreBtn1" CssClass="RNewsCMoreBtn" runat="server"></asp:HyperLink>
                <%--<input type="button" class="RNewsCMoreBtn" />--%>
            </li>
            <li id="RNews1" runat="server">
                <div class="RNewsCTitle"><asp:Label ID="RNewsCTitle2" runat="server" Text=""></asp:Label></div>
                <div class="RNewsCPic">
                    <asp:Image ID="RNewsCPic2" runat="server" Width="128" /></div>
                <div class="RNewsCTime"><asp:Label ID="RNewsCTime2" runat="server" Text=""></asp:Label></div>
                <div class="RNewsCConent"><asp:Label ID="RNewsCConent2" runat="server" Text=""></asp:Label></div>
                <div class="RNewsCGameIcon">
                    <ul>
                        <asp:Image ID="RNewsCGameIcon2_1" CssClass="sGameIcon" runat="server" />
                        <asp:Image ID="RNewsCGameIcon2_2" CssClass="sGameIcon" runat="server" />
                        <asp:Image ID="RNewsCGameIcon2_3" CssClass="sGameIcon" runat="server" />
                    </ul>
                </div>
                <asp:HyperLink ID="RNewsCMoreBtn2" CssClass="RNewsCMoreBtn" runat="server"></asp:HyperLink>
            </li>       
        </ul>
    </div>
</div>
