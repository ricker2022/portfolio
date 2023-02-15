<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="care.aspx.cs" Inherits="about" %>
<%@ Register Src="~/_uc/ADbannerC.ascx" TagPrefix="uc1" TagName="ADbannerC" %>
<%@ Register Src="~/_uc/ADbannerCm.ascx" TagPrefix="uc1" TagName="ADbannerCm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="_css/AD.css" rel="stylesheet" />
    <script src="_js/jquery-1.4.2.min.js"></script>
    <script src="_js/ADbannerBm.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="main">
        <section>
            <div id="pageTitle">員工關懷</div>
            <div class="dContent pageBorder dCont980 dContMobile mainPageMargin">
                <div class="conConten conTxt">
                    <!--↓↓輪播廣告特效↓↓-->
                    <div id="dSlideshowC">
                        <uc1:ADbannerC runat="server" ID="ADbannerC" />
                    </div>
                    <div id="dSlideshowCM">
                        <uc1:ADbannerCm runat="server" ID="ADbannerCm" />
                    </div>
                    <!--↑↑輪播廣告特效↑↑-->
                    <div class="careTxt blackTitle contactTitle">成立員工福委會，持續為員工量身打造各項福利措施是我們的目標。期許每位員工在忙碌工作之餘，也能兼顧身心靈發展，以「努力工作．快樂過活」精神，帶來更健康更優質的生活品味！</div>
                    <br /><br />
                    <ul class="careUL">
                        <li class="orengTitle CDtop orengTitleM">休假制度</li>
                        <li class="careliheight">實行週休二日（需輪班單位除外）</li>
                        <li class="orengTitle CDtop orengTitleM">保險</li>
                        <li class="careliheight">提供勞保、健保、團保的保險制度，使同仁有更完善的安全保障。</li>
                        <li class="orengTitle CDtop orengTitleM">健康</li>
                        <li class="careliheight">定期辦理健康檢查，維繫同仁身心平衡發展。</li>
                        <li class="orengTitle CDtop orengTitleM">福利</li>
                        <li class="careliheight">免費提供午餐、員工進修補助、年終尾牙、婚喪喜慶補助金、住院慰問金、三節禮券（勞動節、端午節、中秋節）、員工聚餐、多元社團活動、生日禮券、員工旅遊等。</li>
                        <li class="orengTitle CDtop orengTitleM">社團活動</li>
                        <li class="careliheight">不定期舉辦讀書會、壘球、保齡球、高爾夫球、羽毛球、漆彈射擊、烤肉焢窯等免費活動。</li>
                        <li class="orengTitle CDtop orengTitleM">意見交流與溝通</li>
                        <li class="careliheight">各部門設立意見信箱與申訴處理制度，傾聽同仁的需求與心聲，提供更完善的溝通管道。</li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

