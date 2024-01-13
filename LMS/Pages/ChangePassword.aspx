<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="LMS.Pages.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="forms">
        <div class="login__field">
            <i class="login__icon fas fa-lock" style="width: auto; margin-left: 20px;"></i>

            <asp:TextBox ID="txtId" Font-Size="Large" CssClass="login__input" Style="width: auto; margin-left: 20px;" AutoCompleteType="Disabled" runat="server" placeholder="Old Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RF1" runat="server" ErrorMessage="Required Field" ForeColor="Red" Style="" ControlToValidate="txtId" ValidationGroup="A"></asp:RequiredFieldValidator>
            <br />
            <br />
        </div>
        <div class="login__field">
            <i class="login__icon fas fa-lock" style="width: auto; margin-left: 20px;"></i>
            <asp:TextBox ID="txtpasas" Font-Size="Large" CssClass="login__input" AutoCompleteType="Disabled" Style="width: auto; margin-left: 20px;" placeholder="New Password" TextMode="Password" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Style="font-size: 20px" ForeColor="Red" ControlToValidate="txtpasas" ValidationGroup="A"></asp:RequiredFieldValidator>
        </div>
        <br />

        <div class="login__field">
            <i class="login__icon fas fa-lock" style="width: auto; margin-left: 20px;"></i>
            <asp:TextBox ID="conpas" Font-Size="Large" CssClass="login__input" AutoCompleteType="Disabled" Style="width: auto; margin-left: 20px;" placeholder="Confirm Password" TextMode="Password" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" ForeColor ="Red" runat="server" ControlToCompare="txtpasas" ControlToValidate="conpas" ErrorMessage="Password not same !!" ValidationGroup="A"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field"  ForeColor="Red" ControlToValidate="conpas" ValidationGroup="A"></asp:RequiredFieldValidator>
        </div>
        <div class="login__field">
            <asp:Button ID="Button1" ValidationGroup="A" runat="server" CssClass="login__submit" Text="Submit" OnClick="Button1_Click" />
        </div>

    </div>
</asp:Content>
