﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageRegisterSettings.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ManageRegisterSettings" %>
<%@ Register Src="~/Controls/labelcontrol.ascx" TagName="LabelControl" TagPrefix="dnn1" %>
<%@ Register Src="DisplayTemplateDropDownListControl.ascx" TagName="DisplayTemplateDropDownListControl" TagPrefix="uc1" %>
<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
<div>
	<fieldset>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="OverrideDisplayTemplateLabelControl" runat="server" Text="Display template" HelpText="Select a custom display template to associate to this module instance. This setting will override any configured template at configuration level. Leave blank to use the default configured template."/>
			<uc1:DisplayTemplateDropDownListControl ID="DisplayTemplateDropDownList" runat="server" />
		</div>
		<div class="dnnFormItem">
			<dnn1:LabelControl ID="ManageRegisterKeyLabelControl" runat="server" Text="Sales register key" />
			<asp:TextBox ID="ManageRegisterKeyTextBox" runat="server" ></asp:TextBox>
		</div>
	</fieldset>
</div>
<script type="text/javascript">
    
    Sys.Application.add_init(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function () {
            var key = '<%= Revindex.Business.Revindex.Revindex.Storefront.Global.CookieKeys.ManageRegisterKey + "|" + this.PortalId %>'
            $("input[id$='ManageRegisterKeyTextBox']").val(dnn.dom.getCookie(key))
        })
    });

    Sys.Application.add_init(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
            var key = '<%= Revindex.Business.Revindex.Revindex.Storefront.Global.CookieKeys.ManageRegisterKey + "|" + this.PortalId %>'
            dnn.dom.setCookie(key, $("input[id$='ManageRegisterKeyTextBox']").val(), 100000000, '/')
        })
    });
</script>