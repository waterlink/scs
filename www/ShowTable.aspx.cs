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

public partial class ShowTable : System.Web.UI.Page
{
    string login = "";
    string expDate = "";
    string ttl = "";
    string getcmd = "";
    string p1 = "";
    string p2 = "";
    
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
            string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            try
            {
                ttl = (string)Session["SCSTitle"];
                Title = ttl + " : " + login;
                getcmd = (string)Session["SCSCommand"];
                if (Session["SCSParameter1"] != null)
                {
                    p1 = (string)Session["SCSParameter1"];
                }
                if (Session["SCSParameter2"] != null)
                {
                    p2 = (string)Session["SCSParameter2"];
                }
                con.Open();
                SqlCommand cmd = new SqlCommand(getcmd, con);
                cmd.Parameters.Add("@lg", login);
                cmd.Parameters.Add("@p1", p1);
                cmd.Parameters.Add("@p2", p2);
                SqlDataReader dr = cmd.ExecuteReader();
                Session["SCSCommand"] = "";
                gvTable.DataSource = dr;
                gvTable.DataBind();
                if (dr.NextResult())
                {
                    gvTable2.DataSource = dr;
                    gvTable2.DataBind();
                    gvTable2.Visible = true;
                }
                dr.Close();
                for (int i = 0; i < gvTable.Rows.Count; i++)
                {
                    string mes = gvTable.Rows[i].Cells[2].Text;
                    if (mes.StartsWith("[REQUEST MESSAGE]") == true)
                    {
                        gvTable.Rows[i].Cells[2].Text = "[запрос]";
                        mes = mes.Replace("[REQUEST MESSAGE]", "");
                        cmd.CommandText = "exec getUserAccess @lg";
                        int acc = (int)cmd.ExecuteScalar();
                        if (acc == 4)
                        {
                            Response.Write("<div align=center>");
                            Response.Write("<a href=" + mes + "> подтвердить  " + gvTable.Rows[i].Cells[1].Text +"</a>");
                            Response.Write("<BR>");
                            Response.Write("</div>");
                        }
                    }
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
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
}
