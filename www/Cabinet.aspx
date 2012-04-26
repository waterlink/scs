<%@ Page Language='C#' AutoEventWireup='true' CodeFile='Cabinet.aspx.cs' Inherits='Cabinet' %>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>

<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat='server'>
    <title>Личный кабинет</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="right">
    
        <asp:HyperLink ID="hlPasswordChange" runat="server" 
            NavigateUrl="~/PasswordChange.aspx">Сменить пароль</asp:HyperLink>
        <br />
        <br />
        <br />
        Ваши данные:&nbsp;
        <br />
        <br />
        Фамилия :
        <asp:Label ID="lblFirstName" runat="server"></asp:Label>
        <br />
        Имя :
        <asp:Label ID="lblLastName" runat="server"></asp:Label>
        <br />
        Отчество :
        <asp:Label ID="lblFathersName" runat="server"></asp:Label>
        <br />
        <br />
        <asp:HyperLink ID="hlChangeCabinet" runat="server" 
            NavigateUrl="~/ChangeCabinet.aspx">Сменить</asp:HyperLink>
        
    
    </div>
    <div align="left">
        Сообщения :<br />
        <asp:Button ID="btnInMess" runat="server" onclick="btnInMess_Click" 
            Text="Входящие" Width="149px" />
        <br />
        <asp:Button ID="btnOutMess" runat="server" onclick="btnOutMess_Click" 
            Text="Исходящие" Width="149px" />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Чистка прочитанных" Width="149px" />
        <br />
        <asp:Button ID="btnNewMess" runat="server" onclick="btnNewMess_Click" 
            Text="Написать" Width="149px" />
    </div>
    <div align="center">
        Успеваемость и пропуски<br />
        <asp:Button ID="btnEdit" runat="server" Text="Редактор" 
            onclick="btnEdit_Click" />
        <br />
        <asp:Button ID="btnShow" runat="server" onclick="btnShow_Click" 
            Text="Просмотр" Width="84px" />
        <br />
        <asp:Button ID="btnReport" runat="server" onclick="btnReport_Click" 
            Text="Отчет" Width="83px" />
        <br />
        <asp:Button ID="btnBase" runat="server" onclick="btnBase_Click" Text="База" 
            Width="83px" />
    </div>
    </form>
</body>
</html>
