﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowReport.aspx.cs" Inherits="ShowReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Отчет</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        Оценки :<asp:GridView ID="gvVals" runat="server">
        </asp:GridView>
        <br />
        Отсутсвия :<asp:GridView ID="gvOut" runat="server">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
