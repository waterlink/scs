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

public partial class Cabinet : System.Web.UI.Page
{

    string login = "";
    string expDate = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["SCSLogin"] != null) & (Session["SCSDate"] != null))
        {
            if ((DateTime)Session["SCSDate"] <= DateTime.Now)
                Response.Redirect("Default.aspx");
            Session["OldShow"] = null;
            login = (string)Session["SCSLogin"];
            expDate = ((DateTime)Session["SCSDate"]).ToString();
            Response.Write("<div align=center> В системе как: " + login + "<BR> В системе до: " + expDate + "<BR></div>");
            Session["SCSDate"] = DateTime.Now.AddMinutes(10);
            Title = Title + " : " + login;
            string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionstring);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("exec CheckNewMessages @lg", con);
                cmd.Parameters.Add("@lg", login);
                int cnt = (int)cmd.ExecuteScalar();
                if (cnt >= 1)
                {
                    Response.Write("<div align=center> <BR><BR> У вас <a href=Messages.aspx>" + cnt.ToString() + " непрочитанных сообщений</a><BR></div>");
                }
                cmd.CommandText = "exec isRightDataAboutUser @lg";
                cnt = (int)cmd.ExecuteScalar();

                if (cnt >= 1)
                {
                    cmd.CommandText = "exec getUserFirstName @lg";
                    string name;
                    try
                    {
                        name = (string)cmd.ExecuteScalar();
                    }
                    catch
                    {
                        name = "";
                    }
                    lblFirstName.Text = name;

                    cmd.CommandText = "exec getUserLastName @lg";
                    try
                    {
                        name = (string)cmd.ExecuteScalar();
                    }
                    catch
                    {
                        name = "";
                    }
                    lblLastName.Text = name;

                    cmd.CommandText = "exec getUserFathersName @lg";
                    try
                    {
                        name = (string)cmd.ExecuteScalar();
                    }
                    catch
                    {
                        name = "";
                    }
                    lblFathersName.Text = name;
                }
                else
                {
                    cmd.CommandText = "exec NewCabinet @lg";
                    cmd.ExecuteScalar();
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
        else Response.Redirect("Default.aspx");
    }

    protected void btnInMess_Click(object sender, EventArgs e)
    {
        Session["SCSTitle"] = "Входящие";
        Session["SCSCommand"] = "exec getInMessages @lg";
        Response.Redirect("ShowTable.aspx");
    }
    protected void btnOutMess_Click(object sender, EventArgs e)
    {
        Session["SCSTitle"] = "Исходящие";
        Session["SCSCommand"] = "exec getOutMessages @lg";
        Response.Redirect("ShowTable.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["SCSTitle"] = "Чистка этих сообщений";
        Session["SCSCommand"] = "exec DeleteReadedMessages @lg";
        Response.Redirect("ShowTable.aspx");
    }
    protected void btnNewMess_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewMessage.aspx");
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec getUserControlledPupilId @lg", con);
            cmd.Parameters.Add("@lg", login);
            string pId = ((int)cmd.ExecuteScalar()).ToString();
            cmd.CommandText = "exec getUserAccess @lg";
            int access = (int)cmd.ExecuteScalar();
            if (access >= 1)
            {
                cmd.CommandText = "exec getPupilFLF @pid";
                cmd.Parameters.Add("@pid", pId);
                string flf = (string)cmd.ExecuteScalar();
                con.Close();
                Session["SCSTitle"] = flf;
                Session["SCSParameter1"] = pId;
                Response.Redirect("Redactor.aspx");
            }
            else
            {
                con.Close();
                Response.Write("<div align=center>Вашего уровня допуска недостаточно для этой операции <BR> <a href='ChangeAccess.aspx'>Как изменить уровень допуска?</A> " +
                        "<BR>Ваш текущий уровень допуска : " + access.ToString() + " Требуемый : 1</div>");
            }
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec getUserControlledPupilId @lg", con);
            cmd.Parameters.Add("@lg", login);
            string pId = ((int)cmd.ExecuteScalar()).ToString();
            cmd.CommandText = "exec getUserAccess @lg";
            int access = (int)cmd.ExecuteScalar();
            if (access >= 2)
            {
                cmd.CommandText = "exec getPupilFLF @pid";
                cmd.Parameters.Add("@pid", pId);
                string flf = (string)cmd.ExecuteScalar();
                con.Close();
                Session["SCSTitle"] = flf;
                Session["SCSParameter1"] = pId;
                Response.Redirect("Redactor.aspx");
            }
            else
            {
                Response.Write("<div align=center>Вашего уровня допуска недостаточно для этой операции <BR> <a href='ChangeAccess.aspx'>Как изменить уровень допуска?</A> " +
                        "<BR>Ваш текущий уровень допуска : " + access.ToString() + " Требуемый : 2</div>");
            }
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec getUserControlledPupilId @lg", con);
            cmd.Parameters.Add("@lg", login);
            string pId = ((int)cmd.ExecuteScalar()).ToString();
            cmd.CommandText = "exec getUserAccess @lg";
            int access = (int)cmd.ExecuteScalar();
            if (access >= 2)
            {
                con.Close();
                Response.Redirect("Report.aspx");
            }
            else
            {
                con.Close();
                Response.Write("<div align=center>Вашего уровня допуска недостаточно для этой операции <BR> <a href='ChangeAccess.aspx'>Как изменить уровень допуска?</A> " +
                        "<BR>Ваш текущий уровень допуска : " + access.ToString() + " Требуемый : 2</div>");
            }
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
    }
    protected void btnBase_Click(object sender, EventArgs e)
    {
        string connectionstring = WebConfigurationManager.ConnectionStrings["SCSDataBase"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionstring);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("exec getUserControlledPupilId @lg", con);
            cmd.Parameters.Add("@lg", login);
            string pId = ((int)cmd.ExecuteScalar()).ToString();
            cmd.CommandText = "exec getUserAccess @lg";
            int access = (int)cmd.ExecuteScalar();
            if (access >= 4)
            {
                cmd.CommandText = "exec getPupilFLF @pid";
                cmd.Parameters.Add("@pid", pId);
                string flf = (string)cmd.ExecuteScalar();
                con.Close();
                Session["SCSTitle"] = flf;
                Session["SCSParameter1"] = pId;
                Response.Redirect("Base.aspx");
            }
            else
            {
                Response.Write("<div align=center>Вашего уровня допуска недостаточно для этой операции <BR> <a href='ChangeAccess.aspx'>Как изменить уровень допуска?</A> " +
                        "<BR>Ваш текущий уровень допуска : " + access.ToString() + " Требуемый : 4</div>");
            }
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
    }
}
