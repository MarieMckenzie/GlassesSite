<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="_1602967_Milestone1.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
 
        <h1>Order</h1>
    <!--(All users can access this page)-->

        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                You are logged in<br />
            </LoggedInTemplate>
            <AnonymousTemplate>
                You are not logged in<br />
            </AnonymousTemplate>
        </asp:LoginView>
       
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
        <br />
        <asp:DataList ID="DataList1" runat="server" DataKeyField="productId" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" Height="1003px" style="margin-right: 0px" Width="1558px">
            <ItemTemplate>
                <asp:Label ID="imageidLabel" runat="server" Text='<%# Eval("imageid") %>' />
                <br />
                &nbsp;#:&nbsp;<asp:Label ID="productIdLabel" runat="server" Text='<%# Eval("productId") %>' />
                &nbsp;<br />
                <asp:Label ID="prductNameLabel" runat="server" Text='<%# Eval("prductName") %>' />
                &nbsp;<asp:Label ID="productDescriptionLabel" runat="server" Text='<%# Eval("productDescription") %>' />
                <br />
                JMD:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                <br />
                <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
                <br />
                <br />
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


    </asp:Content>
