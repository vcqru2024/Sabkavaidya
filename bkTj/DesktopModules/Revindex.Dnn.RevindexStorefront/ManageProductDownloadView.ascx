<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageProductDownloadView.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.ManageProductDownloadView" %>
<asp:UpdateProgress ID="UpdateProgress" runat="server">
	<ProgressTemplate>
		<div class="rvdUpdateProgressContainer">
			<asp:Image ID="UpdateProgressImage" runat="server" ImageUrl="~/Images/Loading.gif" CssClass="rvdUpdateProgress" />
		</div>
	</ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="ContentUpdatePanel" runat="server">
    <ContentTemplate>
        <asp:PlaceHolder ID="ContentPlaceHolder" runat="server"></asp:PlaceHolder>
    </ContentTemplate>
</asp:UpdatePanel>
