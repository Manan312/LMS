<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewApplication.aspx.cs" Inherits="LMS.Pages.ViewApplication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
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
    <title> View Application </title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="topnav" style="display: inline-flex">
            <div style="width: 40%; height: 50px; color: black;">
                <asp:HyperLink ID="Home" Style="color: #00C157" runat="server">LMS</asp:HyperLink>
                <asp:HyperLink ID="Contact" Style="color: #00C157" runat="server" NavigateUrl="~/Pages/Signup.aspx">SignUp</asp:HyperLink>
                <asp:HyperLink ID="HyperLink1" Style="color: #00C157" runat="server" NavigateUrl="~/Pages/ViewApplication.aspx">View Applicants</asp:HyperLink>
            </div>
            <div style="float: right; background: linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 40%; padding-left: 30%; border-radius: 50px 0 0 0; border-left: 2px solid black">

                <asp:LinkButton ID="Button1" CssClass="fa fa-bell" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server"><span id="count" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
                <asp:LinkButton ID="Create" CssClass="fa fa-plus" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server" Text="Add Employee" OnClick="Create_Click" />
                <asp:LinkButton ID="LKU" CssClass="" Style="color: white; width: auto; text-decoration: none" runat="server" Text="AsAM" OnClick="LKU_Click" />

            </div>
        </div>
        <div class="container">

            <div class="line1" style="width: 100%">
                <div class="item1" style="width: 100%">

                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div class="right">
                                <div style="display: inline-flex">
                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnshowcredentials" CssClass="button login__submit" runat="server" Text="Applicant Credentials" OnClick="btnshowcredentials_Click" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnshowDocuments" CssClass="button login__submit" runat="server" Text="Applicants Documents" OnClick="btnshowDocuments_Click" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnClear" CssClass="button login__submit" runat="server" Text="Clear Details" OnClick="btnClear_Click" />
                                                </td>


                                            </tr>
                                        </table>
                                    </div>
                                    <div style="margin-left: 80%; float: right">
                                        <asp:Button ID="backtoMain" CssClass="button login__submit" runat="server" Text="Back" OnClick="backtoMain_Click" />

                                    </div>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="credentials" CssClass="myGridStyle grdTask" Style="margin: 30px; width: auto" runat="server" AutoGenerateColumns="false" OnRowCommand="credentials_RowCommand" AllowPaging="true" OnPageIndexChanging="credentials_PageIndexChanging" PageSize="7">
                                            <Columns>
                                                <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Attendance">
                                                    <ItemTemplate>
                                                        <%#Eval("Email") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Password">
                                                    <ItemTemplate>
                                                        <%#Eval("Password") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <%#Eval("IsActive").ToString()=="True"?"Active":Eval("IsDeleted").ToString()=="True"?"Deleted":"UnActive" %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="DELETE">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="delete" Style="border-radius: 100%; width: auto; color: red; text-decoration: none" CssClass="fa fa-trash button login__submit" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="A" OnClientClick="return ConfirmDelete(this);" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Change Status">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Deactivate" Style="border-radius: 100%; width: auto; color: red; text-decoration: none" CssClass="fa fa-toggle-off button login__submit" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName='<%#Eval("IsActive").ToString()=="True"?"C":"D" %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EDIT">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="EDIT" Style="border-radius: 100%; width: auto; color: cornflowerblue; text-decoration: none" CssClass="fa fa-edit button login__submit" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="B" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="credentials" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="documents" CssClass="myGridStyle grdTask" Style="margin: 30px; width: auto" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="documents_PageIndexChanging" OnRowCommand="documents_RowCommand" PageSize="7">
                                            <Columns>
                                                <asp:TemplateField HeaderText="APPLICANT ID">
                                                    <ItemTemplate>
                                                        <%#"EIC2023"+Eval("AID") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Del" Style="border-radius: 100%;margin-left:140px; width: auto; color: red; text-decoration: none" CssClass="fa fa-trash button login__submit" runat="server" CommandArgument='<%#Eval("Folder") %>' CommandName="B" OnClientClick="return ConfirmDelete(this);"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="DownLoad">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Down" Style="border-radius: 100%;margin-left:140px; width: auto; color: cornflowerblue; text-decoration: none" CssClass="fa fa-download button login__submit" runat="server" CommandArgument='<%#Eval("Folder") %>' CommandName="A" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="documents" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grd2" CssClass="myGridStyle grdTask" Style="margin: 30px; width: auto" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand2" AllowPaging="true" OnPageIndexChanging="grd2_PageIndexChanging" PageSize="7">
                                            <Columns>
                                                <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TOTAL LEAVES">
                                                    <ItemTemplate>
                                                        <%#Eval("Leaves") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="VIEW">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnshow" Style="border-radius: 100%; width: auto; color: #0072B5; text-decoration: none" CssClass="fa fa-eye button login__submit" runat="server" CommandArgument='<%#Eval("IntId") %>' CommandName="C" OnClick="btnshow_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="APPROVE ALL">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtn2" CssClass="fa fa-check  button login__submit " Style="border-radius: 100%; width: auto; text-decoration: none" runat="server" ForeColor="#00C157" CommandArgument='<%#Eval("IntId") %>' CommandName="B"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="REJECT ALL">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtn1" CssClass="fa fa-times button login__submit" Style="border-radius: 100%; width: auto; text-decoration: none" runat="server" ForeColor="Red" CommandArgument='<%#Eval("intId")%>' CommandName="A"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grd" CssClass="myGridStyle grdTask" Style="margin: 30px; width: auto" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand" AllowPaging="true" OnPageIndexChanging="grd_PageIndexChanging" PageSize="7">
                                            <Columns>
                                                <asp:TemplateField HeaderText="EMPLOYEE NAME">
                                                    <ItemTemplate>
                                                        <%#Eval("Name") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                                <asp:TemplateField HeaderText=" Approval ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbla" runat="server" Text='<%#Eval("enumIsApproved").ToString()=="True"?"Approved":"Not Approved" %>' ForeColor='<%#Eval("enumIsApproved").ToString()=="True"?System.Drawing.ColorTranslator.FromHtml("#00C157"):System.Drawing.Color.Red %>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText=" Leave Status  ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblb" runat="server" Text='<%#Eval("IsActive").ToString()=="True"?"Active":"Unactive" %>' ForeColor='<%#Eval("IsActive").ToString()=="True"?System.Drawing.ColorTranslator.FromHtml("#00C157"):System.Drawing.Color.Red %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="APPROVE">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtn2" CssClass="fa fa-check button login__submit" Style="border-radius: 100%; width: auto; text-decoration: none;" ForeColor="#00C157" runat="server" CommandArgument='<%#Eval("IntId") %>' CommandName="B"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="REJECT">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtn1" CssClass="fa fa-times login__submit" Style="border-radius: 100%; width: auto; text-decoration: none" runat="server" ForeColor="Red" CommandArgument='<%#Eval("intId")%>' CommandName="A"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="grd" />
                                    </Triggers>
                                </asp:UpdatePanel>--%>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnshowcredentials" />
                            <asp:PostBackTrigger ControlID="btnshowDocuments" />
                            <asp:PostBackTrigger ControlID="btnClear" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
