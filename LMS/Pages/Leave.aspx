<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="LMS.Pages.Leave" %>
<%@ Register Src="~/sideMenu.ascx" TagPrefix="uc1" TagName="sideMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Leave.css" rel="stylesheet" />
    <link href="../css/sideMenu.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:sideMenu runat="server" id="sideMenu"/>
    <div class="Main">
        <div class="cen">
        Welcome ADMIN
        <br/>
            <br/>
        Please select the side menu bar for the actions needed to be performed.
            <br/>
            <br />
            Thank You!
        </div>
        </div>
</asp:Content>
