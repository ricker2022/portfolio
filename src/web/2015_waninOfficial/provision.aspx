<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="provision.aspx.cs" Inherits="about" %>

<%@ Register Src="~/provision/user/tw/20141125.ascx" TagPrefix="uc1" TagName="Unknown" %>
<%@ Register Src="~/provision/privacy/tw/20120215.ascx" TagPrefix="uc2" TagName="Unknown" %>
<%@ Register Src="~/provision/personal/tw/20150603.ascx" TagPrefix="uc3" TagName="Unknown" %>
<%@ Register Src="~/provision/partners/tw/20141125.ascx" TagPrefix="uc4" TagName="Unknown" %>
<%@ Register Src="~/provision/user/ch/20141125.ascx" TagPrefix="uc5" TagName="Unknown" %>
<%@ Register Src="~/provision/privacy/ch/20141125.ascx" TagPrefix="uc6" TagName="Unknown" %>
<%@ Register Src="~/provision/personal/ch/20150603.ascx" TagPrefix="uc7" TagName="Unknown" %>
<%@ Register Src="~/provision/partners/ch/20141125.ascx" TagPrefix="uc8" TagName="Unknown" %>
<%@ Register Src="~/provision/user/en/20141125.ascx" TagPrefix="uc9" TagName="Unknown" %>
<%@ Register Src="~/provision/privacy/en/20120215.ascx" TagPrefix="uc10" TagName="Unknown" %>
<%@ Register Src="~/provision/partners/en/20141125.ascx" TagPrefix="uc11" TagName="Unknown" %>
<%@ Register Src="~/provision/personal/tw/20140819.ascx" TagPrefix="uc12" TagName="Unknown" %>














