<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChannelConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ChannelConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ChannelsHeader") %></h2>

<script type="text/javascript">
	jQuery(function($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>

<asp:Panel ID="DetailsViewPanel" runat="server">
	<h2 id="eBayFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("EbayHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ChannelSaleseBayActiveLabelControl" runat="server" />
			<asp:CheckBox ID="ChannelSaleseBayActiveCheckBox" runat="server" />
			<asp:HyperLink ID="ChannelProviderHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
		</div>
	</fieldset>
	<h2 id="FacebookFormSectionHead" class="dnnFormSectionHead"><a href="#" class="dnnSectionExpanded"><%= LocalizeString("FacebookHeader") %></a></h2>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ChannelSalesFacebookActiveLabelControl" runat="server" />
			<asp:CheckBox ID="ChannelSalesFacebookActiveCheckBox" runat="server" />
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
        </div>
    </div>
</asp:Panel>
