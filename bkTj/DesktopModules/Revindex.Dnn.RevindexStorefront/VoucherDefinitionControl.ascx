<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoucherDefinitionControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.VoucherDefinitionControl" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Import Namespace="Revindex.Business.Revindex.Revindex.Storefront" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Src="VoucherDefinitionPromotionRuleControl.ascx" TagName="VoucherDefinitionPromotionRuleControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>
<asp:PlaceHolder runat="server">

    <script type="text/javascript">	
        // Bind Kendo UI
        Sys.Application.add_load(function () {
            kendo.culture(Revindex.Portal.CultureCode)
            kendo.bind($(".rvdsf-content-container"))

            $('#VoucherDefinitionDetailsViewTabPanel').dnnTabs();
        })
    </script>

</asp:PlaceHolder>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
            <asp:MultiView ID="ContentMultiView" runat="server">
                <asp:View ID="ListView" runat="server">
                    <h2><%= LocalizeString("VoucherDefinitionsHeader") %></h2>
                    <div class="rvdsfListContainer">
                        <div class="row rvdsf-actionbar-container">
							<div class="col-sm-6">
								
							</div>
							<div class="col-sm-6 text-sm-right">
								<asp:HyperLink ID="AddHyperLink" resourcekey="AddHyperLink" runat="server" CssClass="btn btn-primary rvdAddNewAction" onclick="dnn.dom.deleteCookie('dnnTabs-VoucherDefinitionDetailsViewTabPanel', '/')" />
							</div>
						</div>
                        <asp:GridView ID="VoucherDefinitionGridView" runat="server" CssClass="table table-striped table-hover" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="VoucherDefinitionID" OnRowDeleting="VoucherDefinitionGridView_RowDeleting" OnRowDataBound="VoucherDefinitionGridView_RowDataBound">
                            <PagerStyle CssClass="dnnGridPager" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="SelectHyperLink" runat="server" onclick="event.stopPropagation()" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="StopDate" HeaderText="StopDate" SortExpression="StopDate" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:TemplateField HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()" ><em class="glyphicon glyphicon-remove fa fas fa-trash"></em></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="VoucherDefinitionObjectDataSource" runat="server" EnablePaging="True" SelectCountMethod="GetCount" SelectMethod="GetAll" SortParameterName="sortExpression" TypeName="Revindex.Business.Revindex.Revindex.Storefront.VoucherDefinitionController">
                            <SelectParameters>
                                <asp:Parameter Name="sortExpression" Type="String" />
                                <asp:Parameter Name="maximumRows" Type="Int32" />
                                <asp:Parameter Name="startRowIndex" Type="Int32" />
								<asp:Parameter Name="deleted" Type="Boolean" DefaultValue="false"></asp:Parameter>
                                <rvd1:UserControlParameter Name="portalID" PropertyName="PortalId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </asp:View>
                <asp:View ID="DetailsView" runat="server">
                    <uc1:BackControl ID="QuickBackControl" runat="server" Text="" CssClass="rvdsfBackAction" />
                    <h2><%= LocalizeString("VoucherDefinitionHeader") %>: <uc1:BreadcrumbControl ID="BreadcrumbControl" runat="server" /><asp:Label runat="server" ID="VoucherDefinitionIDLabel" CssClass="badge badge-secondary rvdsf-badge-small"></asp:Label></h2>
                    <div id="VoucherDefinitionDetailsViewTabPanel">
                        <ul class="dnnAdminTabNav dnnClear">
                            <li><a href="#<%= GeneralDetailsViewPanel.ClientID %>">
                                <asp:Label ID="GeneralDetailsViewTabLabel" runat="server" resourcekey="GeneralDetailsViewTabLabel" /></a></li>
                            <li><a href="#<%= PromotionDetailsViewPanel.ClientID %>">
                                <asp:Label ID="PromotionDetailsViewTabLabel" runat="server" resourcekey="PromotionDetailsViewTabLabel" /></a></li>
                        </ul>
                        <asp:Panel ID="GeneralDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="NameLabelControl" runat="server" CssClass="dnnFormRequired" />
                                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="NameTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationExpression="[^;|\[\]&lt;&gt;{}^\\]+" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="NameTextBox" runat="server" MaxLength="100" CssClass="dnnFormRequired"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="DescriptionLabelControl" runat="server" />
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Rows="8" TextMode="MultiLine" MaxLength="4000"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="ActiveLabelControl" runat="server" />
                                    <asp:CheckBox ID="ActiveCheckBox" runat="server" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="AmountLabelControl" runat="server" CssClass="dnnFormRequired"></dnn1:LabelControl>
                                    <asp:RequiredFieldValidator ID="AmountRequiredFieldValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
			                        <asp:CompareValidator ID="AmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Double" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			                        <asp:TextBox ID="AmountTextBox" runat="server" value="" CssClass="rvd-form-number dnnFormRequired" ></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StartDateLabelControl" runat="server" />
                                    <asp:TextBox ID="StartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StopDateTypeLabelControl" runat="server" EnableViewState="False" />
                                    <asp:RadioButtonList ID="StopDateTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="StopDateTypeRadioButtonList_SelectedIndexChanged" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
                                        <asp:ListItem resourcekey="FixedDateLabel" Value="Fixed date" Selected="True"></asp:ListItem>
                                        <asp:ListItem resourcekey="IntervalLabel" Value="Interval"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="StopDateLabelControl" runat="server" EnableViewState="False" HelpText="Enter a fixed stop date or calculated interval when voucher would expire from the issue date. Leave blank date or a zero interval value if voucher is available perpetually." Text="" />
                                    <asp:MultiView ID="StopDateTypeMultiView" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="FixedStopDateView" runat="server">
                                            <asp:TextBox ID="StopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm" />
                                        </asp:View>
                                        <asp:View ID="ExpiryIntervalView" runat="server">
                                            <asp:RequiredFieldValidator ID="ExpiryRequiredFieldValidator" runat="server" ControlToValidate="ExpiryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="ExpiryIntervalRangeValidator" runat="server" ControlToValidate="ExpiryIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                                <asp:CompareValidator ID="ExpiryIntervalCompareValidator" runat="server" ControlToValidate="ExpiryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			                                <asp:TextBox ID="ExpiryIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                            <asp:DropDownList ID="ExpiryIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
                                                <asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
					                            <asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
					                            <asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
					                            <asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
                                            </asp:DropDownList>
                                        </asp:View>
                                    </asp:MultiView>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="MaxRedemptionLabelControl" runat="server"></dnn1:LabelControl>
                                    <asp:RangeValidator ID="MaxRedemptionRangeValidator" runat="server" ControlToValidate="MaxRedemptionTextBox" MinimumValue="1" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                        <asp:CompareValidator ID="MaxRedemptionCompareValidator" runat="server" ControlToValidate="MaxRedemptionTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			                        <asp:TextBox ID="MaxRedemptionTextBox" runat="server" value="" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PaymentLimitTypeLabelControl" runat="server"></dnn1:LabelControl>
                                    <asp:RadioButtonList ID="PaymentLimitTypeRadioButtonList" runat="server" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
                                        <asp:ListItem resourcekey="SubTotalAmountLabel" Value="2" />
                                        <asp:ListItem resourcekey="TotalAmountLabel" Value="1" Selected="True" />
                                    </asp:RadioButtonList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="TransferableLabelControl" runat="server" />
                                    <asp:CheckBox ID="TransferableCheckBox" runat="server" />
                                </div>
                            </fieldset>
                        </asp:Panel>
                        <asp:Panel ID="PromotionDetailsViewPanel" runat="server" CssClass="dnnClear">
                            <fieldset>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PromotionStartDateLabelControl" runat="server" />
                                    <asp:TextBox ID="PromotionStartDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm" />
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PromotionStopDateTypeLabelControl" runat="server" EnableViewState="False" />
                                    <asp:RadioButtonList ID="PromotionStopDateTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="PromotionStopDateTypeRadioButtonList_SelectedIndexChanged" RepeatLayout="Flow" CssClass="dnnFormRadioButtons">
                                        <asp:ListItem resourcekey="FixedDateLabel" Value="Fixed date" Selected="True"></asp:ListItem>
                                        <asp:ListItem resourcekey="IntervalLabel" Value="Interval"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="dnnFormItem">
                                    <dnn1:LabelControl ID="PromotionStopDateLabelControl" runat="server" EnableViewState="False" HelpText="Enter a fixed stop date or calculated interval when promotion would end from the issue date. Leave blank date or a zero interval value if promotion is available perpetually." Text="" />
                                    <asp:MultiView ID="PromotionStopDateTypeMultiView" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="FixedPromotionStopDateView" runat="server">
                                            <asp:TextBox ID="PromotionStopDateTextBox" runat="server" placeholder="YYYY-MM-DD HH:mm" CssClass="rvd-form-datetime" data-role="datetimepicker" data-format="yyyy-MM-dd HH:mm" />
                                        </asp:View>
                                        <asp:View ID="PromotionExpiryIntervalView" runat="server">
                                            <asp:RequiredFieldValidator ID="PromotionExpiryRequiredFieldValidator" runat="server" ControlToValidate="PromotionExpiryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="PromotionExpiryIntervalRangeValidator" runat="server" ControlToValidate="PromotionExpiryIntervalTextBox" MinimumValue="0" MaximumValue="2147483647" CssClass="dnnFormMessage dnnFormError" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:RangeValidator>
			                                <asp:CompareValidator ID="PromotionExpiryIntervalCompareValidator" runat="server" ControlToValidate="PromotionExpiryIntervalTextBox" CssClass="dnnFormMessage dnnFormError" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ValidationGroup="DetailsViewControl"><%= Localization.GetString(Global.LocalizedStrings.Message_FieldRequiredError, Global.FilePaths.LocalSharedResourceFile) %></asp:CompareValidator>
			                                <asp:TextBox ID="PromotionExpiryIntervalTextBox" runat="server" value="" CssClass="dnnFormRequired" TextMode="Number"></asp:TextBox>
                                            <asp:DropDownList ID="PromotionExpiryIntervalTypeDropDownList" runat="server" CssClass="rvdUnitInput">
                                                <asp:ListItem Value="1" resourcekey="DayLabel" ></asp:ListItem>
					                            <asp:ListItem Value="2" resourcekey="WeekLabel" ></asp:ListItem>
					                            <asp:ListItem Value="3" resourcekey="MonthLabel" ></asp:ListItem>
					                            <asp:ListItem Value="4" resourcekey="YearLabel" ></asp:ListItem>
                                            </asp:DropDownList>
                                        </asp:View>
                                    </asp:MultiView>
                                </div>
                                <uc1:VoucherDefinitionPromotionRuleControl ID="PromotionRuleControl" runat="server" Width="100%" />
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="row rvdsf-footerbar-container">
                        <div class="col-sm-6">
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" resourcekey="DeleteLinkButton" CssClass="btn btn-default btn-light" CausesValidation="false" OnClick="DeleteLinkButton_Click" OnClientClick="event.stopPropagation(); return Revindex.Web.ConfirmDelete()"></asp:LinkButton>
                        </div>
                        <div class="col-sm-6 text-sm-right">
                            <uc1:BackControl ID="BackControl" runat="server" resourcekey="BackControl" />
                            <asp:LinkButton ID="SaveLinkButton" runat="server" resourcekey="SaveLinkButton" OnClick="SaveLinkButton_Click" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                            <asp:LinkButton ID="SaveAndBackLinkButton" runat="server" resourcekey="SaveAndBackLinkButton" OnClick="SaveLinkButton_Click" CommandArgument="Back" CssClass="btn btn-primary rvdSaveAction" ValidationGroup="DetailsViewControl" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
