<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookingControl.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.BookingControl" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Assembly="Revindex.Web.UI.WebControls" Namespace="Revindex.Web.UI.WebControls" TagPrefix="rvd1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="WebUserControls/Common/Dnn/BackControl.ascx" TagName="BackControl" TagPrefix="uc1" %>
<%@ Register Src="WebUserControls/Common/Dnn/BreadcrumbControl.ascx" TagName="BreadcrumbControl" TagPrefix="uc1" %>

<script type="text/javascript">	
    // Bind Kendo UI
    Sys.Application.add_load(function () {
        kendo.culture(Revindex.Portal.CultureCode)
        kendo.bind($(".rvdsf-content-container"))
    })
</script>
<div>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<h2><%= LocalizeString("BookingsHeader") %></h2>
			<asp:Panel ID="SearchPanel" runat="server" CssClass="rvdsfSearchContainer">
				<fieldset>
					<div class="dnnFormItem">
						<dnn1:LabelControl runat="server" ID="SellerSearchLabelControl"></dnn1:LabelControl>
                        <asp:TextBox ID="SellerSearchTextBox" runat="server" style="width:100%" data-role="combobox" data-clear-button="true" data-text-field="Name" data-value-field="SellerID" 
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
                            data-auto-bind="false" data-filter="contains" data-min-length="2" OnTextChanged="SellerSearchTextBox_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
					</div>
				</fieldset>
			</asp:Panel>
			<div class="rvdsfListContainer">
                <asp:Panel ID="BookingPanel" runat="server" style="height: 640px" ></asp:Panel>
                <asp:LinkButton ID="BookingNavigateLinkButton" runat="server" OnClick="BookingNavigateLinkButton_Click"></asp:LinkButton>
                <asp:HiddenField ID="BookingNavigateVisibleStartDateHiddenField" runat="server" />
                <asp:HiddenField ID="BookingNavigateVisibleStopDateHiddenField" runat="server" />
                <asp:HiddenField ID="BookingNavigateDateHiddenField" runat="server" />
                <asp:HiddenField ID="BookingNavigateViewHiddenField" runat="server" />
                
                <script id="event-template" type="text/x-kendo-template">
                    <div class="k-event-template rvdsf-salesorderdetail-status-#: status #" style="height: 100%">
                        <a href="#: href #" style="color: white"><strong>#: product #</strong></a> <span class="badge badge-secondary">\\##: salesordernumber #</span> <span class="badge badge-secondary">#: quantity #</span> 
                    </div>
                </script>
                <script>
                    var rvdsfSchedulerNavigateFired = false;

                    // BUG: Cannot bind directly using attribute because the date header does not print. Must use javascript to initialize scheduler
                    // See https://www.telerik.com/forums/missing-date-range-in-toolbar
                    Sys.Application.add_load(function () {
                        $("#<%= BookingPanel.ClientID %>").kendoScheduler({
                            eventTemplate: $("#event-template").html(),
                            editable: false,
                            selectable: true,
                            footer: false,
                            views: eval($("#<%= BookingPanel.ClientID %>").data("views")),
                            date: $("#<%= BookingPanel.ClientID %>").data("date"),
                            dataSource: {
                                data: $("#<%= BookingPanel.ClientID %>").data("source")
                            },
                            change: function(e) {
                                        if(e.events.length > 0)
                                        location.href = e.events[0].href
                                    },
                            navigate: function(e) {
                                        rvdsfSchedulerNavigateFired = true
                                    },
                            dataBinding: function(e) {
                                            if(e.action === "rebind" && rvdsfSchedulerNavigateFired) {
                                                rvdsfSchedulerNavigateFired = false

                                                $("#<%= BookingNavigateViewHiddenField.ClientID %>").val(e.sender.view().options.name)
                                                $("#<%= BookingNavigateVisibleStartDateHiddenField.ClientID %>").val(e.sender.view().startDate().getFullYear() + "-" + (e.sender.view().startDate().getMonth() + 1) + "-" + e.sender.view().startDate().getDate() + " 00:00:00")
                                                $("#<%= BookingNavigateVisibleStopDateHiddenField.ClientID %>").val(e.sender.view().endDate().getFullYear() + "-" + (e.sender.view().endDate().getMonth() + 1) + "-" + e.sender.view().endDate().getDate() + " 23:59:59")
                                                $("#<%= BookingNavigateDateHiddenField.ClientID %>").val(e.sender.date().getFullYear() + "-" + (e.sender.date().getMonth() + 1) + "-" + e.sender.date().getDate() + " 00:00:00")
                                                __doPostBack('<%=BookingNavigateLinkButton.ClientID.Replace("_", "$") %>', "")
                                            }
                                    } 
                        });
                    })
                </script>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

