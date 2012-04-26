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

public partial class ShowReport : System.Web.UI.Page
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
            /*if (Session["SCSReportDate1Flag"] == null)
            {
                Session["SCSReportDate1Flag"] = "False";
            }
            if (Session["SCSReportDate2Flag"] == null)
            {
                Session["SCSReportDate2Flag"] = "False";
            }/**/
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
                cmd.CommandText = "exec ShowFormReport @dtst, @dten, @lg";
                cmd.Parameters.Add("@dtst", (DateTime)Session["SCSReportDate1"]);
                cmd.Parameters.Add("@dten", (DateTime)Session["SCSReportDate2"]);
                SqlDataReader dr = cmd.ExecuteReader();
                gvVals.DataSource = dr;
                gvVals.DataBind();
                dr.Close();
                cmd.CommandText = "exec ShowFormReportOut @dtst, @dten, @lg";
                dr = cmd.ExecuteReader();
                gvOut.DataSource = dr;
                gvOut.DataBind();
                dr.Close();
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
}
