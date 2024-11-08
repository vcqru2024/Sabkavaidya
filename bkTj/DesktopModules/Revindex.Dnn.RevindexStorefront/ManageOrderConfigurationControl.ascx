<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageOrderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ManageOrderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ManageOrderHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ManageOrderDisplayTemplateLabelControl" runat="server" />
			<uc1:DisplayTemplateDropDownListControl ID="ManageOrderDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ManageOrderDisplayTemplateLinkButton" runat="server" OnClick="ManageOrderDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
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
