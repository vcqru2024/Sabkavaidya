<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickOrderConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.QuickOrderConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("QuickOrderHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="QuickOrderDisplayTemplateLabelControl" runat="server"/>
			<uc1:DisplayTemplateDropDownListControl ID="QuickOrderDisplayTemplateDropDownListControl" runat="server"/>
			<asp:LinkButton ID="QuickOrderDisplayTemplateLinkButton" runat="server" OnClick="QuickOrderDisplayTemplateLinkButton_Click" CausesValidation="False" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:LinkButton>
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
