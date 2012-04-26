<%@ Page Language="C#" AutoEventWireup="true" Inherits="Report" Codebehind="Report.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Отчет. Укажите даты начала и конца</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        С :<asp:Calendar ID="cdFrom" runat="server" BackColor="White" 
            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
            FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
            Height="180px" onselectionchanged="cdFrom_SelectionChanged" Width="200px">
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <WeekendDayStyle BackColor="#FFFFCC" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        </asp:Calendar>
        <br />
        <br />
        По :<asp:Calendar ID="cdTo" runat="server" BackColor="White" 
            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
            FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
            Height="180px" onselectionchanged="cdTo_SelectionChanged" Width="200px">
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <WeekendDayStyle BackColor="#FFFFCC" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        </asp:Calendar>
        <br />
        <br />
        <asp:Button ID="btnShowReport" runat="server" Enabled="False" 
            onclick="btnShowReport_Click" Text="Отчет" />
    
    </div>
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Назад" />
    </form>
</body>
</html>
