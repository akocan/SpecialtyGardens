using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SeedIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {

        Button targetButton = (Button)e.Item.FindControl("EditButton");
        if (targetButton != null)
        {
            if (Session["UserID"] == null)
            {
                targetButton.Visible = false;

            }
            else
            {
                targetButton.Visible = true;
            }
        }
    }
}