<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SCS Регистрация</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        Введите желаемый логин и длинный пароль (не меньше 8 знаков)<br />
        <br />
        <br />
        Логин:
        <asp:TextBox ID="tbNewLogin" runat="server"></asp:TextBox>
&nbsp;*<br />
        Пароль:
        <asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password"></asp:TextBox>
&nbsp; *<br />
        <br />
        Остальные данные о себе вы сможете ввести на странице учетной записи<br />
        <asp:Button ID="btnRegister" runat="server" onclick="btnRegister_Click" 
            Text="Зарегистрироваться" />
    
    </div>
    </form>
</body>
</html>
