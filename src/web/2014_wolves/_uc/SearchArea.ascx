<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchArea.ascx.cs" Inherits="_uc_SearchArea" %>

<div class="SearchArea">
    <div>
        <ul>
            <li>
                <div class="SearchClass">
                    <asp:DropDownList ID="searchtype" runat="server" CssClass="searchBg2">
                        <asp:ListItem Text="選手" Value="people"></asp:ListItem>
                        <asp:ListItem Text="新聞" Value="news" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="影片" Value="vedio"></asp:ListItem>
                        <asp:ListItem Text="相簿" Value="album"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </li>
        </ul>
    </div>
    <div class="SearchContent">
        <input type="text" class="SearchText" />
        <input type="button" class="SearchBtn" />
    </div>
</div>
