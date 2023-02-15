<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <div id="content">
            <div class="dItem">
                <a id="molo_btn" href="https://m1.molo.gs/login.html?Language=TW&Region=886&Category=login&ServiceName=2&ReturnURL=http://www.xin-stars.com/mobile/Mem_Account.aspx" onclick="molobtn"></a>
            </div>
            <div class="dItem">
                <a id="fb_btn" href="javascript:void(0)"></a>
               <%-- <script type="text/javascript">
                    //20140815
                    $("#fb_btn").click(function () {
                        FB.login(function (response) {
                            if (response.authResponse) {
                                var access_token = FB.getAuthResponse()['accessToken'];
                                FB.api('/me', function (response) {
                                    var u = response.id;
                                    var n = response.name;
                                    var gen = response.sex;
                                    FB.logout(function (response) {
                                    });
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json",
                                        url: "../fbwebservices/postToWall.asmx/CreateToken",
                                        data: "{'access_token':'" + access_token + "','pFBID':'" + u + "','pFBName':'" + n + "'}",
                                        dataType: "json",
                                        success: function (result) {
                                            location.href = "<%=LoginLink %>";
                                                }
                                            });

                                        });

                                        }
                                }, { scope: '' });
                            });
                </script>--%>
            </div>
            <div class="dItem">
                
                <div id="xin_login_container">
                    <div id="normalTitle">星城舊會員登入</div>
                    <label class="formLabel">帳號</label>
                    <input id="account" type="text" name="Account" tabindex="1" />
                    <label class="formLabel">密碼</label>
                    <input type="password" id="Pass" name="Pass" tabindex="2" />
                    <label class="formLabel">驗証碼</label>
                    <input id="vcode" name="vcode" type="text" tabindex="3" />
                    <img id="vcodeImg" src="../_img/ValidateCode.aspx" alt="" />
                    <%--<asp:Button ID="xin_login"  runat="server" Text="登入" />--%>
                    <a id="submitBtn" href="#">登入</a>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
    </div>
</asp:Content>

