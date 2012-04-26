<%@ Page Language="C#" AutoEventWireup="true" Inherits="PasswordChange" Codebehind="PasswordChange.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Сменить пароль</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        Смена пароля :<br />
        <br />
        <br />
        Старый пароль :         <asp:TextBox ID="tbOldPass" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;*<br />
        Новый пароль :
        <asp:TextBox ID="tbNewPass" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;*<br />
        <asp:Button ID="btOk" runat="server" onclick="btOk_Click" Text="Сменить" />
        <asp:Button ID="btCancel" runat="server" onclick="btCancel_Click" 
            Text="Отмена" />
    
    </div>
    </form>
</body>
</html>
