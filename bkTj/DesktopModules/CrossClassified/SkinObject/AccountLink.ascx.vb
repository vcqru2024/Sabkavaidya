Imports Cross.Modules.CP_Product.Business


Namespace Cross.Modules.CP_Product.SkinObject
    Partial Class AccountLink
        Inherits DotNetNuke.UI.Skins.SkinObjectBase

#Region "Private Members"
        Private _showCartLink As Boolean = True
        Private _showOrderLink As Boolean = True
        Private _showProductLink As Boolean = True
        Private _showAuctionLink As Boolean = True
        Private _showAccountLink As Boolean = True
        Private _showHelpLink As Boolean = True
        Private Const MyFileName As String = "AccountLink.ascx"
        'Private _cssClass As String = "Normal"
        Private _cssClass As String = ""
        Private _target As String = "_self"
#End Region

#Region "Public Members"
        Public Property ShowCartLink() As Boolean
            Get
                Return _showCartLink
            End Get
            Set(ByVal Value As Boolean)
                _showCartLink = Value
            End Set
        End Property
        Public Property ShowOrderLink() As Boolean
            Get
                Return _showOrderLink
            End Get
            Set(ByVal Value As Boolean)
                _showOrderLink = Value
            End Set
        End Property

        Public Property ShowProductLink() As Boolean
            Get
                Return _showProductLink
            End Get
            Set(ByVal Value As Boolean)
                _showProductLink = Value
            End Set
        End Property

        Public Property ShowAuctionLink() As Boolean
            Get
                Return _showAuctionLink
            End Get
            Set(ByVal Value As Boolean)
                _showAuctionLink = Value
            End Set
        End Property

        Public Property ShowAccountLink() As Boolean
            Get
                Return _showAccountLink
            End Get
            Set(ByVal Value As Boolean)
                _showAccountLink = Value
            End Set
        End Property
        Public Property ShowHelpLink() As Boolean
            Get
                Return _showHelpLink
            End Get
            Set(ByVal Value As Boolean)
                _showHelpLink = Value
            End Set
        End Property

        Public Property CssClass() As String
            Get
                Return _cssClass
            End Get
            Set(ByVal Value As String)
                _cssClass = Value
            End Set
        End Property
        Public Property Target() As String
            Get
                Return _target
            End Get
            Set(ByVal Value As String)
                _target = Value
            End Set
        End Property
        Public ReadOnly Property Settings_Portal() As Cross.Modules.CP_Product.Business.Setting_Portal
            Get
                Return New Cross.Modules.CP_Product.Business.Setting_Portal(PortalSettings.PortalId)
            End Get

        End Property

        

#End Region

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            If Page.IsPostBack Then Return


            Dim resourceFile As String = Localization.GetResourceFile(Me, MyFileName)
            lblCart.Text = Localization.GetString("lblCart", resourceFile)
            lblOrder.Text = Localization.GetString("lblOrder", resourceFile)
            lblProduct.Text = Localization.GetString("lblProduct", resourceFile)
            lblAuction.Text = Localization.GetString("lblAuction", resourceFile)
            lblAccount.Text = Localization.GetString("lblAccount", resourceFile)
            lblHelp.Text = Localization.GetString("lblHelp", resourceFile)

            If Not String.IsNullOrEmpty(CssClass) Then
                lblCart.CssClass = CssClass
                lblOrder.CssClass = CssClass
                lblProduct.CssClass = CssClass
                lblAuction.CssClass = CssClass
                lblAccount.CssClass = CssClass
                lblHelp.CssClass = CssClass
            End If


            Dim currentUser As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.Instance.GetCurrentUserInfo()
            If currentUser.UserID = -1 Then
                lblCart.Text += " (0)"
                Dim returnUrl As String = HttpContext.Current.Request.RawUrl
                If (returnUrl.IndexOf("?returnurl=") <> -1) Then
                    returnUrl = returnUrl.Substring(0, returnUrl.IndexOf("?returnurl="))
                End If
                returnUrl = HttpUtility.UrlEncode(returnUrl)
                Dim loginUrl As String = DotNetNuke.Common.Globals.LoginURL(returnUrl, Not Request.QueryString("override") Is Nothing)

                hlCart.NavigateUrl = loginUrl
                hlOrder.NavigateUrl = loginUrl
                hlProduct.NavigateUrl = loginUrl
                hlAuction.NavigateUrl = loginUrl
                hlAccount.NavigateUrl = loginUrl

                hlCart.Target = "_self"
                hlOrder.Target = "_self"
                hlAuction.Target = "_self"
                hlProduct.Target = "_self"
                hlAccount.Target = "_self"
            Else
                Dim pageId As Integer = Settings_Portal.General.ModulePage_Admin
                Dim moduleId As Integer = Settings_Portal.General.ModuleId_Admin

                If (Settings_Portal.General.ModulePage_Buyer > 0) Then
                    pageId = Settings_Portal.General.ModulePage_Buyer
                    moduleId = Settings_Portal.General.ModuleId_Buyer
                End If

                Dim supportContentLocalization As Boolean = False
                If (DotNetNuke.Entities.Host.Host.EnableContentLocalization() _
                    AndAlso PortalSettings.ContentLocalizationEnabled _
                    AndAlso DotNetNuke.Services.Localization.LocaleController.Instance.GetLocales(PortalSettings.PortalId).Count > 1) Then
                    supportContentLocalization = True
                End If

                If supportContentLocalization Then
                    Dim pages As List(Of Cross.Modules.CP_Content.Business.PageInfo)
                    pages = Cross.Modules.CP_Content.Business.PageController.GetByCulture(PortalSettings.PortalId, PortalSettings.ActiveTab.CultureCode).ToList()
                    If (pages.Count > 0 AndAlso pages(0).ModulePage_Buyer > 0) Then
                        pageId = pages(0).ModulePage_Buyer
                        moduleId = pages(0).ModuleId_Buyer
                    End If
                End If



                hlCart.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(pageId, "", "mid=" + moduleId.ToString(), "ctl=UserBuyer_Cart")

                lblCart.Text += " (" + CartController.GetByClient(currentUser.UserID, -1, PortalSettings.PortalId).Count.ToString() + ")"
                hlOrder.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(pageId, "", "mid=" + moduleId.ToString(), "ctl=UserBuyer_Order")
                hlAuction.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(pageId, "", "mid=" + moduleId.ToString(), "ctl=UserBuyer_Auction")
                hlProduct.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(pageId, "", "mid=" + moduleId.ToString(), "ctl=UserBuyer_Product")
                hlAccount.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(pageId)

                hlCart.Target = Target
                hlOrder.Target = Target
                hlProduct.Target = Target
                hlAccount.Target = Target
            End If
            hlHelp.NavigateUrl = DotNetNuke.Common.Globals.NavigateURL(Settings_Portal.General.ModulePage_Help)
            hlHelp.Target = Target
            DataBind()
        End Sub
    End Class
End Namespace
