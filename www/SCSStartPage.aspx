<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SCSStartPage.aspx.cs" Inherits="SCSStartPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SCS Вход</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        Добро пожаловать в систему контроля успеваемости и учета пропусков<br />
        <br />
        <br />
        Введите ваш логин и пароль<br />
        <br />
        Логин:
        <asp:TextBox ID="tbLogin" runat="server"></asp:TextBox>
&nbsp;*<br />
        Пароль:
        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
&nbsp; *<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btEnter" runat="server" Text="Войти" onclick="btEnter_Click" />
        <br />
        <asp:HyperLink ID="hlRegistration" runat="server" 
            NavigateUrl="~/Registration.aspx">Регистрация</asp:HyperLink>
        <br />
    
    </div>
    </form>
    </body>
</html>
