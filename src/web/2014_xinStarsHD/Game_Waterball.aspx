<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Game_Waterball.aspx.vb" Inherits="Game_Baccarat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        table {
            margin:5px 0;
            padding:0;
            width:100%;
        }
        th, td {
            border-radius:0;
            border:0px #fff none;
            text-align:left;
        }
        .tdBorder {
            border:1px #353535 solid;
        }
        .thPadding {
            padding:0 0 0 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <div id="centent" style="width: 80%; margin: 20px auto 0 auto; padding: 20px 0;">
            <div class="GamePageLogo">
                <img src="_img/GameLogo/game02.jpg" />
            </div>
            <div class="PageContent">
                <div class="PageContentItem">
                    史上最強一波的水球大戰，最豪華的遊戲舞台，最淋漓盡致的連爆快感！
                </div>
            </div>

            <div class="PageContent">
                <div class="PageTitle">遊戲方式</div>
                <div class="PageContentItem">
                    <ul class="num">
                        <li>以200星幣為押注單位，押注的等級限制如下：0級(試玩玩家)及1等級押注額為200星幣、2等級押注額為400星幣…以此類推，當升至10等級時即可押滿押注額2000星幣。</li>
                        <li>玩家按【押分】選擇所要押注的額度，然後按【啟動】開始遊戲。 </li>
                        <li>水球停止後，必須是3個以上相同圖示相鄰(含斜線)即可連成一線，玩家可依連線種類得到不同的彩金倍數。 </li>
                    </ul>
                </div>
            </div>

            <div class="PageContent">
                <div class="PageTitle">連線賠率表</div>
                <div class="PageContentItem">
                    <div class="overRange">
                        <table border="1" cellspacing="1" cellpadding="0" align="center" class="intro">
                            <tr>
                                <th scope="row"  style="border:1px #000 solid;">圖示</th>
                                <td class="tdBorder"><img src="../_img/game/waterball/yellow.jpg" width="80" height="120" alt="黃球" /></td>
                                <td class="tdBorder"><img src="../_img/game/waterball/purple.jpg" width="80" height="120" alt="紫球" /></td>
                                <td class="tdBorder"><img src="../_img/game/waterball/red.jpg" width="80" height="120" alt="紅球" /></td>
                                <td class="tdBorder"><img src="../_img/game/waterball/blue.jpg" width="80" height="120" alt="藍球" /></td>
                                <td class="tdBorder"><img src="../_img/game/waterball/green.jpg" width="80" height="120" alt="綠球" /></td>
                                <td class="tdBorder"><img src="../_img/game/waterball/white.jpg" width="80" height="120" alt="白球" /></td>
                            </tr>
                            <tr>
                                <th scope="row">押分比</th>
                                <td class="tdBorder" align="center" class="color_f4004a">50%</td>
                                <td class="tdBorder" align="center" class="color_f4004a">40%</td>
                                <td class="tdBorder" align="center" class="color_f4004a">30%</td>
                                <td class="tdBorder" align="center" class="color_f4004a">20%</td>
                                <td class="tdBorder" align="center" class="color_f4004a">10%</td>
                                <td class="tdBorder" align="center" class="color_f4004a">Bonus</td>
                            </tr>
                        </table>
                    </div>
                    <table border="0" cellspacing="0" cellpadding="0" align="center" class="intro">
                        <tr>
                            <td>
                                <strong>※彩金的計算方式為：連線球數x(押注額x押分比)</strong>
                                <div class="cNote">
                                    以藍球為範例：如玩家押注額為200<br />
                                    &spades; 3顆藍球連線=3x(200x20%)=120星幣<br />
                                    &spades; 4顆藍球連線=4x(200x20%)=160星幣<br />
                                    &spades; 5顆藍球連線=5x(200x20%)=200星幣<br />
                                    &spades; 6顆藍球連線=6x(200x20%)=240星幣<br />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="PageContent">
                <div class="PageTitle">連爆水球狀態</div>
                <div class="PageContentItem">
                    <table border="0" cellspacing="0" cellpadding="0" class="intro">
                        <tr>
                            <td>當掉落的水球停止後，達成連線的圖示爆開為1連爆；之後在補上的圖示又有達成連線即為2連爆….以此類推。未爆水球會隨著連爆的次數漸漸充氣漲大，當達第4次時，這些未爆水球也會跟著爆掉。<br />
                                <br />
                                <strong class="color_f4004a">只要有一顆白球(Bonus)爆掉，即可進入BONUS GAME。</strong>
                            </td>
                        </tr>
                    </table>
                    <h4 class="intro_title">BONUS GAME</h4>
                    <table border="0" cellspacing="0" cellpadding="0" class="intro">
                        <tr>
                            <td align="center"><img src="../_img/game/waterball/pic.jpg" width="150" height="150" alt="bonus game" /></td>
                        </tr>
                        <tr>
                            <td>
                                當局的<strong class="color_f4004a">1顆白球爆掉</strong>，即可進入BONUS GAME模式。<br />
                                <br />
                                →BONUS GAME玩法說明： 進入BONUS GAME時為《空盤》狀態，然後會隨機出現黃球，只要有3顆以上的黃球相鄰即達成連線(如左圖)，玩家可得到黃球的連線彩金，一直到黃球呈現無連線狀態時，即結束BONUS
                                GAME模式。
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="PageContent">
                <div class="PageTitle">斷線規則</div>
                <div class="PageContentItem">
                    <div>《機台保留為善意機制，若遇不可抗力之因素，系統將不予保留機台。》</div>
                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="intro">
                        <tr>
                            <th class="thPadding">ISP業者斷線,moLo連線異常</th>
                        </tr>
                        <tr>
                            <td>系統接手將此局結算，結算結果可能為增加分數或減少分數。</td>
                        </tr>
                        <tr>
                            <td>機台保留1小時</td>
                        </tr>
                    </table>
                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="intro">
                        <tr>
                            <th class="thPadding">玩家端異常離線或當機</th>
                        </tr>
                        <tr>
                            <td>系統接手將此局結算，結算結果可能為增加分數或減少分數。</td>
                        </tr>
                        <tr>
                            <td>機台保留1小時</td>
                        </tr>
                    </table>
                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="intro">
                        <tr>
                            <th class="thPadding">星城遊戲伺服器異常</th>
                        </tr>
                        <tr>
                            <td>系統接手將此局結算，結算結果可能為增加分數或減少分數。</td>
                        </tr>
                        <tr>
                            <td>機台保留8小時</td>
                        </tr>
                    </table>
                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="intro">
                        <tr>
                            <th class="thPadding">星城遊戲伺服器維護</th>
                        </tr>
                        <tr>
                            <td>系統接手將此局結算，結算結果可能為增加分數或減少分數。</td>
                        </tr>
                        <tr>
                            <td>機台保留4小時</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

