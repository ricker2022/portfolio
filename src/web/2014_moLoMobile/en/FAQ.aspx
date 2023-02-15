<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="FAQ.aspx.vb" Inherits="en_FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../_js/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="TopTitle">常見問題</div>
    <div id="main">
        <div id="FAQArea">
            <ul>
                <li class="FqaItems">
                    <div class="FqaTitle">Is there a charge for logging into moLo with a mobile phone number?</div>
                    <div class="FqaContent">
                        <ul>
                            <li>No, it is a totally free service; when you register, edit your information or change the settings, the SMS you receive by the system are all free.</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">Do I have to provide my e-mail address to apply for moLo membership?</div>
                    <div class="FqaContent">
                        <ul>
                            <li>Yes. Please enter a correct e-mail address and login into your e-mail for verification when applying for membership. Any future changes to member information will also need to be verified via your e-mail account.</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">I have applied for membership but have forgotten my password. What can I do to retrieve my password?</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">1. Please go to the official website and click “Forgot password” ─ Please select the issue that applies to you</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">2. Please click “Forgot Password”</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">3. Please fill in your country region and mobile phone number → Confirm →<br /><br />
"The e-mail has been successfully verified" Set a new password→ Relevant information will be sent to your e-mail.<br /><br />
"Have not entered an e-mail or the e-mail has not been verified" Set a new password → Confirm → A verification code will be sent to you via SMS.</li>
                        </ul>

                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">I have already registered to be a moLo member. However, it shows 【This phone is already in use】when I have entered the account number and password.</div>
                    <div class="FqaContent">
                        <ul>
                            <li>The messages will be seen on the page if your moLo account number login process is not completed yet, so any attempt to log in will result in multiple logins. Please wait for two minutes and then try again.</li>
                        </ul>
                    </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">What should I do if I have not received the SMS with the verification code?</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">1. Please make sure if your mobile phone number is the same as the one in the application.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">2. Please check with your mobile phone service provider if SMS advertising is being blocked.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">3. Please check if your mobile phone has been turned on.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">4. Please check if the mobile phone signal strength is sufficient in your current location.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">5. Please check if your text message inbox is full.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">6. Please check if the phone memory is full.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">7. If your mobile phone has message sorting functions, please check if the SMS has been sent to a specific in-box.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">8. If none of the above situations apply, please write to customer services for assistance.</li>
                        </ul>
            </div>
                </li>
                <li class="FqaItems">
                    <div class="FqaTitle">What should I do if the password in the SMS is invalid?</div>
                    <div class="FqaContent">
                        <ul>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">1. The password in your SMS will automatically be invalid after 3 incorrect password attempts.</li>
                            <li style="text-indent: -27px; padding: 0 28px 21px 57px;">2. When the password in your SMS is invalid, please re-acquire a new password after its effective period is expired.</li>
                        </ul>
                    </div>
                </li>
            <li class="FqaItems">
                <div class="FqaTitle">How do I apply to change my mobile phone number if I have successfully applied and become a moLo member?</div>
                <div class="FqaContent">
                    <ul>
                        <li>The mobile number that you used for moLo registration is your account and once the account is established you cannot change it; If you can no longer use the mobile number, it is deemed that you have given up on your moLo account’s service using rights and all the related records.</li>
                    </ul>
                </div>
            </li>
            <li class="FqaItems">
                <div class="FqaTitle">I have successfully applied and become a moLo member. How do I ensure my account security?</div>
                <div class="FqaContent">
                    <ul>
                        <li>Once you have successfully applied and have an account, in order to increase your account security, we suggest you to immediately log into moLo official website to proceed password modification, e-mail adding and click on a system link in the e-mail, then you will be able to use moLo’s complete service after a successful verification. After modified your personal information, please go back to the official website to change your password regularly and proceed the above steps in order to protect your account and make your account safer.</li>
                    </ul>
                </div>
            </li>
            <li class="FqaItems">
                <div class="FqaTitle">When I register or log in moLo or change my personal information, why cannot I enter characters in fullwidth form? I can only enter characters in half width form?</div>
                <div class="FqaContent">
                    <ul>
                        <li>When you enter information in moLo, you can only enter characters in halfwidth (ex: 12345..., ABCDE..., abcde..., etc.). In order to facilitate members to enter their personal information with right format, moLo will automatically covert fullwidth form characters (ex: １２３４５..., ＡＢＣＤＥ..., ａｂｃｄｅ..., etc) to halfwidth form characters. Please note.</li>
                    </ul>
                </div>
            </li>
            <li class="FqaItems">
                <div class="FqaTitle">When there is a popup message “Cookie Fail” appeared when logging into moLo, what are the possible causes?</div>
                <div class="FqaContent">
                    <ul>
                        <li>When the login fails and Cookie Fail occurred, one of the possible reasons is Proxy server setting. Please check if you use Proxy server or are in a process of downloading programs. If you do, please cancel the setting or close the downloading program and then try to log into moLo again. 
This is an example of cancelling Proxy server setting in IE: Tool → Internet Options → Connections → LAN settings → Proxy server (uncheck) → OK</li>
                    </ul>
                </div>
            </li>
            <li class="FqaItems">
                <div class="FqaTitle">If I changed the cell phone number, how to apply for changing account and the service transferring?</div>
                <div class="FqaContent">
                    <ul>
                        <li>Please download the “application form for account changing”, fill out the form and prepare related information then mail to "moLo service team". <a href="/_download/網銀帳號異動申請書-molo.pdf">Download the form.</a></li>
                    </ul>
                </div>
            </li>
            </ul>
        </div>
    </div>
</asp:Content>

