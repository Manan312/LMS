<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="EmpDetails.aspx.cs" Inherits="LMS.Pages.EmpDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../css/login.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>

                    <td>
                        <asp:Button ID="btnshow" CssClass="button login__submit" runat="server" Text="View Details" OnClick="btnshow_Click" />
                        <asp:Button ID="btnClear" CssClass="button login__submit" Visible="false" runat="server" Text="Clear Details" OnClick="btnClear_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnback" CssClass="button login__submit" runat="server" Text="Back to Previous Page" OnClick="btnback_Click" /></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                    <asp:GridView ID="grd" runat="server" Style="margin: 30px;" CssClass="myGridStyle" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand" >
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <%#Eval("EmpId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                <ItemTemplate>
                                    <%#Eval("Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PASSWORD">
                                <ItemTemplate>
                                    <%#Eval("Password") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DESIGNATION">
                                <ItemTemplate>
                                    <%#Eval("Level") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DEPARTMENT">
                                <ItemTemplate>
                                    <%#Eval("Department") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DATE OF JOINING">
                                <ItemTemplate>
                                    <%#Eval("Date") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                
            <asp:TemplateField HeaderText="VIEW">
                <ItemTemplate>
                            <asp:Button ID="lbl12" runat="server" Style="border-radius: 0px" CssClass="button login__submit" ForeColor="Blue" Text="View" CommandArgument='<%#Eval("EmpId") %>' CommandName="C"></asp:Button>
                        </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EDIT">
                <ItemTemplate>
                            <asp:Button ID="lbtn2" runat="server" Style="border-radius: 0px" CssClass="button login__submit" ForeColor="Blue" Text="Edit" CommandArgument='<%#Eval("EmpId") %>' CommandName="B"></asp:Button>
                        </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="DELETE">
                <ItemTemplate>
                            <asp:Button ID="lbtn1" runat="server" Style="border-radius: 0px" CssClass="button login__submit" ForeColor="Red" Text="Delete" CommandArgument='<%#Eval("EmpId")%>' CommandName="A" OnClientClick="return ConfirmDelete(this);"></asp:Button>
                        </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            </asp:GridView>
                    </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="grd" />
                </Triggers>
            </asp:UpdatePanel>

        </div>
    </form>
</asp:Content>
