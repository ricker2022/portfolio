<%@ Page Title="" Language="VB" MasterPageFile="Mob.master" AutoEventWireup="false" CodeFile="Serv_Question.aspx.vb" Inherits="Serv_Question" %>

<%@ Register Src="_uc/memberArea.ascx" TagPrefix="uc1" TagName="memberArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        input {
            display: block;
            width: 50%;
            height: 30px;
            font-size: 15px;
            margin: 0 auto;
        }

        select {
            display: block;
            width: 50%;
            height: 30px;
            font-size: 15px;
            margin: 0 auto;
        }

        textarea {
            display: block;
            width: 70%;
            height: 100px;
            font-size: 15px;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainPic"></div>
    <div id="main">
        <uc1:memberArea runat="server" ID="memberArea" />
        <div id="content">
            <div class="normalContent">
                <div class="normalTitle">我要新增問題</div>

                <table id="memTbs" border="0" align="center" cellpadding="0" cellspacing="1" class="intro">
                    <tr>
                        <td valign="top" style="border: 0px #fff none;">
                            <h3>注意事項</h3>
                            <ul class="num color_c00000" style="text-align: left;">
                                <li>若您的問題，於【常見問題】中找不到答案，可使用下方問題通報發問。</li>
                                <li>請填寫問題正確發生之日期、時間、問題內容，以便加速為您處理之速度。</li>
                                <li>問題通報回覆時間為15日(不含例假日)。</li>
                                <li>若您遇到詐騙或竊盜案件，請參考【常見問題５－８】</li>
                                <li>請您使用發生問題之遊戲帳號，進行發佈問題通報。</li>
                                <li>以下情況，將不受理查詢及回覆：
                                </li>
                                <ul class="square">
                                    <li>非本人、或未使用發生問題之遊戲帳號所發佈之問題通報。</li>
                                    <li>同一(或相似)問題內容，重覆發佈問題通報。</li>
                                    <li>問題通報內容含有低級、褻瀆、粗魯、辱罵、誹謗、人身攻擊、威脅、挑釁、種族與性別歧視、不雅文字、猥褻及含煽情淫穢、具有色情內容或含意、有違社會善良風俗的慣用詞彙之言詞內容；或對於本公司不實或不當之言論(包含公開或未公開之訊息，或是純屬玩家個人揣測等)。此點除了不受理查詢及回覆外，將依遊戲管理規章處置。</li>
                                </ul>
                            </ul>
                        </td>
                    </tr>
                </table>
                <table id="memMPTbs1" cellpadding="0" cellspacing="1" class="intro">
                    <tr>
                        <td valign="middle" colspan="2">
                            <h3 class="SQtxt">請使用您『發生問題之遊戲帳號』進行發佈問題通報，以利加速為您服務之速度。</h3>
                        </td>
                    </tr>
                    <tr>
                        <th valign="middle" colspan="2">玩家暱稱</th>
                    </tr>
                    <tr>

                        <td style="text-align: center;" valign="middle" colspan="2">
                            <input id="TextNick" runat="server" maxlength="12" name="textnick" readonly="readonly" size="20" type="text" value="" /></td>
                    </tr>
                    <tr>
                        <th valign="middle" colspan="2">伺服器名稱</th>
                    </tr>
                    <tr>

                        <td valign="middle" colspan="2">
                            <select id="sSer" runat="server" name="sSer">
                                <option selected="selected" value="----">伺服器</option>
                                <option value="賭城風雲">賭城風雲</option>
                                <option value="至尊爭霸">至尊爭霸</option>
                            </select></td>
                    </tr>
                    <tr>
                        <th valign="middle" colspan="2">遊戲類型</th>
                    </tr>
                    <tr>

                        <td valign="middle" colspan="2">
                            <select name="gSer" id="gSer" runat="server">
                                <%-- <option value="----" selected="selected">遊戲類型</option>
                    <option value="">全部</option>
                    <option value="5PK">星城5PK</option>
                    <option value="7PK">星城7PK</option>
                    <option value="十三支">星城十三支</option>
                    <option value="水果盤">水果盤</option>
                    <option value="百家樂">百家樂</option>
                    <option value="西楚霸王">西楚霸王傳</option>
                   <option value="吹牛撲克">吹牛撲克</option>
                    <option value="刮刮樂">刮刮樂</option>
                    <option value="東方明珠">東方明珠</option>
                    <option value="星城大滿貫">滿貫大富豪</option>
                    <option value="柏青哥">柏青哥</option>
                    <option value="皇冠列車">皇冠列車</option>
                    <option value="馬場大亨">馬場大亨</option>
                    <option value="超級小丑">超級小丑</option>
                    <option value="雅典娜">雅典娜</option>
                    <option value="新悟空">新悟空</option>
                    <option value="賓果行星">賓果行星</option>
                    <option value="賓果彈珠台">賓果彈珠台</option>
                    <option value="德州撲克">德州撲克</option>
                    <option value="歡樂BAR">歡樂BAR</option>
                    <option value="骰寶">骰寶</option>
                    <option value="六角slot">六角slot</option>
                    <option value="野蠻叢林">野蠻叢林</option>
                    <option value="晶爆方塊">晶爆方塊</option>
                    <option value="水球大戰">水球大戰</option>
                    <option value="星賓樂">星賓樂</option>
                    <option value="星城銀行">星城銀行</option>
                    <option value="星城量販">星城量販</option>
                    <option value="道具卡">道具卡</option>
                    <option value="其他">其他</option>--%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th valign="middle" colspan="2">發生時間</th>
                    </tr>
                    <tr>
                        <td width="30%" class="bgcolor_ccc">年</td>
                        <td width="70%" valign="middle" colspan="2">
                            <asp:DropDownList ID="SelectYear" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%" class="bgcolor_ccc">月</td>
                        <td width="70%" valign="middle" colspan="2">
                            <select name="pmonth" id="SelectMonth" runat="server">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%" class="bgcolor_ccc">日</td>
                        <td width="70%" colspan="2">
                            <select name="pday" id="SelectDay" runat="server">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                        </td>
                    </tr>
                            <td width="30%" class="bgcolor_ccc">時</td>
                    <td width="70%" colspan="2">
                                <select name="phour" id="SelectHour" runat="server">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" class="bgcolor_ccc">分</td>
                            <td width="70%" colspan="2">
                                <select name="pmin" id="SelectMin" runat="server">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                    <option value="32">32</option>
                                    <option value="33">33</option>
                                    <option value="34">34</option>
                                    <option value="35">35</option>
                                    <option value="36">36</option>
                                    <option value="37">37</option>
                                    <option value="38">38</option>
                                    <option value="39">39</option>
                                    <option value="40">40</option>
                                    <option value="41">41</option>
                                    <option value="42">42</option>
                                    <option value="43">43</option>
                                    <option value="44">44</option>
                                    <option value="45">45</option>
                                    <option value="46">46</option>
                                    <option value="47">47</option>
                                    <option value="48">48</option>
                                    <option value="49">49</option>
                                    <option value="50">50</option>
                                    <option value="51">51</option>
                                    <option value="52">52</option>
                                    <option value="53">53</option>
                                    <option value="54">54</option>
                                    <option value="55">55</option>
                                    <option value="56">56</option>
                                    <option value="57">57</option>
                                    <option value="58">58</option>
                                    <option value="59">59</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="2"><span class="color_c00000">★僅查詢30天內之問題。</span></td>
                        </tr>
                        <tr style="display: none;">
                            <td valign="middle" colspan="2">
                                <asp:FileUpload ID="FileUpload1" runat="server" Visible="false" />
                                (圖檔大小限：500K)</td>
                        </tr>
                        <tr>
                            <th valign="middle" colspan="2">問題內容：</th>
                        </tr>
                        <tr>

                            <td valign="middle" colspan="2" style="padding:10px;">
                                <textarea id="TextContent" runat="server" name="txtcontent" cols="20" rows="20"></textarea></td>
                        </tr>
                        <tr>
                            <td align="center" valign="middle" colspan="2" style="padding:10px 0;">
                                <asp:LinkButton ID="HLSend" runat="server" CssClass="btn">發佈通報</asp:LinkButton>
                            </td>
                        </tr>
                </table>

            </div>
        </div>
    </div>
</asp:Content>

