<%@ Page Language="C#" AutoEventWireup="true" Inherits="Messages" Codebehind="Messages.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Сообщения</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="gvMessageViewer" runat="server">
        </asp:GridView>
    
    </div>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Назад" />
    </form>
</body>
</html>
