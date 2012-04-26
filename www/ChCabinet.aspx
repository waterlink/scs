<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeCabinet.aspx.cs" Inherits="ChangeCabinet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Редактировать личные данные</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Фамилия :
        <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
        <br />
        Имя :
        <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
        <br />
        Отчество :
        <asp:TextBox ID="tbFathersName" runat="server"></asp:TextBox>
        <br />
        Телефон :
        <asp:TextBox ID="tbTelephone" runat="server"></asp:TextBox>
        <br />
        Контроль над (ФИО) :
        <asp:DropDownList ID="ddlForms" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSourceForms" DataTextField="form" DataValueField="form">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceForms" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCSDataBaseRedactorConnectionString %>" 
            SelectCommand="getAllForms" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddlPupilFLF" runat="server" 
            DataSourceID="SqlDataSourceGetAllPupils" DataTextField="flf" 
            DataValueField="flf" Height="16px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceGetAllPupils" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SCSDataBaseRedactorConnectionString %>" 
            SelectCommand="getAllPupilsFLFFromForm" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlForms" Name="form" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnOk" runat="server" onclick="btnOk_Click" Text="Изменить" />
        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Отмена" />
    
    </div>
    </form>
</body>
</html>
