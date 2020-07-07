using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FirstName"] == null)
        {
            warningLabel.Visible = false;

            eventTextBox.Visible = false;
            eventButton.Visible = false;

            newsTextBox.Visible = false;
            newsButton.Visible = false;

            aboutTextBox.Visible = false;
            aboutButton.Visible = false;
        }
        else
        {
            eventLabel.Visible = false;
            newsLabel.Visible = false;
            aboutLabel.Visible = false;
        }
        if (!IsPostBack)
        { 
            SqlDataSource objDS = new SqlDataSource();

            objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
            objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

            objDS.SelectCommand = "select Events, News, About from T_HomePage where HomeID = 1";
            objDS.DataSourceMode = SqlDataSourceMode.DataReader;
            System.Data.IDataReader myData = (System.Data.IDataReader)objDS.Select(DataSourceSelectArguments.Empty);
            if (myData.Read())
            {
                eventLabel.Text = myData["Events"].ToString();
                newsLabel.Text = myData["News"].ToString();
                aboutLabel.Text = myData["About"].ToString();

                eventTextBox.Text = myData["Events"].ToString();
                newsTextBox.Text = myData["News"].ToString();
                aboutTextBox.Text = myData["About"].ToString();
            }
        }
}



    protected void eventButton_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_HomePage set Events=? where HomeID=1";

        objDS.UpdateParameters.Add("Events", eventTextBox.Text);
        objDS.UpdateParameters.Add("HomeID", Request.QueryString["ID"]);

        objDS.Update();
        Response.Redirect(Request.RawUrl);
    }

    protected void newsButton_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_HomePage set News=? where HomeID=1";

        objDS.UpdateParameters.Add("News", newsTextBox.Text);
        objDS.UpdateParameters.Add("HomeID", Request.QueryString["ID"]);

        objDS.Update();
        Response.Redirect(Request.RawUrl);
    }

    protected void aboutButton_Click(object sender, EventArgs e)
    {
        SqlDataSource objDS = new SqlDataSource();

        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        objDS.UpdateCommand = "update T_HomePage set About=? where HomeID=1";

        objDS.UpdateParameters.Add("About", aboutTextBox.Text);
        objDS.UpdateParameters.Add("HomeID", Request.QueryString["ID"]);

        objDS.Update();
        Response.Redirect(Request.RawUrl);
    }


}