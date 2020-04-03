<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="InventoryManager.MainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Page</title>
    <style>
* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
</head>
<body>
  <form id="form1" runat="server">
        
      <div class="row">
          <div class="column">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="InventoryLevels" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Align="center" style="margin-top: 21px">
                <Columns>
                    <%--alternate way to display database elements using eval label--%>

                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName"></asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>


                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399"></FooterStyle>

                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF"></HeaderStyle>

                <PagerStyle HorizontalAlign="Left" BackColor="#99CCCC" ForeColor="#003399"></PagerStyle>

                <RowStyle BackColor="White" ForeColor="#003399"></RowStyle>

                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#EDF6F6"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#0D4AC4"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#D6DFDF"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#002876"></SortedDescendingHeaderStyle>

              
            </asp:GridView>
           
       
            <asp:SqlDataSource runat="server" ID="InventoryLevels" ConnectionString='<%$ ConnectionStrings:InventoryLevelsConnectionString %>' SelectCommand="SELECT [ItemName], [Quantity] FROM [Inventory]">
            </asp:SqlDataSource>
        </div>

      <div class="column" style="text-align: right; margin-top: 21px;">
            
                 <asp:DropDownList runat="server" ID="itemNameInput" DataSourceID="InventoryLevels" DataTextField="ItemName" DataValueField="ItemName"></asp:DropDownList>
                 <asp:Label ID="QuantityLabel" runat="server" Text="Quantity:"></asp:Label>
                 <asp:TextBox ID="UpdateAmount" runat="server"></asp:TextBox>
                 <asp:Button ID="UpdateButton" runat="server" Width="70" Text="Update" OnClick="UpdateButton_Click"/>
                 <br />
                 <asp:Label ID="NewItemLabel" runat="server" Text="New Item Name:"></asp:Label>
                 <asp:TextBox runat="server" ID="newItemName"></asp:TextBox>
                 <asp:Button ID="InsertButton" runat="server" Width="70" Text="Insert" OnClick="InsertButton_Click" />
           </div>

      </div>
    </form>
</body>
</html>
