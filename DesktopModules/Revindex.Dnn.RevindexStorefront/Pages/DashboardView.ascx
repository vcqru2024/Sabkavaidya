<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashboardView.ascx.cs" Inherits="Revindex.Dnn.RevindexStorefront.Pages.DashboardView" %>
<asp:UpdatePanel ID="ContentUpdatePanel" runat="server">
    <ContentTemplate>
        <asp:PlaceHolder ID="ContentPlaceHolder" runat="server"></asp:PlaceHolder>
    </ContentTemplate>
</asp:UpdatePanel>
