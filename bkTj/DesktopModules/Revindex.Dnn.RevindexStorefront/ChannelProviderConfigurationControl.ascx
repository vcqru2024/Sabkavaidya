<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChannelProviderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ChannelProviderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
<h2><%= LocalizeString("ChannelProviderHeader") %></h2>
<asp:Panel ID="DetailsViewPanel" runat="server">
	<hr />
	<fieldset>
		<asp:MultiView ID="DetailsMultiView" runat="server">
			<asp:View ID="eBayView" runat="server">
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ChannelProvidereBayDevIDLabelControl" runat="server" />
					<asp:TextBox ID="ChannelProviderseBayDevIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ChannelProvidereBayAppIDLabelControl" runat="server" />
					<asp:TextBox ID="ChannelProviderseBayAppIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ChannelProvidereBayCertIDLabelControl" runat="server" />
					<asp:TextBox ID="ChannelProviderseBayCertIDTextBox" runat="server" MaxLength="256"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ChannelProvidereBayAuthTokenLabelControl" runat="server" />
					<asp:TextBox ID="ChannelProviderseBayAuthTokenTextBox" runat="server" MaxLength="2000"></asp:TextBox>
				</div>
				<div class="dnnFormItem">
					<dnn1:LabelControl ID="ChannelProvidereBayTestModeLabelControl" runat="server" />
					<asp:CheckBox ID="ChannelProviderseBayTestModeCheckBox" runat="server"></asp:CheckBox>
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
