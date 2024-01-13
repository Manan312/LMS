<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="LMS.Sidebar" %>
<div class="sidebar">
    <div class="Image">
        <div>
            <asp:Image ID="EmpImage" runat="server" style="border-radius:100%"  />
        </div>
        <asp:FileUpload ID="FileUpload1" runat="server" Text="" CssClass="fa fa-pen" />
    </div>
    <div class="details">

    </div>
</div>