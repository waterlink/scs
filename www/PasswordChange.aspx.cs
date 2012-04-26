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
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class PasswordChange : System.Web.UI.Page
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
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
    protected void btOk_Click(object sender, EventArgs e)
    {
        Cripter cr = new Cripter();
        string lg = login;
        int pwdLength = tbOldPass.Text.Length;
        int lgLength = lg.Length;
        int newLength = tbNewPass.Text.Length;
        if ((lgLength >= 1) & (pwdLength >= 8) & (newLength >= 8))
        {
            string pwd = cr.CriptString(tbOldPass.Text);
            string newpass = cr.CriptString(tbNewPass.Text);
            string connectionString = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(LOGIN) AS cnt FROM LOGINS WHERE (Login=@lg)and(Cripted=@pwd)", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("@lg", lg);
                cmd.Parameters.Add("@pwd", pwd);
                int cnt = (int)cmd.ExecuteScalar();
                if (cnt == 1)
                {
                    cmd.CommandText = "exec changepassword @lg, @np";
                    cmd.Parameters.Add("@np", newpass);
                    cmd.ExecuteNonQuery();
                    btCancel_Click(sender, e);
                }
                else
                {
                    string msg = "Пароль неверен";
                    Response.Write(msg);
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
        else
        {
            if (pwdLength <= 7)
                Response.Write("Пароль неверен <BR>");
        }
    }
}
