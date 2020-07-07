using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPlant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //if (IsPostBack)
        //{
        //    DropDownList1.DataBind();
        ////}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "<br>Plant=" + DropDownList1.SelectedValue + "<br>";
        for (int i = 0; i < Request.Form.Count; i++)
        {
            if (Request.Form.Keys[i].Contains("Check"))
            {
                Label1.Text = Label1.Text + "<br> added to Garden=" + Request.Form[i] + "<br>";
                try { 
                    SqlDataSource objDS = new SqlDataSource();

                    objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ProviderName;
                    objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GardenConnectionString"].ConnectionString;

                    objDS.InsertCommand = "insert into T_Garden_Plant (GardenID_FK, PlantID_FK) values (?,?)";

                    objDS.InsertParameters.Add("GardenID_FK", Request.Form[i].ToString());
                    objDS.InsertParameters.Add("PlantID_FK", DropDownList1.SelectedValue);

                    objDS.Insert();
                }
                catch (Exception)
                {
                    ErrorLabel.Text = "Plant could not be added to Garden, possibly Plant is currrently in chosen Garden.";
                }
            }
        }

        CheckBoxList1.ClearSelection();
    }



    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
       // if (IsPostBack)
       // {
            DropDownList1.DataBind();
       // }
    }
}