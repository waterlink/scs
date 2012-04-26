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

public partial class Messages : System.Web.UI.Page
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
        string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec ShowNewMessages @lg", con);
            cmd.Parameters.Add("@lg", login);
            SqlDataReader dr = cmd.ExecuteReader();
            gvMessageViewer.DataSource = dr;
            gvMessageViewer.DataBind();
            dr.Close();
            for (int i = 0; i < gvMessageViewer.Rows.Count; i++)
            {
                string mes = gvMessageViewer.Rows[i].Cells[2].Text;
                if (mes.StartsWith("[REQUEST MESSAGE]") == true)
                {
                    gvMessageViewer.Rows[i].Cells[2].Text = "[запрос]";
                    mes = mes.Replace("[REQUEST MESSAGE]", "");
                    cmd.CommandText = "exec getUserAccess @lg";
                    int acc = (int)cmd.ExecuteScalar();
                    if (acc == 4)
                    {
                        Response.Write("<div align=center>");
                        Response.Write("<a href=" + mes + "> подтвердить  " + gvMessageViewer.Rows[i].Cells[1].Text + "</a>");
                        Response.Write("<BR>");
                        Response.Write("</div>");
                    }
                }
            }
            cmd.CommandText = "exec NewMessagesReadedAlready @lg";
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
}
