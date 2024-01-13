<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="LMS.Pages.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/login.css" rel="stylesheet" />
     <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
        
		<div class="screen" style="width:400px">
            <div  class="screen__content">
    <form id="form1" runat="server" class="login">
        <asp:Label ID="lblUpdate" runat="server" Font-Size="X-Large" ForeColor="#00C157" Text="" Visible="false"></asp:Label>
            <table class="login__field">
                <tr class="login__field">
                    <td>
                        <i class="login__icon fas fa-user" id="use" runat="server"></i>
                    
                        <asp:TextBox CssClass="login__input" style="width:200px" ID="txtId" placeholder="Employee Id" Font-Size="Large" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="login__field">
                    <td>
                        <i class="login__icon fas fa-lock" id="pas" runat="server"></i> 
                    
                        <asp:TextBox CssClass="login__input" style="width:200px" ID="txtpass"  placeholder="Password"  Font-Size="Large"  runat="server" ></asp:TextBox>
                    </td>
                    
                </tr>
                <tr class="login__field">
                    <td>
                        <i class="login__icon fas fa-user" id="na" runat="server"></i> 
                        <asp:TextBox CssClass="login__input" style="width:200px" ID="txtName" placeholder="Employee Name" Font-Size="Large" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="login__field">
                    <td>
                        <i class="login__icon fas fa-building" id="le" runat="server"></i>
                        <asp:TextBox CssClass="login__input" style="width:200px" ID="txtLID" placeholder="Level" Font-Size="Large" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="login__field">
                    <td>
                        <i class="login__icon fas fa-laptop-code" id="de" runat="server"></i>
                        <asp:TextBox CssClass="login__input" style="width:200px"  ID="txtDID" placeholder="Department" Font-Size="Large" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="login__field">
                   
                    <td>
                        <asp:Button ID="btn_backEmp" CssClass="button login__submit" style="width:auto" runat="server" Text="Back" Visible="false" OnClick="btn_backEmp_Click" />
                        <asp:Button ID="btnback" CssClass="button login__submit" style="width:auto" runat="server" Text="Back"  OnClick="btn_back_Click" />
                    </td>
                    
                    <td>
                        <%--<asp:Button ID="btn_submit" runat="server" ValidationGroup="A" Text="Submit" OnClick="btn_submit_Click" />--%>
                        <asp:Button ID="btnnew" CssClass="button login__submit" style="width:auto;margin-left:-40px" runat="server" ValidationGroup="A" Text="Create"  OnClick="btn_record_Click" OnClientClick="return validate()" />
                        <asp:Button ID="btnedit" CssClass="button login__submit" style="width:auto;margin-left:40px" runat="server" ValidationGroup="A" Text="Update" Visible="false" OnClick="btn_edit_Click"  />
                    </td>
                </tr>
            </table>
             
    </form>
                
           </div>
            <div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>
     </div>
</div>
    <script>
        function validate() {
            var d = document.getElementById('<%= txtId.ClientID %>').value;
            var d1 = document.getElementById('<%= txtpass.ClientID %>').value;
            var d2 = document.getElementById('<%= txtName.ClientID %>').value;
            var d3 = document.getElementById('<%= txtLID.ClientID %>').value;
            var d4 = document.getElementById('<%= txtDID.ClientID %>').value;
            if (d == "" || d1 == "" || d2 == "" || d3 == "" || d4 == "") {
                alert("Please Enter valid Input");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
