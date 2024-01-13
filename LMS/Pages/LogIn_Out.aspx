<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn_Out.aspx.cs" Inherits="LMS.Pages.LogIn_Out" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../css/login.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'/>
</head>
<body>

    <div class="container">
        <div class="screen">
		<div class="screen__content">
    <form id="form2" runat="server" class="login">
            <div class="login__field">
                <i class="login__icon fas fa-user"></i>
                
                <asp:TextBox ID="txtId" Font-Size="Large" CssClass="login__input" runat="server" placeholder="User Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RF1" runat="server" ErrorMessage="Required Field" ForeColor="Red"  style="font-size:20px"  ControlToValidate="txtId" ValidationGroup="A"></asp:RequiredFieldValidator>
            </div>
        <div class="login__field">
                   <i class="login__icon fas fa-lock"></i> 
                        <asp:TextBox ID="txtpass" Font-Size="Large"  CssClass="login__input" placeholder="Password"   TextMode="Password" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" style="font-size:20px" ForeColor="Red" ControlToValidate="txtpass" ValidationGroup="A"  ></asp:RequiredFieldValidator>
            </div>
               <asp:Button ID="btn_submit" CssClass="button login__submit" style="width:auto" runat="server"  ValidationGroup="A" Text="Log In  " OnClick="btn_submit_Click" />
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
</body>
</html>
