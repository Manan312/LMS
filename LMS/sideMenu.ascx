<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sideMenu.ascx.cs" Inherits="LMS.sideMenu" %>

<div class="sideMenu">
    <div class="sideBar">
        <asp:HyperLink ID="hl1" runat="server" CssClass="hyperlink" NavigateUrl="Pages/Main.aspx">Leave Management</asp:HyperLink>
    </div>
    <div class="sideBar">
        <asp:HyperLink ID="hl2" runat="server" CssClass="hyperlink">Employee Management</asp:HyperLink>
    </div>
    <div class="sideBar">
        <asp:HyperLink ID="hl3" runat="server" CssClass="hyperlink">Leave Master</asp:HyperLink>
    </div>
    <div class="sideBar">
        <asp:HyperLink ID="hl4" runat="server" CssClass="hyperlink">New Employee Data</asp:HyperLink>
    </div>
</div>