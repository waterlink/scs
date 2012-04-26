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

public partial class NewMessage : System.Web.UI.Page
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
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cabinet.aspx");
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string s = tbMessage.Text.Replace("[REQUEST MESSAGE]", "");
        Session["SCSTitle"] = "Исходящие. Сообщение отправлено";
        Session["SCSParameter1"] = tbAddress.Text;
        Session["SCSParameter2"] = s;
        Session["SCSCommand"] = "exec CreateNewMessage @lg, @p1, @p2";
        Response.Redirect("ShowTable.aspx");
    }
}
