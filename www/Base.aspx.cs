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

public partial class Base : System.Web.UI.Page
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
            Response.Write("<div align=center> В системе как: " + login + "<BR> В системе до: " + expDate + "<BR><BR> ВНИМАНИЕ!!! Вы собираетесь изменить базу данных. Это может привести к ПОТЕРЕ ДАННЫХ! <BR></div>");
            Session["SCSDate"] = DateTime.Now.AddMinutes(10);
            Title = "База данных : " + login;
            string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("", con);
                cmd.CommandText = "exec getUserAccess @lg";
                cmd.Parameters.Add("@lg", login);
                int access = (int)cmd.ExecuteScalar();
                if (access < 4)
                {
                     con.Close();
                     Response.Redirect("Default.aspx");
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
            //btnShow_Click(sender, e);
            ////gvView.AutoGenerateEditButton = false;
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
          string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
          SqlConnection con = new SqlConnection(constr);
          try
          {
                 con.Open();
                 SqlCommand cmd = new SqlCommand("", con);
                 cmd.CommandText = tbSql.Text;
                 cmd.ExecuteScalar();
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
}
