<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageFavoriteConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ManageFavoriteConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("ManageFavoriteHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ManageFavoriteDisplayTemplateLabelControl" runat="server" />
			<uc1:DisplayTemplateDropDownListControl ID="ManageFavoriteDisplayTemplateDropDownListControl" runat="server" />
			<asp:LinkButton ID="ManageFavoriteDisplayTemplateLinkButton" runat="server" OnClick="ManageFavoriteDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
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
