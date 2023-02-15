<%@ Page Title="" Language="VB" MasterPageFile="~/en/Master_en.master" AutoEventWireup="false" CodeFile="Touch.aspx.vb" Inherits="en_Touch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../_js/qa.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="TopTitle">Instruction</div>
    <div id="main">
        <div id="TouchArea" style="min-height:370px;">
            <ul>
                <li class="qaItems">
                    <div class="qaTitle">Mobile phone log in</div>
                    <div class="qaContent">
                        <ul>
                            <li>
                                <h3>Mobile phone register</h3>
                                If you are the first time to login user, please select register in login page< Figure 1 >.
                                Please select your country code and enter your mobile number< Figure 2 >. 
                                Please read these Terms of Service and our Privacy Policy carefully before using moLo Services< Figure 3 >.
                                After clicking confirmation, please enter your password < Figure 4 >.
                                This mobile phone numbers will be the future of your moLo account. </li>
                            <li>
                                <h3>Mobile phone login</h3>
                                When user was registered mobile phone numbers / logged in user already, please enter the account and password before using moLo Services< Figure 1 >. </li>
                            <li style="text-align: center;">
                                <img src="../_img/Touch/1-01.jpg" /><br />
                                < Figure 1 ></li>
                            <li style="text-align: center;">
                                <img src="../_img/Touch/1-02.jpg" /><br />
                                < Figure 2 ></li>
                            <li style="text-align: center;">
                                <img src="../_img/Touch/1-03.jpg" /><br />
                                < Figure 3 ></li>
                            <li></li>
                            <li>
                                <h3>Mode 1 :Text message password login</h3>
                                Next, moLo will send you a text message with your password, which will be your moLo account’s login password.</li>
                            <li style="text-align: center;">
                                <img src="../_img/Touch/1-04.jpg" /><br />
                                < Figure 4 ></li>
                            <li></li>
                            <li>
                                <h3>Mode 2 : Voice verification code registration(Open mode only for Taiwan's phone number) </h3>
                                If you do not receive your code via SMS, our automated system can call you with your code. Please wait for the 30 seconds. Enter the correct verification code on your phone to finish registration.<br />
                                Please check all states when You still have not received your code<br />
                                * The line is busy. Please wait a minute<br />
                                * Phone can't find a good signal<br />
                                * Please contact Customer Service Center or can be registered online after 24 hours</li>
                            <li></li>
                            <li>
                                <h3>Registration completion message</h3>
                                You will have successfully applied for a moLo account after receiving the text message with your password. In order to increase your account security, please first change your e-mail< Figure 6> and password and then go to your e-mail and click on the verification link. You will be able to use moLo's full services after successful verification.</li>
                        </ul>
                    </div>
                </li>
                <li class="qaItems">
                    <div class="qaTitle">change personal detail manual</div>
                    <div class="qaContent">
                        <ul>
                            <li>
                                <h3>※ The following is an example of password changing：</h3>
                            </li>
                            <li style="text-indent:-37px; padding:0 28px 21px 67px;">1、Please go to the home page of moLo's official website and click on register| login button to log in with your mobile number.</li>
                            <li style="text-align: center;">
                                <img src="../_img/Touch/2-01.jpg" /></li>
                            <li style="text-indent:-37px; padding:0 28px 21px 67px;">2、Enter account setting page and click on edit in password column to enter your new password and press save.</li>
                            <li style="text-align: center;">
                                <img src="../_img/Touch/2-02.jpg" /></li>
                            <li style="text-indent:-27px; padding:0 28px 21px 55px;">※ You can edit your personal information such as e-mail, password, login mode, etc. on this page.</li>
                            <li style="text-indent:-37px; padding:0 28px 21px 67px;">3、Please go get a verification e-mail that moLo sends to the e-mail address you set in moLo and click on the system link to complete verification.</li>
                            <li style="text-indent:-37px; padding:0 28px 21px 67px;">4、The system will send a messages to your mobile phone now. Please enter a verification code in the message you received onto the page and press confirm button to complete password editing.</li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>

