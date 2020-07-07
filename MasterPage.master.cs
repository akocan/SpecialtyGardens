using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            LogoutButton.Visible = false;
            AddPlantHyperLink.Visible = false;

        }
        else
        {
            LogoutButton.Visible = true;
            AddPlantHyperLink.Visible = true;
        }
    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Home.aspx");
    }
}
