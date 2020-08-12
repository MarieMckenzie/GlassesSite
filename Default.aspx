<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_1602967_Milestone1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HyperLink runat="server" NavigateUrl="~/OrderGlass">Order Glasses</asp:HyperLink><br />
        (All users including <br />anonymous users)<br /><br />

    <asp:HyperLink runat="server" NavigateUrl="~/Account/Manage.aspx">Edit My Account</asp:HyperLink><br />
        (All authenticated users)<br /><br />

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Maintenance">Maintain Users and Roles</asp:HyperLink><br />
        (Only users associated <br />with the Admin role)

</asp:Content>
