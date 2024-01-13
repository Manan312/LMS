<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="LMS.Pages.Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/MainPage.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="topnav" id="topn" style="display: inline-flex;">
                <div style="width: 40%; height: 50px; color: black;">
                    <asp:HyperLink ID="Home" Style="color: #00C157" runat="server">LMS</asp:HyperLink>
                    <asp:HyperLink ID="Contact" Style="color: #00C157" runat="server">Contact</asp:HyperLink>
                </div>
                <div style="float: right; background: linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 20%; padding-left: 40%; border-radius: 50px 0 0 0; border-left: 4px solid black">
                    <asp:LinkButton ID="Button1" CssClass="fa fa-bell lkbtn" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server"><span id="count" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" CssClass="fa fa-bell lkbtn" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" Visible="false" runat="server"><span id="Span1" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
                    <asp:LinkButton ID="lkbt1n" CssClass="lkbtn" Style="color: white; width: auto; text-decoration: none;" runat="server" />
                </div>
            </div>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" CancelControlID="cancel" TargetControlID="lkbt1n" PopupControlID="Panel6" runat="server"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="Panel6" runat="server" CssClass="ProfilePopup" ClientIDMode="Static">

                <table class="mtable" id="table8" style="margin: 2%" runat="server">
                    <tr>

                    </tr>

                    <tr>
                        <td>
                            <asp:LinkButton ID="LKU" CssClass="lkbtn" Style="" runat="server" Text="Logout" OnClick="LKU_Click" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="cancel" CssClass="lkbtn" runat="server" Text="Cancel" OnClick="LKU_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        
       <div class="main">

       </div>
    </form>
</body>
</html>
