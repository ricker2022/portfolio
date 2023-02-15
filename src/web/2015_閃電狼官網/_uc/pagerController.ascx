<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pagerController.ascx.cs" Inherits="UI_component_pagerController" %>

<style>
/*分頁按鈕*/
.pagerUI a{
    display:inline-block;
    text-align:center;
    /*margin:0 3px;*/
    margin:10px 2px 0 5px;
    cursor:pointer;
    font-family:'Microsoft JhengHei',MS PMincho;line-height:27px;
    font-size:12px;
}
.pagerUI li{
    float:left;
}
.page1st{
    background: url(_img/layout/pageBtn.png) no-repeat 0px 0px;
    width:59px;
    height:27px;
}
.page1st:hover{
    background: url(_img/layout/pageBtn.png) no-repeat 0px -27px;
}

.pagePrev{
    background: url(_img/layout/pageBtn.png) no-repeat -59px 0px;
    width:59px;
    height:27px;
}
.pagePrev:hover{
    background: url(_img/layout/pageBtn.png) no-repeat -59px -27px;
}
.pageNext{
    background: url(_img/layout/pageBtn.png) no-repeat -118px 0px;
    width:59px;
    height:27px;
}
.pageNext:hover{
    background: url(_img/layout/pageBtn.png) no-repeat -118px -27px;
}
.pageLast{
    background: url(_img/layout/pageBtn.png) no-repeat -177px 0px;
    width:59px;
    height:27px;
}
.pageLast:hover{
    background: url(_img/layout/pageBtn.png) no-repeat -177px -27px;
}
.pageNum{
    background: url(_img/layout/pageBtnN.png) no-repeat 0px 0px;
    width:27px;
    height:27px;
    color:#7f7f7f;
}
.pageNum:hover{
    background: url(_img/layout/pageBtnN.png) no-repeat 0px -27px;
}
.pageNum_down{
    background: url(_img/layout/pageBtnN.png) no-repeat 0px -54px;
    width:27px;
    height:27px;
    color:#ffffff;
}
</style>
<div class="pagerUI" style="text-align:center">
    <ul style="display: inline-block;">
   <%--     <li><a class="page1st"></a></li>
        <li><a class="pagePrev"></a></li>
        <li><a class="pageNum">1</a></li>
        <li><a class="pageNum">2</a></li>
        <li><a class="pageNum">3</a></li>
        <li><a class="pageNum">4</a></li>
        <li><a class="pageNum">5</a></li>
        <li><a class="pageNum">6</a></li>
        <li><a class="pageNum">7</a></li>
        <li><a class="pageNum">8</a></li>
        <li><a class="pageNum">9</a></li>
        <li><a class="pageNext"></a></li>
        <li><a class="pageLast"></a></li>--%>

        
        
        <li><asp:HyperLink ID="HyperLink_first" runat="server" class="page1st"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink_1st" runat="server" class="pagePrev"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink1" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink2" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink3" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink4" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink5" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink6" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink7" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink8" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink9" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink10" runat="server" class="pageNum"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink_next" runat="server" class="pageNext"></asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink_last" runat="server" class="pageLast"></asp:HyperLink></li>
    </ul>
</div>
