using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;


public partial class Plant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["FirstName"] == null)
        {
            upload.Visible = false;
        }

        string dirpath = Server.MapPath("images/plantimage");
        DirectoryInfo dir = new DirectoryInfo(dirpath);
        foreach (FileInfo files in dir.GetFiles())
        {
            PlantDropDown.Items.Add(files.Name);
        }
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

    protected void btnUploadClick(object sender, EventArgs e)
    {
        if ((FileInput.PostedFile != null) && (FileInput.PostedFile.ContentLength > 0))
        {
            string fn = System.IO.Path.GetFileName(FileInput.PostedFile.FileName);
            string SaveLocation = Server.MapPath("images/plantimage") + "\\" + fn;

            try
            {
                FileInput.PostedFile.SaveAs(SaveLocation);
                ErrorLabel.Text = "Your image has been uploaded. Please refresh page to add it to dropdown selection.";
            }
            catch (Exception)
            {
                ErrorLabel.Text = "Your image could not be uploaded.";
            }
        }
   
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_PlantIndex set PlantImage=? where PlantID=?";

        objDS.UpdateParameters.Add("GardenImage", PlantDropDown.SelectedValue);
        objDS.UpdateParameters.Add("GardenID", Request.QueryString["PlantID"]);

        objDS.Update();
        ImageGV2.DataBind();
    }


}