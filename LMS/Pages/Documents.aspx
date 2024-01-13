<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="LMS.Pages.Documents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Documents Upload</title>
    <link href="../css/MainPage.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <script>
        var object = { status: false, ele: null };
        function ConfirmDelete(ev) {
            debugger;
            if (object.status) { return true; };
            swal({
                title: "Are you sure?",
                text: "Your will not be able to recover this Record",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: true
            },
                function () {
                    object.status = true;
                    object.ele = ev;
                    object.ele.click();
                });
            return false;
        };
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="topnav" style="display: inline-flex">
            <div style="width: 40%; height: 50px; color: black;">
                <asp:HyperLink ID="Home" Style="color: #00C157" runat="server" NavigateUrl="~/Pages/Documents.aspx">Eicore</asp:HyperLink>

            </div>
            <div style="float: right; background: linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 14%; padding-left: 46%; border-radius: 50px 0 0 0; border-left: 2px solid black">

                <asp:LinkButton ID="LKU" CssClass="" Style="color: white; margin-left: 100px; width: auto; text-decoration: none" runat="server" OnClick="LKU_Click" Text="LogOut" />

            </div>
        </div>
        <div class="container">
            <div class="line1" style="width: 100%">
                <div class="item1" style="width: 100%; padding-bottom: 3px;">
                    <div class="forms">
                        <asp:Label ID="Head" runat="server" Font-Size="30px" Text=""></asp:Label><br />
                        <asp:Label ID="Label6" runat="server" Font-Size="30px" Text="Save File as DocumentName eg:Photo as Photo"></asp:Label>
                        <br />

                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <table id="doc" runat="server">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Font-Size="30px" Text="Photo"></asp:Label>
                                            <span style="color: red">*</span>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="Photo" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="Photo"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>AdharCard<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="adhar" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="adhar"></asp:RequiredFieldValidator></td>

                                    </tr>
                                    <tr>
                                        <td>Pan Card<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="Pan" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="Pan"></asp:RequiredFieldValidator></td>

                                    </tr>
                                    <tr>
                                        <td>10th Marksheet<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="Mar10" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="Mar10"></asp:RequiredFieldValidator></td>

                                    </tr>
                                    <tr>
                                        <td>10th Certificate<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="Cer10" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="Cer10"></asp:RequiredFieldValidator></td>

                                    </tr>
                                    <tr>
                                        <td>12th Marksheet<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="Mar12" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="Mar12"></asp:RequiredFieldValidator></td>

                                    </tr>
                                    <tr>
                                        <td>12th Certificate<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="Cer12" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="Cer12"></asp:RequiredFieldValidator></td>

                                    </tr>

                                    <tr>
                                        <td>Graduation Course<span style="color: red">*</span></td>
                                        <td>
                                            <asp:TextBox ID="GrdCrse" ToolTip="Kindly write the Highest Qualification"  Style="width: 347px" CssClass="flupload" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="GrdCrse"></asp:RequiredFieldValidator></td>

                                    </tr>
                                    <tr>
                                        <td>Graduation Marksheet<span style="color: red">*</span></td>
                                        <td>
                                            <asp:FileUpload ID="MarGrd" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="A" ErrorMessage="RequiredFieldValidator" ControlToValidate="MarGrd"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>Do you Hold any Other Course?<span style="color: red">*</span></td>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonList2" RepeatDirection="Horizontal" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Selected="True" Text="No" Value="2"> </asp:ListItem>
                                            </asp:RadioButtonList>

                                        </td>

                                    </tr>
                                    <tr id="Oth" runat="server" visible="false">
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Font-Size="30px" Text="Others"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" Style="width: 347px" CssClass="flupload" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" Font-Size="15px" runat="server" Text="Label">(If done.)</asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="Moth" runat="server" visible="false">
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Font-Size="30px" Text="Marksheet Of the Course"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload2" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Do you Hold some Experience?<span style="color: red">*</span></td>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Selected="True" Text="No" Value="2"> </asp:ListItem>
                                            </asp:RadioButtonList>

                                        </td>

                                    </tr>
                                    <tr id="ExpYear" runat="server" visible="false">
                                        <td>Experience Years</td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" Style="width: 347px" CssClass="flupload" runat="server"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr id="ExpLetter" runat="server" visible="false">
                                        <td>Experience Letter</td>
                                        <td>
                                            <asp:FileUpload ID="expLetterUp" CssClass="flupload" runat="server"></asp:FileUpload>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" Font-Size="15px" runat="server" Text="Label">(If more than one kindly upload a single pdf of all of the letters.)</asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Driver's License</td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" CssClass="flupload" runat="server"></asp:FileUpload>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Passport</td>
                                        <td>

                                            <asp:FileUpload ID="Passport" CssClass="flupload" runat="server"></asp:FileUpload>
                                        </td>


                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="FileSubmit" CssClass="login__submit button" ValidationGroup="A" Style="width: auto" runat="server" Text="File Submit" OnClick="FileSubmit_Click" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="FileSubmit" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