<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #scProv, #enProv  {
            display: none;
        }
    </style>

    <script type="text/javascript">
        var tabName = ['', '使用者合約', '隱私權條款', '個人資料使用同意書', '廠商條款', '使用者合约', '隐私权条款', '个人资料使用同意书', '厂商服务条款', 'User Agreement', 'Privacy Policy', '個人資料使用同意書', 'Terms of Partners'];
        var nowLeng = '<%= language%>';
        var nowTab = '<%= provNo%>';
        var nowMenu = '<%= menuNo%>';

        $(function () {
            $('#scProv,#enProv,#tcProv').find('.proContent').each(function () {
                if($(this).index() > 1){
                    $(this).hide();
                }
            });

            changeLang(nowLeng, nowTab);
        });
        var nowVersion = 1;
        function changeLang(lang, tab) {
            $('#scProv,#enProv,#tcProv').hide();
            $('.menu1,.menu2,.menu3,.menu4,.TCli,.SCli,.ENli').css('display', 'inline');

            $('.menu1').text(tabName[1 + parseInt(tab)]).attr('onclick', 'showDiv("' + '#tab' + (1 + parseInt(tab)) + '",1)');
            $('.menu2').text(tabName[2 + parseInt(tab)]).attr('onclick', 'showDiv("' + '#tab' + (2 + parseInt(tab)) + '",2)');
            $('.menu3').text(tabName[3 + parseInt(tab)]).attr('onclick', 'showDiv("' + '#tab' + (3 + parseInt(tab)) + '",3)');
            $('.menu4').text(tabName[4 + parseInt(tab)]).attr('onclick', 'showDiv("' + '#tab' + (4 + parseInt(tab)) + '",4)');
            if (lang == 'tc') {
                $('#tcProv').show();
                $('.TCli').hide();
            }
            if (lang == 'sc') {
                $('#scProv').show();
                $('.SCli').hide();
            }
            if (lang == 'en') {
                $('#enProv').show();
                $('.menu3,.ENli').hide();
                nowVersion = nowVersion == 3 ? 1 : nowVersion;
            }
            showDiv('#tab' + (nowVersion + parseInt(tab)));
        }
        function showDiv(d, version) {
            if (version != undefined) {
                nowVersion = parseInt(version);
            }
            $('#tab1,#tab2,#tab3,#tab4,#tab5,#tab6,#tab7,#tab8,#tab9,#tab10,#tab12').hide();
            $(d).show();
        }

        function versionChange(no, tab) {
            $(tab + ' .proContent').hide();
            $(tab + ' .proContent').eq($(no).val()).show();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main">
        <section>
            <div id="pageTitle">相關法務條款</div>
            <div class="dContent pageBorder dCont980 dContMobile">
                <div class="conConten conContenP conTxt">
                    <div id="topArea">
                        <ul class="toplink">
                            <li><a style="margin: 0;" href="#" class="menu1">使用者合約</a></li>
                            <li><a href="#" class="menu2">隱私權條款</a></li>
                            <li><a href="#" class="menu3">個人資料使用者合同意書</a></li>
                            <li><a href="#" class="menu4">廠商條款</a></li>
                        </ul>
                        <ul class="prvLang">
                            <li class="TCli" style="display: none;">
                                <button class="TC" type="button" onclick="changeLang('tc' , 0)">繁 體</button></li>
                            <li class="SCli">
                                <button class="SC" type="button" onclick="changeLang('sc' , 4)">简 体</button></li>
                            <li class="ENli">
                                <button class="EN" type="button" onclick="changeLang('en' , 8)">English</button></li>
                        </ul>
                    </div>
                    <div id="topAreaM">
                        <ul class="toplink">
                            <li><a href="#" class="menu1">使用者合約</a></li>
                            <li><a href="#" class="menu2">隱私權條款</a></li>
                            <li><a href="#" class="menu3">個人資料使用者合同意書</a></li>
                            <li><a href="#" class="menu4">廠商條款</a></li>
                        </ul>
                        <ul class="prvLang">
                            <li class="TCli" style="display: none;">
                                <button class="TC" type="button" onclick="changeLang('tc' , 0)">繁 體</button></li>
                            <li class="SCli">
                                <button class="SC" type="button" onclick="changeLang('sc' , 4)">简 体</button></li>
                            <li class="ENli">
                                <button class="EN" type="button" onclick="changeLang('en' , 8)">English</button></li>
                        </ul>
                    </div>
                    <div class="proContent">
                        <ul id="tcProv">
                            <li id="tab1">
                                <uc1:Unknown runat="server" ID="Unknown" />
                            </li>
                            <li id="tab2">
                                <uc2:Unknown runat="server" ID="Unknown1" />
                            </li>
                            <li id="tab3">
                                <select id="tab3Version" onchange="versionChange('#tab3Version','#tab3')" style="width:100%;">
                                    <option value="0">2015年06月03日  第一次修訂</option>
                                    <option value="1">本個人資料使用同意書自2014年08月19日公佈</option>
                                </select>
                                <uc3:Unknown runat="server" ID="Unknown2" ClientIDMode="Static" />
                                <uc12:Unknown runat="server" ID="Unknown11" ClientIDMode="Static" />
                            </li>
                            <li id="tab4">
                                <uc4:Unknown runat="server" ID="Unknown3" />
                            </li>
                        </ul>

                        <%--簡體版--%>
                        <ul id="scProv">
                            <li id="tab5">
                                <uc5:Unknown runat="server" ID="Unknown4" />
                            </li>
                            <li id="tab6">
                                <uc6:Unknown runat="server" ID="Unknown5" />
                            </li>
                            <li id="tab7">
                                <uc7:Unknown runat="server" ID="Unknown6" />
                            </li>
                            <li id="tab8">
                                <uc8:Unknown runat="server" ID="Unknown7" />
                            </li>
                        </ul>

                        <%--英文版--%>
                        <ul id="enProv">
                            <li id="tab9">
                                <uc9:Unknown runat="server" ID="Unknown8" />
                            </li>
                            <li id="tab10">
                                <uc10:Unknown runat="server" ID="Unknown9" />
                            </li>
                            <li id="tab12">
                                <uc11:Unknown runat="server" ID="Unknown10" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

