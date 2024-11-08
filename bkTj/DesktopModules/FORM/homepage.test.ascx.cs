using DotNetNuke.Services.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_FORM_homepage_test : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Include the JavaScript file dynamically if needed
            Page.ClientScript.RegisterClientScriptInclude("homepage_js", ResolveUrl("~/DesktopModules/FORM/js/homepage.js"));
        }
    }
  

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string productName = txtProductName.Text;
            string description = txtDescription.Text;
            decimal price = Decimal.Parse(txtPrice.Text);

            // Save the product details to the database
            // Implement database logic here

            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(), true);
        }
        catch (Exception ex)
        {
            Exceptions.ProcessModuleLoadException(this, ex);
        }
    }
}
