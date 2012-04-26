<%@ Page Language="C#" AutoEventWireup="true" Inherits="AcceptUserRequestForAccessChange" Codebehind="AcceptUserRequestForAccessChange.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Смена доступа </title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        Логин :
        <asp:Label ID="lblLogin" runat="server"></asp:Label>
        <br />
        Допуск :&nbsp;
        <asp:Label ID="lblNeedAccess" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblRequestMessage" runat="server"></asp:Label>
        <br />
        Пароль SQL SCSAdmin :
        <asp:TextBox ID="tbAdminPassword" runat="server" TextMode="Password" 
            Width="210px"></asp:TextBox>
        <br />
        <asp:Button ID="btnAccept" runat="server" onclick="btnAccept_Click" 
            Text="Подтвердить" />
    
    </div>
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Назад" />
    </form>
</body>
</html>
