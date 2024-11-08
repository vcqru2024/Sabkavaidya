<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MachineConfigurationControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.MachineConfigurationControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<h2><%= LocalizeString("MachineHeader") %></h2>
<div>
	<hr />
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="MachineProviderLabelControl" runat="server" />
			<asp:DropDownList ID="MachineProviderDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="MachineProviderDropDownList_SelectedIndexChanged">
                <asp:ListItem Text="OpenAI" Value="OpenAI" />
			</asp:DropDownList>
			<asp:HyperLink ID="MachineProviderHyperLink" runat="server" style="display: inline-block" ><em class="glyphicon glyphicon-edit fa fas fa-edit"></em> <%= LocalizeString("EditLink") %></asp:HyperLink>
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
