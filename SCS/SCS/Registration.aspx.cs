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

/*public class Cripter
{

    int d = 17;

    public string CriptChar(char value, int p)
    {
        int x = Convert.ToInt32(value);
        x = x + d;
        x = x * d;
        string s = Convert.ToString(x);
        if (p != 0)
            s = "_" + s;
        return s;
    }

    public string CriptString(string value)
    {
        string s = "";
        for (int i = 0; i < value.Length; i++)
        {
            s = s + CriptChar(value[i], i);
        }
        return s;
    }
}*/

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["SCSLogin"] != null) & (Session["SCSDate"] != null))
        {
            if ((DateTime)Session["SCSDate"] <= DateTime.Now)
                Response.Redirect("Cabinet.aspx");
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Cripter cr = new Cripter();
        string lg = tbNewLogin.Text;
        int pwdLength = tbNewPassword.Text.Length;
        int lgLength = lg.Length;
        if ((lgLength >= 1) & (pwdLength >= 8))
        {
            string pwd = cr.CriptString(tbNewPassword.Text);
            string connectionString = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("exec CheckExistLogin @lg", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("@lg", lg);
                int cnt = (int)cmd.ExecuteScalar();
                if (cnt == 0)
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "EXEC AddLogin @lg, @pwd, '0'";
                    cmd.Parameters.Add("@pwd", pwd);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    string msg = "Такой логин уже существует, попробуйте другой";
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
                Response.Write("Пароль должен быть длиннее <BR>");
            if (lgLength == 0)
                Response.Write("Введите логин");
        }
    }
}
