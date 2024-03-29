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

public partial class User : System.Web.UI.Page
{
    string login = "";
    string expDate = "";
    string oldname = "";
    string oldsurname = "";
    string oldfather = "";
    string oldtel = "";

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
            Title = Title + " пользователя " + Request.QueryString["log"] + " : " + login;
                string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("", con);
                    cmd.Parameters.Add("@lg", Request.QueryString["log"]);
                    cmd.CommandText = "exec getUserFirstName @lg";
                    tbFirstName.Text = (string)cmd.ExecuteScalar();
                    cmd.CommandText = "exec getUserLastName @lg";
                    tbLastName.Text = (string)cmd.ExecuteScalar();
                    cmd.CommandText = "exec getUserFathersName @lg";
                    tbFathersName.Text = (string)cmd.ExecuteScalar();
                    cmd.CommandText = "exec getUsersTelephone @lg";
                    tbTelephone.Text = (string)cmd.ExecuteScalar();
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Session["ComeFrom"] != null)
        {
            Response.Redirect((string)Session["ComeFrom"]);
            Session["Back"] = "true";
        }
        else
        {
            Response.Redirect("Cabinet.aspx");
        }
    }
}
