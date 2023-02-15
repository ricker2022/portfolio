<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="_uc_menu" %>
<style>
    #dMenu {
        position: absolute;
        top: 0;
        left: 785px;
        padding: 0;
        margin: 0;
        display: table;
        width: 810px;
        height: 75px;
    }

    .menuBtn01 a{
        width: 135px;
        height: 75px;
        border: 0 #fff none;
        float:left;
        background:url('../_img/index/menu.jpg') 0px 0px no-repeat;
    }
    .menuBtn01 a:hover {
        background:url('../_img/index/menu.jpg') 0px -75px no-repeat;
    }

    .menuBtn02 a{
        width: 135px;
        height: 75px;
        border: 0 #fff none;
        float:left;
        background:url('../_img/index/menu.jpg') -135px 0px no-repeat;
    }
    .menuBtn02 a:hover {
        background:url('../_img/index/menu.jpg') -135px -75px no-repeat;
    }

    .menuBtn03 a{
        width: 135px;
        height: 75px;
        border: 0 #fff none;
        float:left;
        background:url('../_img/index/menu.jpg') -270px 0px no-repeat;
    }
    .menuBtn03 a:hover {
        background:url('../_img/index/menu.jpg') -270px -75px no-repeat;
    }

    .menuBtn04 a{
        width: 135px;
        height: 75px;
        border: 0 #fff none;
        float:left;
        background:url('../_img/index/menu.jpg') -405px 0px no-repeat;
    }
    .menuBtn04 a:hover {
        background:url('../_img/index/menu.jpg') -405px -75px no-repeat;
    }

    .menuBtn05 a{
        width: 135px;
        height: 75px;
        border: 0 #fff none;
        float:left;
        background:url('../_img/index/menu.jpg') -540px 0px no-repeat;
    }
    .menuBtn05 a:hover {
        background:url('../_img/index/menu.jpg') -540px -75px no-repeat;
    }

    .menuBtn06 a{
        width: 135px;
        height: 75px;
        border: 0 #fff none;
        float:left;
        background:url('../_img/index/menu.jpg') -675px 0px no-repeat;
    }
    .menuBtn06 a:hover {
        background:url('../_img/index/menu.jpg') -675px -75px no-repeat;
    }
</style>


<div id="dMenu">
    <ul>
        <li class="menuBtn01"><a href="../information.aspx"></a></li>
        <li class="menuBtn02"><a href="../news_down.aspx"></a></li>
        <li class="menuBtn03"><a href="../contest_down.aspx"></a></li>
        <li class="menuBtn04"><a href="../players_down.aspx"></a></li>
        <li class="menuBtn05"><a href="../schedule_down.aspx"></a></li>
        <li class="menuBtn06"><a href="../live_down.aspx"></a></li>
    </ul>

</div>
