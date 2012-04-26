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

public partial class ChangeCabinet : System.Web.UI.Page
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
            Title = Title + " : " + login;
            if (Session["OldShow"] == null)
            {
                Session["OldShow"] = "false";
                string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("", con);
                    cmd.Parameters.Add("@lg", login);
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
        }
        else Response.Redirect("Default.aspx");
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        string constr = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec isCabinetExists @lg", con);
            cmd.Parameters.Add("@lg", login);
            int isexists = (int)cmd.ExecuteScalar();
            if (isexists == 0)
            {
                cmd.CommandText = "exec NewCabinet @lg";
                cmd.ExecuteScalar();
            }
            cmd.CommandText = "exec SetUsersCabinet @fstnm, @lstnm, @ftsnm, @tlph, @lg";
            cmd.Parameters.Add("@fstnm", tbFirstName.Text);
            cmd.Parameters.Add("@lstnm", tbLastName.Text);
            cmd.Parameters.Add("@ftsnm", tbFathersName.Text);
            cmd.Parameters.Add("@tlph", tbTelephone.Text);
            cmd.ExecuteScalar();
            cmd.CommandText = "exec FindFirstMatchPupil @flf";
            cmd.Parameters.Add("@flf", ddlPupilFLF.Text);
            int pId;
            int oldpId;
            try
            {
                pId = (int)cmd.ExecuteScalar();
            }
            catch
            {
                pId = 0;
            }
            cmd.CommandText = "exec getUserControlledPupilId @lg";
            try
            {
                oldpId = (int)cmd.ExecuteScalar();
            }
            catch
            {
                oldpId = 0;
            }
            if (pId != oldpId)
            {
                cmd.CommandText = "exec getUserAccess @lg";
                int ac = (int)cmd.ExecuteScalar();
                if (ac <= 1)
                {
                    cmd.CommandText = "exec setUserAccess @lg, 0";
                    cmd.ExecuteScalar();
                    cmd.CommandText = "exec SetControlledPupilId @lg, @pId";
                    cmd.Parameters.Add("@pId", pId);
                    cmd.ExecuteScalar();
                    cmd.CommandText = "exec CreateNewMessage @lg, 'admin', @requestmessage";
                    cmd.Parameters.Add("@requestmessage", "[REQUEST MESSAGE]AcceptUserRequestForAccessChange.aspx?log=" + Server.UrlEncode(login) + "&ac=1&mes=" + Server.UrlEncode("Пользователь%20сменил%20контроллируемого%20" +
                        "ученика%20с%20" + oldpId + "%20на%20" + pId + "%20требуется%20подтверждение"));
                    cmd.ExecuteScalar();
                }
                else
                {
                    cmd.CommandText = "exec SetControlledPupilId @lg, @pId";
                    cmd.Parameters.Add("@pId", pId);
                    cmd.ExecuteScalar();
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
            if ((string)Session["ComeFrom"] == "Redactor.aspx")
            {
                string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
                SqlConnection con2 = new SqlConnection(connectionstring);
                try
                {
                    con2.Open();
                    SqlCommand cmd = new SqlCommand("exec getUserControlledPupilId @lg", con2);
                    cmd.Parameters.Add("@lg", login);
                    string pId = ((int)cmd.ExecuteScalar()).ToString();
                    cmd.CommandText = "exec getUserAccess @lg";
                    int access = (int)cmd.ExecuteScalar();
                    if (access >= 1)
                    {
                        cmd.CommandText = "exec getPupilFLF @pid";
                        cmd.Parameters.Add("@pid", pId);
                        string flf = (string)cmd.ExecuteScalar();
                        con2.Close();
                        Session["SCSTitle"] = flf;
                        Session["SCSParameter1"] = pId;
                        Response.Redirect("Redactor.aspx");
                    }
                    else
                    {
                        Response.Write("<div align=center>Вашего уровня допуска недостаточно для этой операции <BR> <a href='ChangeAccess.aspx'>Как изменить уровень допуска?</A> " +
                                "<BR>Ваш текущий уровень допуска : " + access.ToString() + " Требуемый : 1</div>");
                    }
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
                Session["Back"] = "true";
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
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
