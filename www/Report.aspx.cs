using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Report : System.Web.UI.Page
{
    string login = "";
    string expDate = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["SCSLogin"] != null) & (Session["SCSDate"] != null))
        {
            if ((DateTime)Session["SCSDate"] <= DateTime.Now)
                Response.Redirect("Default.aspx");
            login = (string)Session["SCSLogin"];
            expDate = ((DateTime)Session["SCSDate"]).ToString();
            Response.Write("<div align=center> В системе как: " + login + "<BR> В системе до: " + expDate + "<BR></div>");
            Session["SCSDate"] = DateTime.Now.AddMinutes(10);
            Title = Title + " : " + login;
            if (Session["SCSReportDate1Flag"] == null)
            {
                Session["SCSReportDate1Flag"] = "False";
            }
            if (Session["SCSReportDate2Flag"] == null)
            {
                Session["SCSReportDate2Flag"] = "False";
            }
            string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandText = "exec getUserAccess @lg";
                cmd.Parameters.Add("@lg", login);
                int access = (int)cmd.ExecuteScalar();
                if (access <= 1)
                {
                    Response.Redirect("Cabinet.aspx");
                }
            }
            catch (Exception err)
            {                                         
                Response.Write(err.Message);
            }
            finally
            {
                con.Close();
            }
        }
        else Response.Redirect("Default.aspx");
    }
    protected void cdFrom_SelectionChanged(object sender, EventArgs e)
    {                                                            
        Session["SCSReportDate1Flag"] = "True";
        Session["SCSReportDate1"] = cdFrom.SelectedDate;
        if (Session["SCSReportDate2Flag"] == "True")
        {
            btnShowReport.Enabled = true;
        }
    }
    protected void cdTo_SelectionChanged(object sender, EventArgs e)
    {
        Session["SCSReportDate2Flag"] = "True";
        Session["SCSReportDate2"] = cdTo.SelectedDate;
        if (Session["SCSReportDate1Flag"] == "True")
        {
            btnShowReport.Enabled = true;
        }
    }
    protected void btnShowReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowReport.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
}
