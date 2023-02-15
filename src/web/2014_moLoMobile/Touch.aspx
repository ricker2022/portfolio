<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Touch.aspx.vb" Inherits="Touch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="_JS/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">教學說明</div>
    <div id="main">
        <div id="TouchArea" style="min-height:370px;">
            <ul>
                <li class="qaItems">
                    <div class="qaTitle">註冊登入操作教學</div>
                    <div class="qaContent">
                        <ul>
                            <li>
                                <h3>手機註冊</h3>
                                若您為首次註冊用戶，請先點選「立即註冊」＜圖一＞，並輸入您的手機號碼＜圖二＞，請詳閱服務條款、隱私政策及個人資料使用同意書＜圖三＞，點選確認後，畫面會直接進入及密碼的驗證畫面＜圖四＞。待驗證成功後，即可直接進入您所使用的服務。此手機門號將成為日後您的moLo帳號。</li>
                            <li>
                                <h3>手機登入</h3>
                                已經操作過手機註冊的使用者，請由＜圖一＞直接登入，即可直接進入您所使用的服務。</li>
                            <li style="text-align: center;">
                                <img src="_img/Touch/1-01.jpg" /><br />
                                ＜圖一＞</li>
                            <li style="text-align: center;">
                                <img src="_img/Touch/1-02.jpg" /><br />
                                ＜圖二＞</li>
                            <li style="text-align: center;">
                                <img src="_img/Touch/1-03.jpg" /><br />
                                ＜圖三＞</li>
                            <li></li>
                            <li>
                                <h3>方式一、簡訊密碼註冊</h3>
                                moLo將會透過手機簡訊發送一組密碼，此密碼將成為您初次登入moLo的密碼。</li>
                            <li style="text-align: center;">
                                <img src="_img/Touch/1-04.jpg" /><br />
                                ＜圖四＞</li>
                            <li></li>
                            <li>
                                <h3>方式二、語音驗證碼註冊（此方式目前僅開放台灣地區門號）</h3>
                                若您在註冊時未收到簡訊完成驗證，系統將於30秒後自動語音外撥驗證。<br />
                                請先備妥手機，系統將撥出語音電話；在頁面上輸入所聽到的語音驗證碼，即可完成註冊。<br />
                                ※若語音電話遇有延遲現象，表示線路忙線中，請耐心等候，系統將優先處理。<br />
                                ※若手機於訊號不佳的環境中，會造成電信業者無法發送簡訊或撥號語音。<br />
                                ※若有此狀況請連繫客服中心或請於24小時後再申請註冊。</li>
                            <li></li>
                            <li>
                                <h3>註冊完成訊息</h3>
                                當註冊完成後，此時您已成功申請moLo帳號；為了提高您的帳戶安全，請您先變更密碼及e-mail＜圖六＞，並至個人信箱回點系統連結，驗證成功後即可使用完整的moLo服務。</li>
                        </ul>
                    </div>
                </li>
                <li class="qaItems">
                    <div class="qaTitle">變更個人資料教學</div>
                    <div class="qaContent">
                        <ul>
                            <li>
                                <h3>※以下以「密碼變更」為例：</h3>
                            </li>
                            <li style="text-indent: -37px; padding: 0 28px 21px 67px;">1、請至moLo官網首頁，點選「註冊 | 登入」按鈕，登入手機門號。</li>
                            <li style="text-align: center;">
                                <img src="_img/Touch/2-01.jpg" /></li>
                            <li style="text-indent: -37px; padding: 0 28px 21px 67px;">2、進入「帳號設定」頁，點選密碼欄的「編輯」，輸入新密碼後按「儲存」。</li>
                            <li style="text-align: center;">
                                <img src="_img/Touch/2-02.jpg" /></li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 55px;">※ 此頁可進行e-mail、密碼、登入模式等個人資料修改。</li>
                            <li style="text-indent: -37px; padding: 0 28px 21px 67px;">3、請至您在moLo所設定的 E-mail 收取moLo發出的驗證信，回點系統連結以完成驗證。</li>
                            <li style="text-indent: -37px; padding: 0 28px 21px 67px;">4、系統將撥出免費的語音電話，請接起電話並在頁面輸入所聽到的語音驗證碼(非台灣地區門號者，驗證碼將透過免費簡訊傳送至手機)，按下「確定」鍵，即可完成修改密碼。</li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

