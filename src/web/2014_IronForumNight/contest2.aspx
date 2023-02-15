<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="contest2.aspx.cs" Inherits="contest2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="contestA">
            <div class="contestContent">
                <div class="contestContentLogo">
                    <img src="_img/contestStone.png" /></div>
                <div class="contestContentMain">
                    <div class="contestCMTxt">
                        <div id="content_1" class="main_index">
                                賽制及規範：<br />
                            　1. 單淘汰賽制，八強賽為Best of 3，四強賽及冠軍賽為Best of 5。<br />
                            　2. 對戰採KOF形式，選手自行選擇職業，第一回合為盲選。<br />
                            　3. 在單場賽事中，前回合勝者必須繼續使用相同職業，且不可更換牌組。<br />
                            　4. 在單場賽事中，敗者選擇下回合的職業時，不得和該場先前回合使用的職業重複。<br />
                            　5. 選手於對戰中不得使用表情功能。<br />
                            　6. 若出現技術問題，主辦方得決定重新舉行比賽。<br />
                            　7. 若選手於比賽中發生斷線，選手必須主動告知裁判，由裁判判定比賽暫停後，待主辦單位確認情況，依據斷線原因進行以下判決：<br />
                            　a. 重新進行賽事。<br />
                            　b. 直接判定選手獲勝或喪失資格。

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="_js/jquery.mCustomScrollbar.concat.min.js" defer="defer"></script>
    <script src="_js/mcs.js" defer="defer"></script>
</asp:Content>

