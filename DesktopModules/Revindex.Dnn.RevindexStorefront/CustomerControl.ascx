<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.CustomerControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="UserPaymentControl.ascx" TagName="UserPaymentControl" TagPrefix="uc1" %>
<%@ Register Src="FundControl.ascx" TagName="FundControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder runat="server">

    <script type="text/javascript">
		Sys.Application.add_load(function () {
            kendo.culture(Revindex.Portal.CultureCode)
			kendo.bind($(".rvdsf-content-container"))

            $('#CustomerDetailsViewTabPanel').dnnTabs();
		})
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <h2><%= LocalizeString("CustomersHeader") %></h2>
					<div class="row rvdsf-actionbar-container">
						<div class="col-sm-6">
							<asp:HyperLink ID="ExportAllHyperLink" runat="server" CssClass="btn btn-link rvdExportAction" ><em class="glyphicon glyphicon-export fa fas fa-upload"></em> <%= LocalizeString("ExportAllLink") %></asp:HyperLink>
						</div>
						<div class="col-sm-6 text-sm-right">
							<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-CustomerDetailsViewTabPanel', '/')"/>
						</div>
					</div>
                    <asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchLinkButton" CssClass="rvdsfSearchContainer">
						<fieldset>
							<div class="input-group">
								<asp:TextBox ID="SearchQueryTextBox" runat="server" CssClass="form-control" type="search"></asp:TextBox>
								<div class="input-group-btn input-group-append" >
									<asp:LinkButton ID="ResetLinkButton" runat="server" resourcekey="ResetLinkButton" OnClick="ResetLinkButton_Click" CausesValidation="false" CssClass="btn btn-default btn-outline-secondary rvdResetAction" />
									<asp:LinkButton ID="SearchLinkButton" runat="server" resourcekey="SearchLinkButton" OnClick="SearchLinkButton_Click" CausesValidation="false" CssClass="btn btn-primary rvdSearchAction" />
								</div>
							</div>
						</fieldset>
		            </asp:Panel>
		            <div class="rvdsfListContainer">
			            <asp:GridView ID="CustomerGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" OnSorting="CustomerGridView_Sorting" AutoGenerateColumns="False" DataKeyNames="UserID" OnPageIndexChanging="CustomerGridView_PageIndexChanging" OnRowDataBound="CustomerGridView_RowDataBound">
				            <PagerStyle CssClass="dnnGridPager" />
				            <Columns>
								<asp:TemplateField SortExpression="Username" HeaderText="Username">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" Text='<%# Eval("Username") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
					            <asp:BoundField DataField="FirstName" SortExpression="FirstName" HeaderText="FirstName" />
					            <asp:BoundField DataField="LastName" SortExpression="LastName" HeaderText="LastName" />
					            <asp:BoundField DataField="Email" SortExpression="Email" HeaderText="Email" />
				            </Columns>
			            </asp:GridView>
		            </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction"/>
                    <h2><%= LocalizeString("CustomerHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="CustomerIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
		            <div id="CustomerDetailsViewTabPanel">
			            <ul class="dnnAdminTabNav dnnClear">
				            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
					            <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
				            <li><a href="#<%= TaxesDetailsViewPanel.ClientID %>">
					            <asp:Label ID="TaxesDetailsViewTabLabel" runat="server" resourcekey="TaxesDetailsViewTabLabel" /></a></li>
				            <li><a href="#<%= UserPaymentDetailsViewPanel.ClientID %>">
					            <asp:Label ID="UserPaymentDetailsViewTabLabel" runat="server" resourcekey="UserPaymentDetailsViewTabLabel" /></a></li>
							<li><a href="#<%= FundDetailsViewPanel.ClientID %>">
					            <asp:Label ID="FundDetailsViewTabLabel" runat="server" resourcekey="FundDetailsViewTabLabel" /></a></li>
				            <li><a href="#<%= NotesDetailsViewPanel.ClientID %>">
					            <asp:Label ID="NotesDetailsViewTabLabel" runat="server" resourcekey="NotesDetailsViewTabLabel" /></a></li>
			            </ul>
			            <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
				            <fieldset>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="UsernameLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator" runat="server" ControlToValidate="UsernameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="UsernameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
						            <asp:Label runat="server" ID="UserIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label>
					            </div>
								<asp:Panel ID="PasswordPanel" runat="server" CssClass="dnnFormItem">
						            <dnn1:LabelControl ID="PasswordLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="PasswordTextBox" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
						            <asp:Label runat="server" ID="Label1" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label>
					            </asp:Panel>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="FirstNameLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="FirstNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="FirstNameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="LastNameLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="LastNameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="LastNameTextBox" runat="server" MaxLength="50" CssClass="dnnFormRequired"></asp:TextBox>
					            </div>
								<div class="dnnFormItem">
						            <dnn1:LabelControl ID="EmailLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
									<asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ControlToValidate="EmailTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
									<asp:TextBox ID="EmailTextBox" runat="server" MaxLength="256" TextMode="Email" CssClass="dnnFormRequired"></asp:TextBox>
					            </div>
								<div class="dnnFormItem">
						            <dnn1:LabelControl ID="TelephoneLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="TelephoneTextBox" runat="server" MaxLength="50" ></asp:TextBox>
					            </div>
								<div class="dnnFormItem">
						            <dnn1:LabelControl ID="CountryLabelControl" runat="server"></dnn1:LabelControl>
									<asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="IsoAlpha2Code" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
									</asp:DropDownList>
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="StreetLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="StreetTextBox" runat="server" MaxLength="50" ></asp:TextBox>
					            </div>
								<div class="dnnFormItem">
						            <dnn1:LabelControl ID="UnitLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="UnitTextBox" runat="server" MaxLength="50" ></asp:TextBox>
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="CityLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="CityTextBox" runat="server" MaxLength="50" ></asp:TextBox>
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="RegionLabelControl" runat="server"></dnn1:LabelControl>
									<asp:DropDownList ID="RegionDropDownList" runat="server"></asp:DropDownList>
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="PostalCodeLabelControl" runat="server"></dnn1:LabelControl>
									<asp:TextBox ID="PostalCodeTextBox" runat="server" MaxLength="50" ></asp:TextBox>
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="LastIPAddressLabelControl" runat="server"></dnn1:LabelControl>
						            <asp:Label runat="server" ID="LastIPAddressLabel"></asp:Label>
					            </div>
								<asp:Panel ID="SellerPanel" runat="server" CssClass="dnnFormItem">
				                    <dnn1:LabelControl ID="SellerLabelControl" runat="server" />
									<asp:TextBox ID="SellerTextBox" runat="server" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
										data-source="{
											serverFiltering: true,
											serverPaging: true,
											pageSize: 50,
											transport: {
												read: {
													type: 'POST',
													url: function() { return servicesFramework.getServiceRoot('Revindex.Dnn.RevindexStorefront') + 'Seller/Lookup' },
													   beforeSend: servicesFramework.setModuleHeaders,
													dataType: 'json',
													contentType: 'application/json; charset=UTF-8'
												},
												parameterMap: function (data, type) {
													return kendo.stringify({
														Query: data.filter.filters.length &gt; 0 ? data.filter.filters[0].value : '',
														ItemIndex: 0,
														MaxItems: data.pageSize
													})
												}
											},
											schema: {
												data: function (response) {

													// We need to decycle any circular references because Kendo UI can only support flat structure
													return JSON.decycle(response)
												}
											},
											sort: { field: 'Name', dir: 'asc' }
										}" 
										data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
			                    </asp:Panel>
				            </fieldset>
			            </asp:Panel>
			            <asp:Panel ID="TaxesDetailsViewPanel" runat="server" CssClass="dnnClear">
				            <fieldset>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExempt1Control" runat="server"></dnn1:LabelControl>
						            <asp:CheckBox ID="TaxExempt1CheckBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExemptionNumber1Control" runat="server"></dnn1:LabelControl>
						            <asp:TextBox ID="TaxExemptionNumber1TextBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExempt2Control" runat="server"></dnn1:LabelControl>
						            <asp:CheckBox ID="TaxExempt2CheckBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExemptionNumber2Control" runat="server"></dnn1:LabelControl>
						            <asp:TextBox ID="TaxExemptionNumber2TextBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExempt3Control" runat="server"></dnn1:LabelControl>
						            <asp:CheckBox ID="TaxExempt3CheckBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExemptionNumber3Control" runat="server"></dnn1:LabelControl>
						            <asp:TextBox ID="TaxExemptionNumber3TextBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExempt4Control" runat="server"></dnn1:LabelControl>
						            <asp:CheckBox ID="TaxExempt4CheckBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExemptionNumber4Control" runat="server"></dnn1:LabelControl>
						            <asp:TextBox ID="TaxExemptionNumber4TextBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExempt5Control" runat="server"></dnn1:LabelControl>
						            <asp:CheckBox ID="TaxExempt5CheckBox" runat="server" />
					            </div>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="TaxExemptionNumber5Control" runat="server"></dnn1:LabelControl>
						            <asp:TextBox ID="TaxExemptionNumber5TextBox" runat="server" />
					            </div>
				            </fieldset>
			            </asp:Panel>
			            <asp:Panel ID="UserPaymentDetailsViewPanel" runat="server" CssClass="dnnClear">
				            <fieldset>
								<div ID="UserPaymentUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
					            <uc1:UserPaymentControl ID="UserPaymentControl1" runat="server"></uc1:UserPaymentControl>
				            </fieldset>
			            </asp:Panel>
						<asp:Panel ID="FundDetailsViewPanel" runat="server" CssClass="dnnClear">
				            <fieldset>
								<div ID="FundUnavailableLabel" runat="server" class="alert alert-info"><%= Localization.GetString(Global.LocalizedStrings.Message_SaveChangesRequired, Global.FilePaths.LocalSharedResourceFile) %></div>
					            <uc1:FundControl ID="FundControl1" runat="server"></uc1:FundControl>
				            </fieldset>
			            </asp:Panel>
			            <asp:Panel ID="NotesDetailsViewPanel" runat="server" CssClass="dnnClear">
				            <fieldset>
					            <div class="dnnFormItem">
						            <dnn1:LabelControl ID="AdminNotesLabelControl" runat="server"></dnn1:LabelControl>
						            <asp:TextBox ID="AdminNotesTextBox" runat="server" MaxLength="4000" Rows="10" TextMode="MultiLine"></asp:TextBox>
					            </div>
				            </fieldset>
			            </asp:Panel>
		            </div>
					<div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                                
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl"/>
							<asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
							<asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
	    </ContentTemplate>
    </asp:UpdatePanel>
</div>
