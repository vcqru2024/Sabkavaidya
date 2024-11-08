<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LicenseSetControl.ascx.cs" Inherits="Revindex.Web.UI.WebUserControls.Dnn.LicenseSetControl" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<div>
	<asp:GridView ID="LicenseGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowSorting="False" AutoGenerateColumns="False" AllowPaging="False" OnSelectedIndexChanged="LicenseGridView_SelectedIndexChanged" DataKeyNames="ProductLicenseGUID" OnRowDeleting="LicenseGridView_RowDeleting" OnRowDataBound="LicenseGridView_RowDataBound">
		<PagerStyle CssClass="dnnGridPager" />
		<Columns>
			<asp:TemplateField HeaderText="GUID">
				<ItemTemplate>
					<asp:LinkButton ID="SelectLinkButton" runat="server" Text='<%# Eval("ProductLicenseGUID") %>' CommandName="Select" OnClientClick="event.stopPropagation()" ></asp:LinkButton>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:BoundField DataField="ProductName" HeaderText="Product name" />
			<asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
			<asp:TemplateField HeaderStyle-Width="10%">
				<ItemTemplate>
					<asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?')" > X</asp:LinkButton>
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
	</asp:GridView>
	<div class="row rvdsf-actionbar-container">
        <div class="col-sm-6">
                                
        </div>
        <div class="col-sm-6 text-sm-right">
            <asp:LinkButton ID="AddLinkButton" runat="server" OnClick="AddLinkButton_Click" CssClass="btn btn-primary dnnPrimaryAction">Add new</asp:LinkButton></li>
        </div>
    </div>
	<asp:PlaceHolder ID="MessagePlaceHolder" runat="server"></asp:PlaceHolder>
	<asp:Panel ID="DetailsViewPanel" runat="server">
		<fieldset>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductLicenseGUIDLabelControl" runat="server" Text="GUID" />
				<asp:Label ID="ProductLicenseGUIDLabel" runat="server" Text=""></asp:Label>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="LicenseKeyLabelControl" runat="server" Text="License key" CssClass="dnnFormRequired" />
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LicenseKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="LicenseControl">License key is required.</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="LicenseKeyTextBox" CssClass="dnnFormMessage dnnFormError" Text="Invalid license key entered. The license key is a very long string. Please make sure you are entering the actual license key and not the license GUID." ValidationGroup="LicenseControl" ValidationExpression="^[A-Za-z0-9+=/|]{60,}$"></asp:RegularExpressionValidator>
				<asp:TextBox ID="LicenseKeyTextBox" runat="server" Rows="10" TextMode="MultiLine" CssClass="dnnFormRequired"></asp:TextBox>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ProductNameLabelControl" runat="server" Text="Product name" />
				<asp:Label ID="ProductNameLabel" runat="server"></asp:Label>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="EditionLabelControl" runat="server" Text="Edition" />
				<asp:Label ID="EditionLabel" runat="server"></asp:Label>
			</div>
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="VersionLabelControl" runat="server" Text="Version" />
				<asp:Label ID="VersionLabel" runat="server"></asp:Label>
			</div>
			<asp:Panel ID="ActivatedPanel" runat="server" CssClass="dnnFormItem">
				<dnn1:LabelControl ID="ActivatedLabelControl" runat="server" Text="Activated" />
				<asp:CheckBox ID="ActivatedCheckBox" runat="server" Enabled="False" />
			</asp:Panel>
		</fieldset>
		<hr />
		<div class="row rvdsf-actionbar-container">
            <div class="col-sm-6">
                                
            </div>
            <div class="col-sm-6 text-sm-right">
                <asp:LinkButton ID="SaveLinkButton" runat="server" OnClick="SaveLinkButton_Click" Text="Save" ValidationGroup="LicenseControl" CssClass="btn btn-primary dnnPrimaryAction" />
            </div>
        </div>
		<asp:Panel ID="ActivationPanel" runat="server">
			<div class="dnnFormItem">
				<dnn1:LabelControl ID="ActivationLabelControl" runat="server" Text="Activation" />
				<span>This license key requires activation. If you are setting up another instance with a license key that you have already activated for the same machine, use the manual activation step and enter the activation key instead.</span>
			</div>
			<asp:MultiView ID="ActivationMultiView" runat="server" ActiveViewIndex="0">
				<asp:View ID="AutomaticActivationView" runat="server">
					<div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
                                
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:LinkButton ID="ManualActivationLinkButton" runat="server" OnClick="ManualActivationLinkButton_Click" CssClass="btn btn-default">Perform manual activation</asp:LinkButton>
							<asp:LinkButton ID="AutomaticActivateLinkButton" runat="server" OnClick="AutomaticActivateLinkButton_Click" Text="Activate license now" CssClass="btn btn-primary dnnPrimaryAction" />
						</div>
					</div>
				</asp:View>
				<asp:View ID="ManualActivationView" runat="server">
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="ActivationRequestLabelControl" runat="server" Text="Activation request" />
						<asp:TextBox ID="ActivationRequestTextBox" runat="server" BackColor="#EEEEEE" ReadOnly="True" Rows="5" TextMode="MultiLine"></asp:TextBox>
					</div>
					<div class="dnnFormItem">
						<dnn1:LabelControl ID="ActivationKeyLabelControl" runat="server" Text="Activation key" CssClass="dnnFormRequired" />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ActivationKeyTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="ManualActivationControl">Activation key is required.</asp:RequiredFieldValidator>
						<asp:TextBox ID="ActivationKeyTextBox" runat="server" Rows="5" TextMode="MultiLine" CssClass="dnnFormRequired"></asp:TextBox>
					</div>
					<div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
                                
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:LinkButton ID="AutomaticActivationLinkButton" runat="server" OnClick="AutomaticActivationLinkButton_Click" CssClass="btn btn-default">Use instant activation</asp:LinkButton>
							<asp:LinkButton ID="ManualActivateLinkButton" runat="server" OnClick="ManualActivateLinkButton_Click" Text="Activate" ValidationGroup="ManualActivationControl" CssClass="btn btn-primary dnnPrimaryAction" />
						</div>
					</div>
				</asp:View>
			</asp:MultiView>
		</asp:Panel>
	</asp:Panel>
</div>
