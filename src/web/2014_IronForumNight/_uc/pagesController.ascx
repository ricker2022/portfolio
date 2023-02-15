<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pagesController.ascx.cs" Inherits="UI_component_hearthstone_pagesController" %>
<style>
/*分頁按鈕*/
.pagerUI {
        
    }
.pagerUI a{
    display:inline-block;
    text-align:center;
    /*margin:0 3px;*/
    margin:10px 3px 0 0px;
    cursor:pointer;
    font-family:新細明體,MS PMincho;line-height:21px;
    font-size:12px;
}
.pagerUI li{
    float:left;
}
.page1st{
    background: url(../_img/pagesController/pageBtn.png) no-repeat 0px 0px;
    width:56px;
    height:21px;
}
.page1st:hover{
    background: url(../_img/pagesController/pageBtn.png) no-repeat 0px -21px;
}
.pagePrev{
    background: url(../_img/pagesController/pageBtn.png) no-repeat -56px 0px;
    width:56px;
    height:21px;
}
.pagePrev:hover{
    background: url(../_img/pagesController/pageBtn.png) no-repeat -56px -21px;
}
.pageNext{
    background: url(../_img/pagesController/pageBtn.png) no-repeat -112px 0px;
    width:56px;
    height:21px;
}
.pageNext:hover{
    background: url(../_img/pagesController/pageBtn.png) no-repeat -112px -21px;
}
.pageLast{
    background: url(../_img/pagesController/pageBtn.png) no-repeat -168px 0px;
    width:56px;
    height:21px;
}
.pageLast:hover{
    background: url(../_img/pagesController/pageBtn.png) no-repeat -168px -21px;
}
.pageNum{
    background: url(../_img/pagesController/pageBtnN.png) no-repeat 0px 0px;
    width:21px;
    height:21px;
    color:#000000;
}
.pageNum:hover{
    background: url(../_img/pagesController/pageBtnN.png) no-repeat 0px -21px;
}
</style>
<div class="pagerUI" style="text-align:center">
    <ul style="display: inline-block;">
        <li><a class="pagePrev"></a></li>
        <li><a class="page1st"></a></li>
        <li><a class="pageNum">1</a></li>
        <li><a class="pageNum">2</a></li>
        <li><a class="pageNum">3</a></li>
        <li><a class="pageNum">4</a></li>
        <li><a class="pageNum">5</a></li>
        <li><a class="pageNum">6</a></li>
        <li><a class="pageNum">7</a></li>
        <li><a class="pageNum">8</a></li>
        <li><a class="pageNum">9</a></li>
        <li><a class="pageNum">10</a></li>
        <li><a class="pageNext"></a></li>
        <li><a class="pageLast"></a></li>
    </ul>
</div>