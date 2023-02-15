<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchArea.ascx.cs" Inherits="_SearchArea" %>

<div class="SearchArea">
    <div>
        <ul>
            <li>
                <div class="SearchClass">
                    <asp:DropDownList ID="searchtype" runat="server" CssClass="searchBg2">
                        <asp:ListItem Text="選手" Value="player"></asp:ListItem>
                        <asp:ListItem Text="新聞" Value="news"></asp:ListItem>
                        <asp:ListItem Text="影片" Value="video"></asp:ListItem>
                        <asp:ListItem Text="相簿" Value="album"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </li>
        </ul>
    </div>
    <div class="SearchContent">
        <asp:TextBox ID="TextBox1" runat="server" class="SearchText" ></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="" class="SearchBtn" OnClick="Button1_Click" />
    </div>
</div>
