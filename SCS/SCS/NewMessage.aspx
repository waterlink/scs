<%@ Page Language="C#" AutoEventWireup="true" Inherits="NewMessage" Codebehind="NewMessage.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Новое сообщение</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        Получатель :
        <asp:TextBox ID="tbAddress" runat="server" Width="271px"></asp:TextBox>
&nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        Сообщение :
        <asp:TextBox ID="tbMessage" runat="server" Width="559px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" 
            Text="Отправить" />
        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Отмена" />
    
    </div>
    </form>
</body>
</html>
