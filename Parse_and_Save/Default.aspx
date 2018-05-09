<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Parse_and_Save.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 154px;
        }
    </style>
</head>
<body style="text-align: left">
    <form id="form1" runat="server">
    <div style="height: 586px">
    
        <h1 style="background-color: #C0C0C0; height: 106px; text-align: center;">
            <br />
            Web application for parse and save data to database</h1>
        <p style="text-align: left; width: 774px; margin-left: 4px">
            Input word to search in text file:</p>
        <asp:TextBox ID="TB_word" runat="server" Width="190px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Height="25px" OnClick="Button1_Click" style="margin-top: 2px" Text="Find" Width="86px" />
&nbsp;
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" Width="286px" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT * FROM [Sentence]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="163px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="sentence" HeaderText="sentence" SortExpression="sentence" />
                <asp:BoundField DataField="count" HeaderText="count" SortExpression="count" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
