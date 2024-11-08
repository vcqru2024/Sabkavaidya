<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnalyticsConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.AnalyticsConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("AnalyticsHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="AnalyticsGoogleActiveLabelControl" runat="server" />
			<asp:CheckBox ID="AnalyticsGoogleActiveCheckBox" runat="server" />
		</div>
	</fieldset>
	<div class="row rvdsf-footerbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" ValidationGroup="DetailsViewControl" CssClass="btn btn-primary rvdSaveAction" />
        </div>
    </div>
</div>
