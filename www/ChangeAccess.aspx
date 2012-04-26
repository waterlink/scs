<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeAccess.aspx.cs" Inherits="ChangeAccess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Смена доступа</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        Допуск :
        <asp:DropDownList ID="ddlAccess" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
        </asp:DropDownList>
        <br />
        Сообщение администрации :
        <asp:TextBox ID="tbMessage" runat="server" Width="240px">Прошу изменить мой 
        уровень допуска</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="btnRequest" runat="server" onclick="btnRequest_Click" 
            Text="Запрос" />
        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Отмена" />
    
    </div>
    </form>
</body>
</html>
