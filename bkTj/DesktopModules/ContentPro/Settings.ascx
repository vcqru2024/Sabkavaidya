<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="puresystems.Modules.ContentPro.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>

<!--<h2 id="AdvancedSettings" class="dnnFormSectionHead"><a href="#"><%=LocalizeString("BasicSettings")%></a></h2>
<fieldset>

    <div class="dnnFormItem">
        <dnn:Label ID="lblBootstrap" runat="server" />
        <asp:CheckBox ID="BYes" runat="server" />
    </div>
    <div class="dnnFormItem">
        <dnn:Label ID="Advlbl" runat="server" />
        <asp:CheckBox ID="CAdv" runat="server" />
    </div> 
    <div class="dnnFormItem">
        <dnn:Label ID="lblNumberOfArticles" runat="server" />
        <asp:TextBox ID="NumArttxt" runat="server"></asp:TextBox>
    </div>
     <div class="dnnFormItem">
        <dnn:Label ID="ModuleUrllbl" runat="server" />
         <asp:CheckBox ID="ModuleUrlcheck" runat="server" OnCheckedChanged="ModuleUrlcheck_CheckedChanged" />
    </div>

</fieldset> -->
<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="#"><%=LocalizeString("LicenceSettings")%></a></h2>
<fieldset>
    <div class="dnnFormItem">
        <dnn:label ID="lblSerial" runat="server" />
        <asp:TextBox ID="txtSerial" runat="server" />
        <asp:RequiredFieldValidator ID="valSerialNumber" runat="server" ControlToValidate="txtSerial" ValidationGroup="Validate" resourcekey="valSerialNumber.Error" CssClass="dnnFormMessage dnnFormError"></asp:RequiredFieldValidator>
    </div>
    <!--   <div class="dnnFormItem" runat="server" id="EvaluationButton">
             <dnn:Label ID="Label1" runat="server" /> 
             <asp:LinkButton OnClick="GetEval" runat="server" ID="btnGetEval" resourcekey="GetEvalBtn" CssClass="dnnPrimaryAction"></asp:LinkButton>
        </div>
        <div class="dnnFormItem">
            <dnn:label ID="lblKey" runat="server" />
            <asp:TextBox ID="txtKey" runat="server" ReadOnly="true" />
        </div>  -->
    <div class="dnnFormMessage dnnFormInfo">
        <asp:Literal ID="litLicensingSummary" runat="server"></asp:Literal>
    </div>
    <asp:LinkButton OnClick="ValidateSerialOnClick" runat="server" ID="lbValidate" resourcekey="ValidateSerialBtn" CssClass="dnnPrimaryAction" ValidationGroup="Validate"></asp:LinkButton>
    <asp:LinkButton OnClick="DeactivateLicense" runat="server" ID="btnDeactivate" resourcekey="DeactivateLicenseBtn" CssClass="dnnPrimaryAction"></asp:LinkButton>
</fieldset>




