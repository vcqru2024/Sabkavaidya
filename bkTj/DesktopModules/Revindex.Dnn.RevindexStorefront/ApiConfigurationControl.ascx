<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ApiConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ApiConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("APIHeader") %></h2>
<div>
	<hr />
	<div class="alert alert-warning">
	<%= LocalizeString("BackupWarningMessageLabel") %></div>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ApiUrlLabelControl" runat="server" />
			<asp:HyperLink ID="ApiUrlHyperLink" runat="server" Target="_blank" style="word-break: break-all"></asp:HyperLink>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="UsernameLabelControl" runat="server" />
			<asp:Label ID="UsernameLabel" runat="server"></asp:Label>
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ApiKeyLabelControl" runat="server" />
			<asp:Label ID="ApiKeyLabel" runat="server"></asp:Label> <asp:LinkButton ID="ResetLinkButton" resourcekey="ResetLinkButton" runat="server" OnClick="ResetLinkButton_Click" CssClass="btn btn-default btn-light"></asp:LinkButton>
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />                    
        </div>
    </div>
</div>
