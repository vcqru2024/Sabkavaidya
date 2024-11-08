<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Slideshow.ascx.cs" Inherits="Cross.Modules.CP_Product.View.Slideshow" %>
<asp:Literal runat="server" id="litHighSlideCss"/>
<asp:Literal runat="server" id="litCss"/>

<div id="divFlowContainer">
    <div runat="server" id="divImageFlow" class="imageflow" style="<%# Settings_Slideshow.Flow.GalleryStyle %>" visible="false">
        <asp:Literal ID="litImageFlow" runat="server"></asp:Literal>
    </div>
</div>
  
  <div id="divUnsliderContainer">
    <div runat="server" id="divUnslider" class="unslider"  visible="false">
        <asp:Literal ID="litUnslider" runat="server"></asp:Literal>
    </div>
</div>

<div id="divSlidorionContainer">
    <div runat="server" id="divSlidorion" class="slidorion"  visible="false" 
    style='<%#GetSlidorionStyle()%>'>
        <asp:Literal ID="litSlidorion" runat="server"></asp:Literal>
    </div>
</div>

<div id="divLiteAccordionContainer">
    <div runat="server" id="divLiteAccordion"  visible="false">
        <asp:Literal ID="litLiteAccordion" runat="server"></asp:Literal>
    </div>
</div>

<div id="divNumericRotatorContainer">
    <div runat="server" id="divNumericRotator" visible="false" class="Pixviewer">
        <div class="PvBigPic" id="BigPic_cont_m_0">
            <a></a>
        </div>
        <div class="PvNumber" id="Number_cont_m_0">
        </div>
        <div class="PvNumberBg" id="NumberBG_cont_m_0">
        </div>
        <div class="PvTitleBox" id="Title_cont_m_0" style="background: #ccc">
        </div>
        <div id="focusData_cont_m_0" style="display: none">
            <asp:Literal ID="litNumericRotatorContent" runat="server"></asp:Literal>
        </div>
    </div>
     <asp:Literal ID="litNumericRotatorScript" runat="server"></asp:Literal>
</div>



<div id="divBootstrapCarousel">
<asp:Literal ID="litBootstrapCarousel" runat="server"></asp:Literal>
</div>

<div id="divGalleria" runat="server" visible="false">
<asp:Literal ID="litGalleria" runat="server"></asp:Literal>
</div>

<div id="divPgwGallery" runat="server" visible="false">
<asp:Literal ID="litPgwGalleryContent" runat="server"></asp:Literal>
<asp:Literal ID="litPgwGalleryScript" runat="server"></asp:Literal>
</div>

<div id="divPgwSlider" runat="server" visible="false">
<asp:Literal ID="litPgwSliderContent" runat="server"></asp:Literal>
<asp:Literal ID="litPgwSliderScript" runat="server"></asp:Literal>
</div>

<div id="divOwlCarousel" runat="server" visible="false" class="owl-carousel">
<asp:Literal ID="litOwlCarouselContent" runat="server"></asp:Literal>
<asp:Literal ID="litOwlCarouselScript" runat="server"></asp:Literal>
</div>
<div id="divRevolutionSlider" runat="server" visible="false" class="fullwidthbanner">
<asp:Literal ID="litRevolutionSliderContent" runat="server"></asp:Literal>

<div class="tp-bannertimer tp-bottom bgcolor"></div>
<asp:Literal ID="litRevolutionSliderScript" runat="server"></asp:Literal>
</div>