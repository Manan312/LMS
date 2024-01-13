<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topMenu.ascx.cs" Inherits="LMS.topMenu" %>

<div class="topnav" style="display: inline-flex;width:100%;">
    <div style="width: 30%; height: 50px; color: black;">
        <asp:HyperLink ID="Home" Style="color: #00C157" runat="server">LMS</asp:HyperLink>
        <asp:HyperLink ID="Contact" Style="color: #00C157" runat="server">Contact</asp:HyperLink>
    </div>
    <div style="float: right; background:linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 70%; padding-left: 54%; border-radius: 50px 0 0 0; border-left: 2px solid black">
        <%--<asp:LinkButton ID="Button1" CssClass="fa fa-bell" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server" />--%>
        <asp:HyperLink ID="Noti" CssClass="fa fa-bell" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server"></asp:HyperLink>
        <asp:HyperLink ID="Logot" CssClass="" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server"></asp:HyperLink>
        <%--<asp:linkbutton id="lku" cssclass="" style="color: white; width: auto; text-decoration: none" runat="server" onclick="lku_click" />--%>
    </div>
</div>
<script>
    function logout() {
        sessionStorage.clear();
    }
</script>
