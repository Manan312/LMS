<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpProfile.aspx.cs" Inherits="LMS.Pages.EmpProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu2" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2"

                    Font-Names="Verdana" Font-Size="Medium" ForeColor="#990000" StaticSubMenuIndent="10px"

                    Orientation="Horizontal" StaticDisplayLevels="2">

                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />

                    <DynamicHoverStyle BackColor="#990000" ForeColor="White" />

                    <DynamicMenuStyle BackColor="#FFFBD6" />

                    <StaticSelectedStyle BackColor="#FFCC66" />

                    <DynamicSelectedStyle BackColor="#FFCC66" />

                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />

                    <Items>

                        <asp:MenuItem Text="MenuItem 1" Value="MenuItem 1">

                            <asp:MenuItem Text="MenuItem1Leaf" Value="MenuItem1Leaf"></asp:MenuItem>

                        </asp:MenuItem>

                        <asp:MenuItem Text="MenuItem2" Value="MenuItem2">

                            <asp:MenuItem Text="MenuItem2Leaf" Value="MenuItem2Leaf" NavigateUrl="https://www.c-sharpcorner.com/blogs/static-menu-control1"></asp:MenuItem>

                            <asp:MenuItem Text="MenuItem2Leaf" Value="MenuItem2Leaf"></asp:MenuItem>

                        </asp:MenuItem>

                    </Items>

                    <StaticHoverStyle BackColor="#990000" ForeColor="White" />

                </asp:Menu>
        </div>
    </form>
</body>
</html>
