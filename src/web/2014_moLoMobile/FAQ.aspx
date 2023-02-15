<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FAQ.aspx.vb" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="_JS/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">常見問題</div>
    <div id="main">
        <div id="FAQArea">
            <ul>
                <li class="FqaItems">
                    <div class="FqaTitle">使用moLo手機門號登入需要費用嗎？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>moLo手機門號登入是一個完全免費的服務；註冊或修改設定相關資料時，系統所發出的簡訊或語音電話皆無需支付費用。唯有台灣地區申請使用「通訊登入」的使用者，在撥打551203進行通訊驗證時，需支付電信廠商通訊費(目前通話費率每秒0.2元，前十秒資費宣告時間不計費)，此筆費用將列於個人電信帳單。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">申請moLo會員，可以使用預付卡的電話申請嗎？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>一般電信門號或預付卡皆可進行註冊。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">為何有時會接到系統撥打的語音電話？使用者需要付費嗎？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>一般電信門號或預付卡皆可進行註冊。<br />
                                系統所撥出的語音驗證電話/簡訊皆是免費的服務，請會員放心安心使用。</li>
                            <li>目前有二種情況，台灣地區門號會有可能接到語音電話：</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">1.註冊：若未能收到註冊簡訊者，可以申請使用系統外撥的語音驗證碼註冊。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">2.申請變更個人資料：系統會自動撥出語音電話，只需將所聽到的語音驗證碼填回頁面，通過驗證即可變更成功。</li>
                            <li>※目前語音驗證碼一天以三通電話為上限，超過次數需於24小時後重新操作；若語音電話遇有延遲現象，表示線路忙線中，敬請耐心等候。
                            </li>
                        </ul>

                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">每次使用moLo手機門號登入，都要撥打551203嗎？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>moLo預設為「一般登入」模式，只需輸入手機門號、密碼即可登入；當使用者變更設定為「通訊登入」模式時，才需要於每次登入時撥打551203。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">何謂【通訊登入】模式？要如何申請及使用？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>當您自官網變更個人資料完成，台灣地區門號者可自行選擇「通訊登入」模式。一旦變更成功後，日後若需透過moLo登入遊戲或需登入moLo官網時，則必須撥打551203進行手機號碼驗證，以確保您為本人身分登入，提高帳戶安全性。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">申請【通訊登入】模式，撥打551203為何顯示空號或無法撥通呢？</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">1.若已申請限撥「行動語音簡碼」功能的客戶(限制手機撥打任何5512xx簡碼加值服務)，請先透過電信客服取消此項功能後始可使用。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">2.全虹電信、家樂福電信、7-Mobile電信、亞太電信預付卡、威寶電信預付卡：目前無法撥打「行動語音簡碼」，因此在moLo只能使用一般登入模式。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">申請moLo會員，一定要填寫電子信箱嗎？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>申請moLo會員，請務必要填寫正確電子信箱，並登入個人信箱進行驗證流程，日後會員資料有異動皆會透過電子信箱進行驗證服務。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">已成功申請moLo會員，但是忘記密碼要如何查詢？</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">1.請至官網點選「無法登入」─ 請選擇無法登入狀況</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">2.請點選【忘記密碼】</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">3.請填寫國家地區及手機門號→確認→<br />
                                【已通過e-mail驗證】設定新密碼 → 確認 → 驗證資訊將會透過e-mail與語音電話通知。<br />
                                【未輸入或未通過e-mail驗證】設定新密碼 → 確認 → 驗證碼將會透過語音電話通知。<br />
                                ※ 非台灣地區門號者，語音電話部分，系統將透過免費簡訊傳送通知。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">已成功申請moLo會員，但在輸入門號及密碼後出現【此電話目前已在服務中】?</div>
                    <div class="FqaContent">
                        <ul>
                            <li>當頁面出現此訊息，是moLo門號登入流程尚未完成，即重複進行moLo登入所造成，請您靜候2分鐘後重新操作即可。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">非台灣地區門號若沒收到驗證碼簡訊怎麼辦？</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">1.確認此手機號碼是否為申請時所填寫之號碼。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">2.請向您的電信業者詢問是否有拒收廣告簡訊的設定。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">3.請確認您申請的手機號碼是否有開機。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">4.請確認您目前的所在位置收訊是否有正常。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">5.請確認簡訊的信件箱是否已經額滿。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">6.請確認手機的記憶體是否已經額滿。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">7.若您的手機本身有提供簡訊分類的功能，請確認是否寄送至該分類中。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">8.若非上述狀況，請來信至客服信箱協助處理。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">系統發出簡訊/語音的密碼或驗證碼失效了，該怎麼辦？？</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">1.密碼或驗證碼輸入錯誤達3次將自動失效。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">2.若密碼或驗證碼失效時，請於有效時間過後再自行重新取得即可。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">已成功申請moLo會員，但換了手機門號後該如何申請變更？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>moLo手機門號註冊等同帳號建立，如會原手機門號有異動，如要保留原手機門號服務使用權與所有相關記錄，則請使用<a href="/_download/網銀帳號異動申請書-molo.pdf" target="_blank">『網銀帳號異動申請書-moLo』提出申請</a>。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">已成功申請moLo會員，如何確保帳戶安全性？</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">1.一旦申請帳號成功，為了提高帳戶安全性，建議您立即登入moLo官網，進行「密碼修改」及新增「e-mail」，並至個人信箱回點系統連結，驗證成功後即可使用完整的moLo服務。</li>
                            <li style="text-indent: -20px; padding: 0 28px 21px 53px;">2.變更個人資料完成後，也請定期回官網「修改密碼」或選擇「通訊登入」模式；執行以上步驟以協助保護帳戶更加安全。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">註冊/登入moLo或變更個人資料時為何無法使用全形字？只能用半形字輸入？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>輸入資料時，moLo僅限輸入半形字(ex：12345..、ABCDE..、abcde..等)，若會員使用全形字輸入(ex：１２３４５..、ＡＢＣＤＥ..、ａｂｃｄｅ..等)，為了方便會員輸入個人資料時可以符合格式， moLo會自動將全形字轉換為半形字體，敬請會員多加留意。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">若登入moLo時出現「Cookie Fail」訊息，可能是什麼原因所造成？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>若登入失敗，如發生(Cookie Fail)，目前其中一個原因可能為proxy伺服器設定問題，請確認是否有使用代理伺服器(proxy)或部份下載程序，請先取消設定或關閉程序後再重新嘗試登入。<br />
                                以IE瀏覽器取消設定方式為例：網際網路選項>連線>區域網路設定>proxy伺服器(取消勾選)>確定送出。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">帳號（手機門號）如有更換要如何申請變更門號及旗下服務的轉移？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>請下載『網銀帳號異動申請書-moLo』，填妥並準備相關資料，寄送至moLo服務小組收。<a href="/_download/網銀帳號異動申請書-molo.pdf" target="_blank">點此下載『網銀帳號異動申請書-moLo』</a>。</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">如何確認moLo網站安全憑證？</div>
                    <div class="FqaContent">
                        <ul>
                            <li>步驟1<br />
                                moLo網頁網址開頭為https://；代表moLo網站是受信任的安全網站，具有網站身份驗證和加密傳輸雙重功能，並且瀏覽器位址欄會顯示安全鎖(鎖頭)標誌。
                    <br />
                                【火狐】
                    <div class="img01"></div>
                                【Google】
                    <div class="img02"></div>
                                【IE】
                    <div class="img03"></div>
                            </li>
                            <li>步驟2<br />
                                查看SSL憑證資訊確認網站身份：<br />
                                【火狐】點擊安全鎖標誌(鎖頭)，再點選更多資訊
                    <div class="img04"></div>
                                在頁面資訊顯示頁，點選檢視憑證，可查看憑證資訊與內容，就會顯示憑證主要資訊 ( 憑證目的、憑證頒發者、憑證頒發給、憑證有效起始日期 )
                    <div class="img05"></div>
                                點選詳細資料查看憑證授權認證內容，點擊主體可查看認證內容完整度，CN (網域名稱)、O(公司名稱) 、C(國家)。
                    <span class="redF">請會員確認CN = *.moLo.gs，O = 網銀國際股份有限公司</span><br />
                                【Google】<br />
                                點擊安全鎖標誌(鎖頭)，再點選連線頁，可查看憑證資訊與內容就會顯示憑證主要資訊 ( 憑證目的、憑證頒發者、憑證頒發給、憑證有效起始日期 )
                    <div class="img06"></div>
                                顯示憑證資訊內容，確認授權給*.moLo.gs
                    <div class="img07"></div>
                                點選詳細資料查看憑證授權認證內容，點擊主體可查看認證內容完整度
                    ，CN (網域名稱)、O(公司名稱) 、C(國家)。
                    <span class="redF">請會員確認CN = *.moLo.gs，O = 網銀國際股份有限公司</span>
                                <div class="img08"></div>
                                【IE】<br />
                                點擊安全鎖標誌(鎖頭)，再點檢視憑證，可查看憑證資訊與內容，就會顯示憑證主要資訊 ( 憑證目的、憑證頒發者、憑證頒發給、憑證有效起始日期 )
                    <div class="img09"></div>
                                顯示憑證資訊內容，確認授權給*.moLo.gs
                    <div class="img10"></div>
                                點選詳細資料查看憑證授權認證內容，點擊主體可查看認證內容完整度
                    ，CN (網域名稱)、O(公司名稱) 、C(國家)。
                    <span class="redF">請會員確認CN = *.moLo.gs，O = 網銀國際股份有限公司</span><br />
                                <div class="img11"></div>
                                <div class="img12"></div>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

