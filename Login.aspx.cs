using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginButton_Click(object sender, EventArgs e)
    {
        //create sql data source object...
        //object we use to perform query
        SqlDataSource objDS = new SqlDataSource();

        //look in web config, and pull 2 parameters needed
        // to connect to out database
        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

        //define sql statement - query with parameters
        objDS.SelectCommand = "select [UserID], [FirstName], [LastName] from [T_User] where [UserID]=? and [Password]=?";

        //tell where to get the values of the parameters
        objDS.SelectParameters.Add("UserID", userNameTxtBox.Text);
        objDS.SelectParameters.Add("Password", passwordTxtBox.Text);

        //sets mode of how we are going to use data... simpler option
        objDS.DataSourceMode = SqlDataSourceMode.DataReader;

        //executes the query - stores the results - in sort of an array = read sequentially
        System.Data.IDataReader myData = (System.Data.IDataReader)objDS.Select(DataSourceSelectArguments.Empty);

        //read the next row - since his is the first read
        //it reads the first row in the result set...
        if (myData.Read())
        {
            // the first read found a row, and returned true
            //therefore
            //successful logon!

            Session["UserID"] = myData[0];
            Session["FirstName"] = myData[1];
            Session["LastName"] = myData[2];
            //redirect to home.aspx
            Response.Redirect("Home.aspx");


        }
        else
        {
            // the first read did not find a row, and returned false
            //therefore
            //unsuccessful logon!
            //set message
            LabelUserResults.Text = "Invalid User Name or Password, please try again.";
        }
    }

   
}