<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="LMS.Pages.Employee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/login.css" rel="stylesheet" />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <script>
        var object = { status: false, ele: null };
        function ConfirmDelete(ev) {
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
        <form id="form1" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="left">
                        <table class="mtable">
                            <tr>
                                <td>

                                    <asp:Label ID="lblName" runat="server" Text="">Welcome </asp:Label>
                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:TextBox ID="txtType" CssClass="login__input" Style="padding: 0px; width: 200px" runat="server" placeholder="Leave Type"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtType" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>

                                <td>

                                    <asp:TextBox ID="txtDate" CssClass="login__input" Style="padding: 0px; width: 200px" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" TargetControlID="txtDate" Format="dd/MM/yyyy" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtDate" ValidationGroup="A"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:TextBox ID="txtReason" CssClass="login__input" TextMode="MultiLine" Style="padding: 0px; margin: 0px; width: 200px" runat="server" placeholder="Reason for Leave"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtReason" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <asp:Button ID="btnsave" CssClass="button login__submit" Style="width: auto;" runat="server" Text="Submit" OnClick="btnsave_Click" ValidationGroup="A" /></td>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnrefresh" CssClass="button login__submit" Style="width: auto" runat="server" Text="Refresh" OnClick="btnrefresh_Click" /></td>

                                <td>
                                    <asp:Button ID="btnshow" CssClass="button login__submit" Style="width: auto" runat="server" Text="View" OnClick="btnshow_Click" />
                                    <asp:Button ID="btnClear" CssClass="button login__submit" Style="width: auto" runat="server" Visible="false" Text="Clear" OnClick="btnClear_Click" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnback" CssClass="button login__submit" Style="width: auto;" runat="server" Text="Back" OnClick="btnback_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div class="right">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:GridView ID="grd" runat="server" CssClass="myGridStyle" Style="margin-left: 30px" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand">
                            <Columns>

                                <asp:TemplateField HeaderText="TYPE OF LEAVE">
                                    <ItemTemplate>
                                        <%#Eval("LeaveType") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DATE OF LEAVE">
                                    <ItemTemplate>
                                        <%#Eval("Date").ToString().Substring(0,Eval("Date").ToString().IndexOf(" ")) %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="REASON">
                                    <ItemTemplate>
                                        <%#Eval("Reason") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="check">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk" CommandArgument="as" CommandName="E"/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="APPROVAL STATUS">
                                    <ItemTemplate>
                                        <asp:Label ID="lbla" runat="server" Text='<%#Eval("enumIsApproved").ToString()=="True"?"Approved":"Not Approved" %>' ForeColor='<%#Eval("enumIsApproved").ToString()=="True"?System.Drawing.Color.Green:System.Drawing.Color.Red %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EDIT">
                                    <ItemTemplate>
                                        <asp:Button ID="lbtn2" CssClass="button login__submit" Style="border-radius: 0px; width: auto" runat="server" ForeColor="Blue" Text="Edit" CommandArgument='<%#Eval("intId")%>' CommandName="B"></asp:Button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DELETE">
                                    <ItemTemplate>
                                        <asp:Button ID="lbtn1" CssClass="button login__submit" Style="border-radius: 0px; width: auto" runat="server" ForeColor="Red" Text="Delete" CommandArgument='<%#Eval("intId")%>' CommandName="A" OnClientClick="return ConfirmDelete(this);"></asp:Button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="grd" />
                </Triggers>
            </asp:UpdatePanel>
        </form>
    </div>
</asp:Content>
