<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Mem_ForgetPw.aspx.vb" Inherits="Mem_ForgetPw" %>

<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        td {
            text-align:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">忘記密碼</div>

                <h4 style="padding:0 40px;">忘了密碼申請表使用說明</h4>
        	<table id="memMTPTbs" border="0" class="intro">
              <tr>
                <td><p>請至<a href="Downloads.aspx" target="_blank">【下載專區】</a>→客服表單申請處→下載<a href="Downloads.aspx" target="_blank">【查詢資料申請書】</a><br />
                    <b>★若無印表機可列印，請來電客服索取表單。</b></p>
                    <p><span class="color_f4004a">注意！！使用moLo建立之遊戲帳號，如非舊帳戶綁定之帳號，皆無法個別設定或修改帳號、密碼…等資料唷！</span></p>
                <p>
                    <span class="color_f4004a">提醒您!如果您是忘記交易密碼，請到</span>
                    <a href="Mem_ForgetTradingPw.aspx">會員專區→查詢交易密碼</a></p></td>
              </tr>
              <tr>
                <td><ul class="square">
                  <li>申請流程
                    <ul class="square2">
                      <li> <b>(一)</b>請填寫好忘了密碼申請表中的每個欄位，並附上您申請遊戲帳號時使用的身份證號之身份證影本，以便查核身份，確認帳號擁有權。<br />
                        設定時間排程約3~6個小時，請玩家耐心等候。</li>
                      <li> <b>(二)</b>請將申請表傳真到(04) 2259-3887。</li>
                      <li> <b>(三)</b>經驗證確認身份後，系統將自動產生一組新密碼，並將新密碼傳遞簡訊到您的行動電話中，如果您當初申請會員帳號時，並未填寫正確的行動電話號碼，此時您必需正確填寫，以免密碼誤傳給他人。</li>
                    </ul>
                  </li>
                    <br />
                  <li> 申請條件<br />
                      <span>您傳真的身份證影本中的身份證號，必需與當初申請遊戲帳號時使用的身份證號相符，若不相同者將不予處理。承辦人員將視情況透過簡訊與您聯繫說明。</span>
                  </li>
                </ul></td>
              </tr>
          </table>
        	<div style="padding:10px 0; text-align:center;"><a class="btn" style="width:30%;" href="javascript:history.back();">回上頁</a></div>


                </div>
            </div>
        </div>
</asp:Content>

