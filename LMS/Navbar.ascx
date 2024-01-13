<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="LMS.Navbar" %>
<body>
<div class="topnav" style="display: inline-flex">
    <div style="width: 40%; height: 50px; color: black;">
        <asp:HyperLink ID="Home" Style="color: #00C157" runat="server" NavigateUrl="~/Pages/MainPage.aspx">LMS</asp:HyperLink>
        <asp:HyperLink ID="Contact" Style="color: #00C157" runat="server" NavigateUrl="~/Pages/Signup.aspx">Contact</asp:HyperLink>
    </div>
    <div style="float: right; background: linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 20%; padding-left: 60%; border-radius: 50px 0 0 0; border-left: 2px solid black">

        <asp:LinkButton ID="Button1" CssClass="fa fa-bell" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server"><span id="count" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
        <asp:LinkButton ID="LKU" CssClass="" Style="color: white; width: auto; text-decoration: none" runat="server" Text="AsAM"  OnClick="LKU_Click"/>

    </div>

</div>

</body>