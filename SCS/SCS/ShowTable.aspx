<%@ Page Language="C#" AutoEventWireup="true" Inherits="ShowTable" Codebehind="ShowTable.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="gvTable" runat="server">
        </asp:GridView>
    
        <br />
        <asp:GridView ID="gvTable2" runat="server" Visible="False">
        </asp:GridView>
        <br />
    
    </div>
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Назад" />
    </form>
</body>
</html>
