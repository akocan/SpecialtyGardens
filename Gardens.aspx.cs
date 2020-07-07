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

public partial class Gardens : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] == null)
        {
            upload.Visible = false;

            warningLabel.Visible = false;

            descriptionTextBox.Visible = false;
            descriptionButton.Visible = false;

            locationTextBox.Visible = false;
            locationButton.Visible = false;
        }
        else
        {
            descriptionLabel.Visible = false;
            locationLabel.Visible = false;
        }

        string dirpath = Server.MapPath("images/gardenimage");
        DirectoryInfo dir = new DirectoryInfo(dirpath);
        foreach (FileInfo files in dir.GetFiles())
        {
            GardenDropDown.Items.Add(files.Name);
        }

        if (!IsPostBack)
        {
            SqlDataSource objDS = new SqlDataSource();

            objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
            objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

            objDS.SelectCommand = "select GardenDescription, GardenLocation from T_GardenIndex where GardenID=?";
            objDS.SelectParameters.Add("GardenID", Request.QueryString["ID"]);
            objDS.DataSourceMode = SqlDataSourceMode.DataReader;
            System.Data.IDataReader myData = (System.Data.IDataReader)objDS.Select(DataSourceSelectArguments.Empty);
            if (myData.Read())
            {
                descriptionLabel.Text = myData["GardenDescription"].ToString();
                locationLabel.Text = myData["GardenLocation"].ToString();

                descriptionTextBox.Text = myData["GardenDescription"].ToString();
                locationTextBox.Text = myData["GardenLocation"].ToString();
            }
        }
    }
    protected void btnUploadClick(object sender, EventArgs e)
    {
        if ((FileInput.PostedFile != null) && (FileInput.PostedFile.ContentLength > 0))
        {
            string fn = System.IO.Path.GetFileName(FileInput.PostedFile.FileName);
            string SaveLocation = Server.MapPath("images/gardenimage") + "\\" + fn;

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
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {

        Button targetButton = (Button)e.Item.FindControl("DeleteButton");
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_GardenIndex set GardenImage=? where GardenID=?";

        objDS.UpdateParameters.Add("GardenImage", GardenDropDown.SelectedValue);
        objDS.UpdateParameters.Add("GardenID", Request.QueryString["ID"]);

        objDS.Update();
        ImageGV.DataBind();
    }
    protected void descriptionButton_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_GardenIndex set GardenDescription=? where GardenID=?";

        objDS.UpdateParameters.Add("GardenDescription", descriptionTextBox.Text);
        objDS.UpdateParameters.Add("GardenID", Request.QueryString["ID"]);

        objDS.Update();
        Response.Redirect(Request.RawUrl);
    }

    protected void locationButton_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_GardenIndex set GardenLocation=? where GardenID=?";

        objDS.UpdateParameters.Add("GardenLocation", locationTextBox.Text);
        objDS.UpdateParameters.Add("GardenID", Request.QueryString["ID"]);

        objDS.Update();
        Response.Redirect(Request.RawUrl);
    }

}