<%@ Page Language="C#" AutoEventWireup="true" Inherits="User" Codebehind="User.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Личные данные</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Фамилия :
        <asp:Label ID="tbFirstName" runat="server"></asp:Label>
        <br />
        Имя :
        <asp:Label ID="tbLastName" runat="server"></asp:Label>
        <br />
        Отчество :
        <asp:Label ID="tbFathersName" runat="server"></asp:Label>
        <br />
        Телефон :
        <asp:Label ID="tbTelephone" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Назад" />
    
    </div>
    </form>
</body>
</html>
