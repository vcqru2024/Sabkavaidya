<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MachineProviderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.MachineProviderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
<h2><%= LocalizeString("MachineProviderHeader") %></h2>

<script type="text/javascript">
	jQuery(function($)
	{
		$('#<%= DetailsViewPanel.ClientID %>').dnnPanels();
	});
</script>

<asp:Panel ID="DetailsViewPanel" runat="server">
	<hr />
	<fieldset>
		<asp:MultiView ID="DetailsMultiView" runat="server">
			<asp:View ID="OpenAIView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="MachineProvidersOpenAIAPIKeyLabelControl" runat="server" />
					<asp:TextBox ID="MachineProvidersOpenAIAPIKeyTextBox" runat="server" MaxLength="255"></asp:TextBox>
				</div>
			</asp:View>
		</asp:MultiView>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
			<uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
			<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
			<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
        </div>
    </div>
</asp:Panel>
