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

public partial class ChangeAccess : System.Web.UI.Page
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
        }
        else Response.Redirect("Default.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
    protected void btnRequest_Click(object sender, EventArgs e)
    {
        int ac = Convert.ToInt32(ddlAccess.Text);
        string message = tbMessage.Text;
        string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("", con);
            cmd.Parameters.Add("@lg", login);            
            cmd.CommandText = "exec CreateNewMessage @lg, 'admin', @requestmessage";
            cmd.Parameters.Add("@requestmessage", "[REQUEST MESSAGE]AcceptUserRequestForAccessChange.aspx?log=" + Server.UrlEncode(login) + "&ac=" + ac.ToString() + "&mes=" + Server.UrlEncode(message));
            cmd.ExecuteScalar();
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
        finally
        {
            con.Close();
            btnCancel_Click(sender, e);
        }
    }
}
