<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TMICVpager.ascx.cs" Inherits="UI_component_pagerController" %>

<style>
/*分頁按鈕*/
.pagerUI a{
    display:inline-block;
    text-align:center;
    margin:0 6px;
    cursor:pointer;
    font-family:新細明體,MS PMincho;
    line-height:12px;
    font-size:12px;
}
.pagerUI li{
    float:left;
}
.page1st{
    color:#535353;
}
.page1st:hover{
    color:#1e67ac;
}

.pagePrev{
    color:#535353;
}
.pagePrev:hover{
    color:#1e67ac;
}
.pageNext{
    color:#535353;
}
.pageNext:hover{
    color:#1e67ac;
}
.pageLast{
    color:#535353;
}
.pageLast:hover{
    color:#1e67ac;
}
.pageNum{
    color:#535353;
}
.pageNum:hover{
    color:#1e67ac;
}
</style>
<div class="pagerUI" style="text-align:center">
    <ul style="display: inline-block;">
        <li><a class="page1st">第一頁</a></li>
        <li><a class="pagePrev">上一頁</a></li>
        <li><a class="pageNum">1</a></li>
        <li><a class="pageNum">2</a></li>
        <li><a class="pageNum">3</a></li>
        <li><a class="pageNum">4</a></li>
        <li><a class="pageNum">5</a></li>
        <li><a class="pageNum">6</a></li>
        <li><a class="pageNum">7</a></li>
        <li><a class="pageNum">8</a></li>
        <li><a class="pageNum">9</a></li>
        <li><a class="pageNext">下一頁</a></li>
        <li><a class="pageLast">最終頁</a></li>
    </ul>
</div>
