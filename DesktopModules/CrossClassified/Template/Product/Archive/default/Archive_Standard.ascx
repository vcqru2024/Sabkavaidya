<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Archive.ascx.cs" Inherits="Cross.Modules.CP_Product.View.Archive" %>
<table>
    <tr>
        <td>
            <asp:Label ID="lblArchive" runat="server" CssClass="SubHead" ResourceKey="lblArchive"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Calendar ID="calMonth" runat="server" CssClass="Normal" DayHeaderStyle-CssClass="Product_Archive_DayHeader"
                DayStyle-CssClass="Product_Archive_Day" NextPrevStyle-CssClass="Product_Archive_NextPrev"
                OtherMonthDayStyle-CssClass="Product_Archive_OtherMonth" SelectedDayStyle-CssClass="Product_Archive_SelectedDay"
                SelectorStyle-CssClass="Product_Archive_Selector" TitleStyle-CssClass="Product_Archive_Title"
                TodayDayStyle-CssClass="Product_Archive_TodayDay" WeekendDayStyle-CssClass="Product_Archive_WeekendDay"
                OnSelectionChanged="calMonth_SelectionChanged" OnVisibleMonthChanged="calMonth_VisibleMonthChanged">
                <TodayDayStyle CssClass="Product_Archive_TodayDay"></TodayDayStyle>
                <SelectorStyle CssClass="Product_Archive_Selector"></SelectorStyle>
                <DayStyle CssClass="Product_Archive_Day"></DayStyle>
                <NextPrevStyle CssClass="Product_Archive_NextPrev"></NextPrevStyle>
                <DayHeaderStyle CssClass="Product_Archive_DayHeader"></DayHeaderStyle>
                <SelectedDayStyle CssClass="Product_Archive_SelectedDay"></SelectedDayStyle>
                <TitleStyle CssClass="Product_Archive_Title"></TitleStyle>
                <WeekendDayStyle CssClass="Product_Archive_WeekendDay"></WeekendDayStyle>
                <OtherMonthDayStyle CssClass="Product_Archive_OtherMonth"></OtherMonthDayStyle>
            </asp:Calendar>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMonthly" runat="server" CssClass="SubHead" ResourceKey="lblMonthly">Monthly</asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="dlArchiveMonths" runat="server" Width="100%" CellPadding="0" CellSpacing="0"
                BorderWidth="0" OnItemDataBound="dlArchiveMonths_ItemDataBound">
                <ItemTemplate>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
                        <tr>
                            <td align="left">
                                <asp:HyperLink runat="server" ID="lnkMonthYear"></asp:HyperLink>
                            </td>
                            <td align="right">
                                <asp:HyperLink ImageUrl="~/desktopmodules/CrossClassified/Images/feed-icon-12x12.gif"
                                    runat="server" ID="lnkProductRSS" Visible="False" Target="_blank"></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
