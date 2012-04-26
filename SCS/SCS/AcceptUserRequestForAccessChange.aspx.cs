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

public partial class AcceptUserRequestForAccessChange : System.Web.UI.Page
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
            lblLogin.Text = Server.UrlDecode(Request.QueryString["log"]);
            lblNeedAccess.Text = Server.UrlDecode(Request.QueryString["ac"]);
            lblRequestMessage.Text = Server.UrlDecode(Request.QueryString["mes"]);
            string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("exec getUserAccess @lg", con);
                cmd.Parameters.Add("@lg", login);
                int ac = (int)cmd.ExecuteScalar();
                if (ac <= 3)
                {
                    con.Close();
                    Response.Redirect("Cabinet.aspx");
                }
            }
            catch (Exception err)
            {
                //Response.Clear();
                Response.Write(err.Message);
            }
            finally
            {
                con.Close();
            }
        }
        else Response.Redirect("Default.aspx");
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        string constr = WebConfigurationManager.ConnectionStrings["SCSDataBaseAdminLogin"].ConnectionString;
        constr = constr.Replace("ID=admin;Password=;", "ID=SCSAdmin;Password=" + tbAdminPassword.Text + ";");
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec ChangeAccess @lg, @na", con);
            cmd.Parameters.Add("@lg", lblLogin.Text);
            cmd.Parameters.Add("@na", Convert.ToInt32(lblNeedAccess.Text));
            cmd.ExecuteScalar();
            cmd.CommandText = "exec CreateNewMessage @lgself, @lg, 'Запрос выполнен'";
            cmd.Parameters.Add("@lgself", login);
            cmd.ExecuteScalar();
            con.Close();
            Response.Redirect("Cabinet.aspx");
        }
        catch (Exception err)
        {
            //Response.Clear();
            Response.Write(err.Message);
        }
        finally
        {
            con.Close();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
}
