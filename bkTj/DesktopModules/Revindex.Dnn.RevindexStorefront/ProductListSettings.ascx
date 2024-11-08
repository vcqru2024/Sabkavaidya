<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListSettings.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ProductListSettings" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<%@ Register Src="CategoryDropDownListControl.ascx" TagName="CategoryDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<div>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="OverrideDisplayTemplateLabelControl" runat="server" Text="Display template" HelpText="Select a custom display template to associate to this module instance. This setting will override any configured template at the configuration level. Leave blank to use the default configured template."/>
			<uc1:DisplayTemplateDropDownListControl ID="DisplayTemplateDropDownList" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="DefaultControlLabelControl" runat="server" Text="Default" />
			<asp:CheckBox ID="DefaultControlCheckBox" runat="server" />
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CustomCategoryIDLabelControl" runat="server" Text="Default category" HelpText="If a category is selected, the Product List module will display products from this category when no other explicit category is requested."/>
            <uc1:CategoryDropDownListControl ID="CustomCategoryDropDownListControl" runat="server" ShowEmptyRoot="true" EmptyText=""/>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CustomManufacturerIDLabelControl" runat="server" Text="Default manufacturer" HelpText="If a manufacturer is selected, the Product List module will display products from this manufacturer when no other explicit manufacturer is requested."/>
            <asp:DropDownList ID="CustomManufacturerDropDownList" runat="server"></asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="CustomDistributorIDLabelControl" runat="server" Text="Default distributor" HelpText="If a distributor is selected, the Product List module will display products from this distributor when no other explicit distributor is requested."/>
            <asp:DropDownList ID="CustomDistributorDropDownList" runat="server"></asp:DropDownList>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CustomSellerIDLabelControl" runat="server" Text="Default seller" HelpText="If a seller is selected, the Product List module will display products from this seller when no other explicit seller is requested."/>
            <asp:DropDownList ID="CustomSellerDropDownList" runat="server"></asp:DropDownList>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="CustomProductFilterLabelControl" runat="server" Text="Default product filter" HelpText="If a product filter is set here, the Product List module will display the filtered products. The filter string follows the same URL encoded format passed in the URL."/>
            <asp:TextBox ID="CustomProductFilterTextBox" runat="server" ></asp:TextBox>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PageViewDisplayOrderLabelControl" runat="server" Text="Page sort" HelpText="Set how products are sorted by default."/>
			<asp:DropDownList ID="PageViewDisplayOrderDropDownList" runat="server" >
                <asp:ListItem Value="" ></asp:ListItem>
				<asp:ListItem Value="1" >Recommended</asp:ListItem>
				<asp:ListItem Value="8" >Newest</asp:ListItem>
				<asp:ListItem Value="9" >Oldest</asp:ListItem>
				<asp:ListItem Value="4" >Lowest Price</asp:ListItem>
				<asp:ListItem Value="5" >Highest Price</asp:ListItem>
				<asp:ListItem Value="2" >Name</asp:ListItem>
				<asp:ListItem Value="3" >Reverse Name</asp:ListItem>
                <asp:ListItem Value="10" >SKU</asp:ListItem>
				<asp:ListItem Value="11" >Reverse SKU</asp:ListItem>
				<asp:ListItem Value="6" >Lowest Ratings</asp:ListItem>
				<asp:ListItem Value="7" >Highest Ratings</asp:ListItem>
			</asp:DropDownList>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="PageViewSizeLabelControl" runat="server" Text="Page size" HelpText="Enter a number to set a default page size."/>
            <asp:TextBox ID="PageViewSizeTextBox" runat="server" TextMode="Number"></asp:TextBox>
		</div>
        <div class="dnnFormItem">
			<dnn1:LabelControl ID="PageViewModeLabelControl" runat="server" Text="Page mode" HelpText="Set how products are displayed by default."/>
			<asp:DropDownList ID="PageViewModeDropDownList" runat="server" >
                <asp:ListItem Value="" ></asp:ListItem>
				<asp:ListItem Value="grid">Grid</asp:ListItem>
				<asp:ListItem Value="list">List</asp:ListItem>
			</asp:DropDownList>
		</div>
	</fieldset>
</div>
