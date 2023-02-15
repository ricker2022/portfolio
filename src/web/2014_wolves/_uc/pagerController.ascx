<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pagerController.ascx.cs" Inherits="UI_component_pagerController" %>

<style>
/*分頁按鈕*/
.pagerUI a{
    display:inline-block;
    text-align:center;
    /*margin:0 3px;*/
    margin:10px 2px 0 5px;
    cursor:pointer;
    font-family:新細明體,MS PMincho;line-height:27px;
    font-size:12px;
}
.pagerUI li{
    float:left;
}
.page1st{
    background: url(../_img/layout/pageBtn.png) no-repeat 0px 0px;
    width:59px;
    height:27px;
}
.page1st:hover{
    background: url(../_img/layout/pageBtn.png) no-repeat 0px -27px;
}

.pagePrev{
    background: url(../_img/layout/pageBtn.png) no-repeat -59px 0px;
    width:59px;
    height:27px;
}
.pagePrev:hover{
    background: url(../_img/layout/pageBtn.png) no-repeat -59px -27px;
}
.pageNext{
    background: url(../_img/layout/pageBtn.png) no-repeat -118px 0px;
    width:59px;
    height:27px;
}
.pageNext:hover{
    background: url(../_img/layout/pageBtn.png) no-repeat -118px -27px;
}
.pageLast{
    background: url(../_img/layout/pageBtn.png) no-repeat -177px 0px;
    width:59px;
    height:27px;
}
.pageLast:hover{
    background: url(../_img/layout/pageBtn.png) no-repeat -177px -27px;
}
.pageNum{
    background: url(../_img/layout/pageBtnN.png) no-repeat 0px 0px;
    width:27px;
    height:27px;
    color:#7f7f7f;
}
.pageNum:hover{
    background: url(../_img/layout/pageBtnN.png) no-repeat 0px -27px;
}
</style>
<div class="pagerUI" style="text-align:center">
    <ul style="display: inline-block;">
        <li><a class="page1st"></a></li>
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
        <li><a class="pageLast"></a></li>
    </ul>
</div>
