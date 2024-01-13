<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="LMS.Pages.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <link href="../css/login.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
</head>
<body>
    <div class="container" style="margin-top: 10px">
        <div class="screen">
            <div class="screen__content">
                <form id="form1" runat="server" class="login">
                    <div class="login__field">
                        <i class="login__icon fas fa-user" style="width: auto; margin-left: 20px;"></i>

                        <asp:TextBox ID="txtName" Font-Size="Large" CssClass="login__input" Style="width: auto; margin-left: 20px;" AutoCompleteType="Disabled" runat="server" placeholder="Name"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ForeColor="Red" Style="font-size: 20px" ControlToValidate="txtName" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-user" style="width: auto; margin-left: 20px;"></i>

                        <asp:TextBox ID="txtId1" Font-Size="Large" CssClass="login__input" Style="width: auto; margin-left: 20px;" AutoCompleteType="Disabled" runat="server" placeholder="Email Id"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RF1" runat="server" ErrorMessage="Required Field" ForeColor="Red" Style="font-size: 20px" ControlToValidate="txtId1" ValidationGroup="A"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtId1" ErrorMessage="Please Enter a valid Email" Style="font-size: 20px" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock" style="width: auto; margin-left: 20px;"></i>
                        <asp:TextBox ID="txtpass1" Font-Size="Large" CssClass="login__input" Style="width: auto; margin-left: 20px;" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Style="font-size: 20px" ForeColor="Red" ControlToValidate="txtpass1" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btn_submit" CssClass="button login__submit" Style="width: auto; margin-left: 50px;" runat="server" ValidationGroup="A" Text="Sign Up" OnClick="btn_submit_Click" />
                    <asp:Button ID="btnBack" CssClass="button login__submit" Style="width: auto; margin-left: 70px;" runat="server"  Text="Back" OnClick="btnBack_Click" />

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
