<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Smenu.ascx.cs" Inherits="Smenu" %>

<table border="0">
    <tr>
        <td><a id="menu01" onmouseover="this.innerHTML='How To Buy'" onmouseout="this.innerHTML='購物流程'" href="#">購物流程</a>|</td>
        <td><a id="menu02" onmouseover="this.innerHTML='Payment'" onmouseout="this.innerHTML='付款方式'" href="#">付款方式</a>|</td>
        <td><a id="menu03" onmouseover="this.innerHTML='Shipments'" onmouseout="this.innerHTML='運送方式'" href="#">運送方式</a>|</td>
        <td><a id="menu04" onmouseover="this.innerHTML='Q&A'" onmouseout="this.innerHTML='Q&A'" href="#">Q&A</a>|</td>
        <td><a id="menu05" onmouseover="this.innerHTML='Member Center'" onmouseout="this.innerHTML='會員中心'" href="#">會員中心</a>|</td>
        <td><a id="menu06" onmouseover="this.innerHTML='Cart(1)'" onmouseout="this.innerHTML='購物車(1)'" href="#">購物車(1)</a>|</td>
        <td style="border: none;"><a id="menu07" onmouseover="this.innerHTML='Log In'" onmouseout="this.innerHTML='登入'" href="#">登入</a>
            <a id="menu08" onmouseover="this.innerHTML='Log out'" onmouseout="this.innerHTML='登出'" href="#" style="display: none;">登出</a></td>
    </tr>
</table>
