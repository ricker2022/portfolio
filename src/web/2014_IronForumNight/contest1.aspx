<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="contest1.aspx.cs" Inherits="contest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <div class="contestA">
            <div class="contestContent">
                <div class="contestContentLogo">
                    <img src="_img/contestStar.png" /></div>
                <div class="contestContentMain">
                    <div class="contestCMTxt">
                        <div id="content_1" class="main_index">
                                賽制及規範：<br />
                            　1. 賽制為團隊 Best of 9，個人 Best of 1，團隊先取五分者獲勝。<br />
                            　2. 地圖採用 2014 WCS/天梯當季比賽之地圖庫，本場賽事所採用的九張地圖由主辦方鉄人論壇進行抽選，並於賽事前一週（8/8）公佈。<br />
                            　3. 雙方教練根據主辦方抽選的地圖進行排陣，前四場的排陣名單於賽事前一天（8/15）繳交，上場選手不得重複；第五場之後的排陣由教練在比賽現場提出，第四場結束提交第五場上場名單，第五場結束提交第六場上場名單，以此類推，第五至第八場的上場選手不得重複。<br />
                            　4. 第九場為Ace戰，出賽名單由教練於現場提出，上場選手不限制。<br />
                            　5. 前七場賽事地圖不得重複。<br />
                            　6. 對戰中，除了開場打招呼、比賽結束和要求暫停外，選手不得使用聊天功能。<br />
                            　7. 選手不得在聊天室中使用任何帶有不雅或種族歧視的發言。<br />
                            　8. 選手不得進行非必要的暫停。<br />
                            　9. 未取得裁判同意，選手擅自在比賽中離開遊戲將自動視為投降。<br />
                             10. 若出現技術問題，主辦方得決定重新舉行比賽，或是利用「回復遊戲」功能回到主辦單位決定的時間點。<br />
                             11. 若選手於比賽中發生斷線，選手必須主動告知裁判，由裁判判定比賽暫停後，待主辦單位確認情況，依據斷線原因進行以下判決：<br />
                            　a. 重新進行賽事。<br />
                            　b. 利用「回復遊戲」回到主辦方決定之時間點。<br />
                            　c. 直接判定選手獲勝或喪失資格。<br />
                             12. 若對戰雙方皆無法獲勝，主辦單位將宣佈雙方平手，重新進行對戰。
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="_js/jquery.mCustomScrollbar.concat.min.js" defer="defer"></script>
    <script src="_js/mcs.js" defer="defer"></script>
</asp:Content>

