<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Design.aspx.cs" Inherits="LMS.Pages.Design" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Design.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
    
        
        function sidebar(p) {
            document.getElementById(p).classList.add("viewPopup");
            document.getElementById(p).classList.remove("remPopup");
            document.getElementById("mad").classList.add("pop");
        }
        function rside(p) {
            Console.log(p);
            document.getElementById(p).classList.remove("viewPopup");
            document.getElementById(p).classList.add("remPopup");
            document.getElementById("mad").classList.remove("pop");
        }
        var a = "Panel2";
        function drops() {
            document.getElementById(a).classList.add("view");
            document.getElementById(a).classList.remove("disapper");
        }
        function rdrops() {
            document.getElementById(a).classList.remove("view");
            document.getElementById(a).classList.add("disapper");
        }

    </script>
</head>
<body id="mad" class="" style="">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="topnav col-sm-12" style="display: inline-flex; height: 60px;">
            <div class="" style="width: 40%; height: 50px; color: black; margin-right: 140px">
                <asp:HyperLink ID="Home" Style="color: #00C157" runat="server">LMS</asp:HyperLink>
                <asp:HyperLink ID="Contact" Style="color: #00C157" runat="server">Contact</asp:HyperLink>
            </div>
            <div class="" style="float: right; background: linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 100%; padding-left: 34%; border-radius: 50px 0 0 0; border-left: 2px solid black">

                <asp:LinkButton ID="Button1" CssClass="fa fa-bell" OnClientClick="drops()" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server"><span id="count" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="modalBackgrounddrop" runat="server" CancelControlID="Button4" TargetControlID="Button1" PopupControlID="Panel2">
                                
                                
                            </ajaxToolkit:ModalPopupExtender>
                            <asp:Panel ID="Panel2" runat="server" ClientIDMode="Static" CssClass="dPopup">
                                <table class="mtable" id="table1" style="margin: 30px" runat="server">
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="TextBox2" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Leave Type"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>

                                            <asp:TextBox ID="TextBox3" CssClass="login__input" Style="padding: 0px; width: 300px" AutoCompleteType="Disabled" runat="server" placeholder="Date Of Leave"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="TextBox7" CssClass="login__input" TextMode="MultiLine" Rows="4" Style="padding: 0px; margin: 0px; font-weight: lighter; width: 300px" runat="server" placeholder="Reason for Leave"></asp:TextBox>

                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            <asp:Button ID="Button3" CssClass="button login__submit" Style="width: auto; margin-left: 50px;" runat="server" Text="Submit" OnClick="Button2_Click1" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button4" CssClass="button login__submit"  Style="width: auto; margin-left: -50px;" runat="server" Text="Delete" OnClientClick="rdrops()" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                <asp:LinkButton ID="Create" CssClass="fa fa-plus" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server" Text="Add" />
                <asp:LinkButton ID="LKU" CssClass="" Style="color: white; width: auto; text-decoration: none" runat="server" Text="AsAM" />
            </div>
        </div>
        <div class="main container-fluid">
            
            <div class="line1">
                <div class="item1 col-sm-8">
                </div>
                <div class="item2" style="border: none">
                    <div class="item col-sm-4" style="width: 095%; height: 455px; padding: 0px; margin: 10px 10px 15px 10px">
                        <div class="forms">
                            <asp:Button ID="AddNew" runat="server" Text="AddNew" CssClass="button login__submit" OnClick="AddNew_Click1" OnClientClick="sidebar(Panel1)" />

                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="modalBackground" runat="server" CancelControlID="Button5" TargetControlID="AddNew" PopupControlID="Panel1">
                                
                                
                            </ajaxToolkit:ModalPopupExtender>
                            <asp:Panel ID="Panel1" runat="server" CssClass="Popup">
                                <table class="mtable" id="table4" style="margin: 30px" runat="server">
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="TextBox4" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Leave Type"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>

                                            <asp:TextBox ID="TextBox5" CssClass="login__input" Style="padding: 0px; width: 300px" AutoCompleteType="Disabled" runat="server" placeholder="Date Of Leave"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="TextBox6" CssClass="login__input" TextMode="MultiLine" Rows="4" Style="padding: 0px; margin: 0px; font-weight: lighter; width: 300px" runat="server" placeholder="Reason for Leave"></asp:TextBox>

                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            <asp:Button ID="Button2" CssClass="button login__submit" Style="width: auto; margin-left: 50px;" runat="server" Text="Submit" OnClick="Button2_Click1" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button5" CssClass="button login__submit" Style="width: auto; margin-left: -50px;" runat="server" Text="Delete" OnClientClick="rside(this)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="item col-sm-4" style="width: 095%; height: 455px; padding: 0px; margin: 10px">
                        <div class="forms">
                            <asp:TextBox ID="TextBox1" CssClass="login__input" TextMode="MultiLine" Rows="4" Style="padding: 0px; margin: 0px; font-weight: lighter; width: 300px" runat="server" placeholder="Reason for Leave"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line">
                <div class="item"></div>
                <div class="item"></div>
                <div class="item"></div>
            </div>
            <div class="line">
                <div class="item"></div>
                <div class="item"></div>
                <div class="item"></div>
            </div>
            <div class="line">
                <div class="item"></div>
                <div class="item"></div>
                <div class="item"></div>
            </div>
        </div>
    </form>
</body>
</html>
