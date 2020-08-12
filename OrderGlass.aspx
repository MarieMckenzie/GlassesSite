<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderGlass.aspx.cs" Inherits="202_UserMaintenance.OrderGlass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 21%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="True" Font-Size="X-Large" Font-Underline="True" Text="Buy Sumn Fi Yuh Face"></asp:Label>
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td>SHOP BY CATEGORY :&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server">WOMEN</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server">MEN</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server">ALL</asp:LinkButton>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <asp:DataList ID="DataList1" runat="server" DataKeyField="productId" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" Height="1003px" style="margin-right: 0px" Width="1558px">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="text-align: center">
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("productImage") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">#:
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("prductName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("productDescription") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">JMD<asp:Label ID="Label5" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="151px" ImageUrl="~/Images/Add.png" Width="324px" />
                        </td><!--onclick add to summary page-->

                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>" SelectCommand="SELECT * FROM [product] WHERE ([category] = @category)">
            <SelectParameters>
                <asp:QueryStringParameter Name="category" QueryStringField="cat" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
