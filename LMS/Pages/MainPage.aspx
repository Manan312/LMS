<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="LMS.Pages.MainPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/MainPage.css" rel="stylesheet" />
    <%--<link href="../css/login.css" rel="stylesheet" />--%>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.0.1/sweetalert.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

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
        function displaytoggle(ev) {
            var d = document.getElementById("ddlstatus.ClientID");
            var styled = d.style.display;
            if (styled == "none") {
                d.style.display = "";
            }
            else {
                d.style.display = "none";
            }
        }
        var p = "Panel1";
        function sidebar() {
            document.getElementById(p).classList.add("viewPopup");
            document.getElementById(p).classList.remove("remPopup");
            document.getElementById("mad").classList.add("pop");
        }
        function rside() {
            document.getElementById(p).classList.remove("viewPopup");
            document.getElementById(p).classList.add("remPopup");
            document.getElementById("mad").classList.remove("pop");
        }
        var a = "Panel2";
        function sidebara() {
            debugger;
            document.getElementById(a).classList.add("viewPopup");
            document.getElementById(a).classList.remove("remPopup");
            document.getElementById("mad").classList.add("pop");

        }
        function rsidea() {
            document.getElementById(a).classList.remove("viewPopup");

            document.getElementById(a).classList.add("remPopup");

            document.getElementById("mad").classList.remove("pop");
        }
        var t = "Panel3";
        function rsidetask() {
            document.getElementById(t).classList.remove("viewPopup");

            document.getElementById(t).classList.add("remPopup");

            document.getElementById("mad").classList.remove("pop");
        }
        function sidebarTask() {
            document.getElementById(t).classList.add("viewPopup");
            document.getElementById(t).classList.remove("remPopup");

            document.getElementById("mad").classList.add("pop");
        }
    </script>
</head>
<body id="mad">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="topnav" id="topn" style="display: inline-flex;">
            <div style="width: 40%; height: 50px; color: black;">
                <asp:HyperLink ID="Home" Style="color: #00C157" runat="server">LMS</asp:HyperLink>
                <asp:HyperLink ID="Contact" Style="color: #00C157" runat="server">Contact</asp:HyperLink>
            </div>
            <div style="float: right; background: linear-gradient(190deg,#00C157, #CBDD6E ); color: black; display: inline-flex; width: 20%; padding-left: 40%; border-radius: 50px 0 0 0; border-left: 4px solid black">
                <asp:DropDownList ID="ddlstatus" CssClass="login__input" Style="margin-left: -300px; width: auto; border-radius: 5px; font-family: 'Times New Roman', Times, serif; background-color: white; font-weight: lighter" runat="server" Visible="false">
                </asp:DropDownList>
                <asp:LinkButton ID="Button1" CssClass="fa fa-bell lkbtn" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" runat="server" OnClick="Button1_Click"><span id="count" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" CssClass="fa fa-bell lkbtn" Style="color: white; width: auto; margin-right: 50px; text-decoration: none" Visible="false" runat="server" OnClick="LinkButton1_Click"><span id="Span1" style="position: absolute; top: 1px; font-size: 20px; color: red" runat="server">0</span></asp:LinkButton>
                <asp:LinkButton ID="lkbt1n" CssClass="lkbtn" Style="color: white; width: auto; text-decoration: none;" runat="server" OnClick="LKU_Click" />
            </div>
        </div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender5" BackgroundCssClass="" runat="server" CancelControlID="cancel" TargetControlID="lkbt1n" PopupControlID="Panel6">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="Panel6" runat="server" CssClass="ProfilePopup" ClientIDMode="Static">

            <table class="mtable" id="table8" style="margin:2%" runat="server">
                <tr>
                    <td>
                        <asp:LinkButton CssClass="lkbtn" Style="" ID="LinkButton6" runat="server" OnClick="LinkButton6_Click1">Profile</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LKU" CssClass="lkbtn"  Style="" runat="server" Text="Logout" OnClick="LKU_Click" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="cancel" CssClass="lkbtn"  runat="server" Text="Cancel" OnClick="LKU_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div class="main">
            <div style="display: inline-flex; width: 100%">
                <div style="width: 88%; margin: 0px 20px 0 20px">

                    <h1>My Dashboard</h1>
                </div>
                <div style="float: right;">
                    <asp:Button ID="EmpD" runat="server" CssClass="button login__submit" Style="margin-left: -140px; width: auto" Text="Employee Details" Visible="false" OnClick="EmpD_Click" />
                </div>
            </div>
            <div class="line1">
                <div class="item1">
                    <div class="right">
                        <%-- <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnshow" Visible="false" CssClass="button login__submit" Style="width: auto;" runat="server" Text="View" OnClick="btnshow_Click" />
                                    <asp:Button ID="btnClear" CssClass="button login__submit" Style="width: auto;" runat="server" Visible="false" Text="Clear" OnClick="btnClear_Click" />
                                </td>
                            </tr>
                        </table>--%>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>

                                <asp:Calendar ID="Calendar" OnDayRender="Calendar_DayRender" NextMonthText=">>" Font-Bold="true" PrevMonthText="<<" WeekDayStyle-BorderStyle="Solid" runat="server" Height="857px" Width="824px" Style="margin: 30px 20px" OnSelectionChanged="Calendar_SelectionChanged"></asp:Calendar>

                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="Calendar" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <%--CheckIn CheckOut--%>
                <div class="item2" style="border: none">
                    <div class="item col-sm-3" style="width: 432px; height: 455px; padding: 0px; margin: 10px -10px 15px 5px">
                        <div class="forms">
                            <table class="mtable" id="table7" style="margin: " runat="server">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label24" runat="server" Text="Label">CheckIn-CheckOut</asp:Label>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="aasdsd" Font-Size="20px" runat="server" Text="Today: "></asp:Label>

                                        <asp:Label ID="Day" Font-Size="20px" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label28" Font-Size="20px" runat="server" Text="CheckIn: "></asp:Label>

                                        <asp:Label ID="CheckIn" Font-Size="20px" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label29" Font-Size="20px" runat="server" Text="Total Hours: "></asp:Label>

                                        <asp:Label ID="Hours" Font-Size="20px" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label27" runat="server" Text="Attendance"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label25" runat="server" Text="Present"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Present" Font-Size="25px" runat="server" Text="Absent"></asp:Label>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td>
                                        <asp:Label ID="Label30"  runat="server" Text="Present"></asp:Label>
                                    </td>
                                    <td>
                                    <asp:Label ID="Absent"  runat="server" Text="Absent"></asp:Label>
                                    </td>
                                </tr>--%>
                            </table>
                        </div>
                    </div>
                    <div class="item col-sm-3" style="width: 432px; height: 455px; padding: 0px; margin: 10px 0px 15px 5px">
                        <div class="forms">


                            <%--Announcements--%>


                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>

                                    <asp:Label ID="Label15" runat="server" Text="Label">Announcement</asp:Label>
                                    <%--<asp:Button ID="Button3" runat="server" Text="+AddNew" Style="width: auto" CssClass="button login__submit" OnClientClick="sidebara()" />--%>
                                    <asp:LinkButton ID="lk23" Font-Size="20px" runat="server" Text="+AddNew" OnClientClick="sidebara()">+AddNew</asp:LinkButton>
                                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="modalBackground" runat="server" CancelControlID="Button6" TargetControlID="lk23" PopupControlID="Panel2">
                                    </ajaxToolkit:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server" CssClass="Popup" ClientIDMode="Static">

                                        <table class="mtable" id="table2" style="margin: 30px" runat="server">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label16" runat="server" Text="Label">Announcement</asp:Label>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:TextBox ID="txtAnn" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Announcement"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Button ID="Button4" CssClass="button login__submit" Style="width: auto; margin-left: 50px;" runat="server" Text="Submit" OnClientClick="rsidea()" OnClick="Button4_Click" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button6" CssClass="button login__submit" Style="width: auto; margin-left: -50px;" runat="server" Text="Cancel" OnClientClick="rsidea()" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:GridView ID="grdan" CssClass="myGridStyle" Visible="false" Style="width: 400px; margin: 30px; margin-left: -55px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="grdan_PageIndexChanging" AllowPaging="true" PageSize="5" OnRowCommand="grdan_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Announcement">
                                                <ItemTemplate>
                                                    <%#Eval("Announcement") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="asdfa" CssClass="fa fa-eye button login__submit" Style="border-radius: 100%; margin-top: -5px; text-decoration: none; margin-left: 35px; width: auto" runat="server" CommandArgument='<%#Eval("ID") %>' ForeColor="#0072B5" CommandName="A"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="asd" CssClass="fa fa-trash button login__submit" Style="border-radius: 100%; margin-top: -5px; text-decoration: none; margin-left: 35px; width: auto" runat="server" CommandArgument='<%#Eval("ID") %>' ForeColor="Red" CommandName="B" OnClientClick="return ConfirmDelete(this);"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EDIT">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="asc" CssClass="fa fa-edit button login__submit" Style="border-radius: 100%; margin-top: -5px; text-decoration: none; margin-left: 35px; width: auto" runat="server" CommandArgument='<%#Eval("ID") %>' ForeColor="#0072B5" CommandName="C" OnClientClick="sidebara()"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                    </asp:GridView>
                                    <asp:LinkButton ID="LinkButton2" Font-Size="20px" runat="server" Style="display: none" Text="+AddNew">+AddNew</asp:LinkButton>


                                    <%--Create a different popup class so as to run properly--%>


                                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender6" BackgroundCssClass="modalBackground" runat="server" CancelControlID="Button7" TargetControlID="LinkButton2" PopupControlID="Panel4">
                                    </ajaxToolkit:ModalPopupExtender>
                                    <asp:Panel ID="Panel4" runat="server" CssClass="PopupD" ClientIDMode="Static">

                                        <table class="mtable" id="table5" style="margin: 30px" runat="server">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label17" runat="server" Text="Label">Announcement</asp:Label>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblAn" runat="server" Text="Announcement: "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="AnName" runat="server" Text="Name"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:Label ID="lblAn1" runat="server" Text="Created On: "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="AnDescription" runat="server" Text="Name"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <asp:Button ID="Button7" CssClass="button login__submit" Style="width: auto; margin-left: 70px;" runat="server" Text="Close" UseSubmitBehavior="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <%--<asp:AsyncPostBackTrigger ControlID="ddlTask" EventName="SelectedIndexChanged" />--%>
                                    <asp:PostBackTrigger ControlID="grdan" />
                                    <asp:AsyncPostBackTrigger ControlID="Button6" />
                                </Triggers>
                            </asp:UpdatePanel>


                            <br />
                            <br />
                            <br />
                            <asp:Label ID="bann" runat="server" Visible="false" Text="No Announcements"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line">
                <div class="item">
                    <div class="forms">

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label6" runat="server" Visible="true" Text="Pending Tasks">Pending Tasks</asp:Label>
                                <asp:LinkButton ID="createTask" runat="server" Font-Size="20px" Visible="true" Style="width: auto; margin-left: 20px" OnClientClick="sidebarTask()">+ AddNew</asp:LinkButton>
                                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" BackgroundCssClass="modalBackground" runat="server" CancelControlID="btnCancelTask" TargetControlID="createTask" PopupControlID="Panel3">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="Panel3" ClientIDMode="Static" CssClass="Popup" runat="server">
                                    <table class="mtable" id="Task" runat="server" style="margin: 50px">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label13" runat="server" Visible="true" Text="Pending Tasks">Create New Tasks</asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:TextBox ID="txtTName" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Task Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtTName" ValidationGroup="b"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>

                                                <asp:TextBox ID="txtTto" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Task To"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtTto" ValidationGroup="b"></asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:TextBox ID="txtTDes" CssClass="login__input" TextMode="MultiLine" Rows="4" Style="padding: 0px; margin: 0px; font-weight: lighter; width: 300px" runat="server" placeholder="Task Description"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtTDes" ValidationGroup="b"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td>
                                                <asp:Button ID="btnsTask" CssClass="button login__submit" Style="width: auto; margin-top: -5px; margin-left: 50px;" runat="server" Text="Submit" OnClick="btnsTask_Click" OnClientClick="rsidetask()" ValidationGroup="b" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnCancelTask" CssClass="button login__submit" Style="width: auto; margin-top: -5px; margin-left: -230px;" runat="server" Text="Cancel" OnClientClick="rsidetask()" UseSubmitBehavior="false" />

                                            </td>

                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:GridView ID="grd2" CssClass="myGridStyle" Visible="false" Style="width: 400px; margin: 30px; margin-left: -45px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="grd2_PageIndexChanging" AllowPaging="true" PageSize="5">
                                    <Columns>
                                        <asp:TemplateField HeaderText="TASK">
                                            <ItemTemplate>
                                                <%#Eval("TaskName") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="From">
                                            <ItemTemplate>
                                                <%#Eval("TaskFrom") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="To">
                                            <ItemTemplate>
                                                <%#Eval("TaskTo") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="grd2" />
                                <asp:PostBackTrigger ControlID="btnsTask" />
                                <asp:AsyncPostBackTrigger ControlID="btnCancelTask" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="blTstatus" runat="server" Visible="false" Text="Label"></asp:Label>
                    </div>

                </div>
                <div class="item" style="width: 429px; height: 502px; padding: 0px; margin: 10px 10px 15px 9px">
                    <div class="forms">
                        <asp:Label ID="Label14" runat="server" Visible="true" Text="Pending Tasks">Leave Application</asp:Label>
                        <table class="mtable" id="table1" visible="false" style="margin-top: -30px" runat="server">
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="cancelLeave" CssClass="fa fa-times" ForeColor="red" runat="server" Font-Size="20px" Visible="false" Style="width: auto; margin-left: 30px; margin-top: -20px" OnClick="cancelLeave_Click">Cancel</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:TextBox ID="txtType" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Leave Type"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtType" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>

                                <td>

                                    <asp:TextBox ID="txtDate" CssClass="login__input" Style="padding: 0px; width: 300px" AutoCompleteType="Disabled" runat="server" placeholder="Date Of Leave"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender CssClass="" ID="CalendarExtender1" PopupButtonID="imgPopup" TargetControlID="txtDate" Format="MM/dd/yyyy" runat="server" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtDate" ValidationGroup="A"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:TextBox ID="txtReason" CssClass="login__input" TextMode="MultiLine" Rows="4" Style="padding: 0px; margin: 0px; font-weight: lighter; width: 300px" runat="server" placeholder="Reason for Leave"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtReason" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <asp:Button ID="btnsave" CssClass="button login__submit" Style="width: auto; margin-left: 50px; margin-top: -10px;" runat="server" Text="Submit" OnClick="btnsave_Click" ValidationGroup="A" />
                                </td>
                                <td>
                                    <asp:Button ID="btndelete" CssClass="button login__submit" Style="width: auto; margin-left: -90px; margin-top: -10px" Visible="false" runat="server" Text="Delete" OnClick="btndelete_Click" OnClientClick="return ConfirmDelete(this);" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="lblleave" runat="server" Visible="true" Text="Pending Tasks">Click on Calendar to Create new Leave or Update any old one</asp:Label>


                    </div>
                </div>


                <%--Leave Records--%>



                <div class="item" style="width: 430px; margin: 10px 0px 15px 10px">
                    <div class="forms">
                        <asp:Label ID="lblaLeave" runat="server">Leave Applications</asp:Label>
                        <table style="font-size: 20px; margin: 10px -50px; border-spacing: 50px 10px;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server">Type </asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label10" runat="server">Taken</asp:Label></td>
                                <td>
                                    <asp:Label ID="Label9" runat="server">Left</asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server">Sick Leaves</asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ll1" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server">Casual Leaves</asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ll2" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server">Paid Leaves</asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ll3" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" ForeColor="Green">Approved Leaves</asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ll4" runat="server" ForeColor="Green"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" ForeColor="REd">Not Approved Leaves</asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="ll5" runat="server" ForeColor="REd"></asp:Label></td>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
            <div class="line">

                <%--Quick Links--%>


                <div class="item" style="width: 429px">
                    <div class="forms">
                        <asp:Label ID="Label11" runat="server" Visible="true" Text="Pending Tasks">Quick Links</asp:Label>
                        <asp:LinkButton ID="createLink" runat="server" Font-Size="20px" Visible="true" Style="width: auto; margin-left: 28px" OnClick="createLink_Click">+ AddNew</asp:LinkButton>
                        <asp:LinkButton ID="cancelLink" CssClass="fa fa-times" ForeColor="red" runat="server" Font-Size="20px" Visible="false" Style="width: auto; margin-left: 30px" OnClick="cancelLink_Click">Cancel</asp:LinkButton>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <table class="mtable" id="Table3" runat="server" visible="false" style="margin-top: 30px">

                                    <tr>

                                        <td>
                                            <asp:TextBox ID="txtLTitle" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Title"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtLTitle" ValidationGroup="c"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="txtLink" CssClass="login__input" TextMode="MultiLine" Rows="4" Style="padding: 0px; margin: 0px; font-weight: lighter; width: 300px" runat="server" placeholder="Link"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required Field" ForeColor="Red" ControlToValidate="txtLink" ValidationGroup="c"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            <asp:Button ID="LinkCreate" CssClass="button login__submit" Style="width: auto; margin-top: -5px; margin-left: 90px;" runat="server" Text="Submit" OnClick="LinkCreate_Click" ValidationGroup="c" /></td>
                                    </tr>
                                </table>
                                <asp:GridView ID="grd5" CssClass="myGridStyle " Visible="false" Style="width: 400px; margin: 30px; margin-left: -45px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="grd5_PageIndexChanging" AllowPaging="true" PageSize="5" OnRowCommand="grd5_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Link">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hy1" Text='<%#Eval("Title")%>' Font-Size="Large" ForeColor="#0072B5" Target="_blank" CssClass="" NavigateUrl='<%#Eval("Link") %>' runat="server">HyperLink</asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EDIT">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn2" CssClass="fa fa-edit button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto" runat="server" ForeColor="#0072B5" CommandArgument='<%#Eval("Id")%>' CommandName="B"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DELETE">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn1" CssClass="fa fa-trash button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto" runat="server" ForeColor="Red" CommandArgument='<%#Eval("Id")%>' CommandName="A" OnClientClick="return ConfirmDelete(this);"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="grd5" />
                                <asp:PostBackTrigger ControlID="LinkCreate" />
                                <asp:PostBackTrigger ControlID="cancelLink" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="MyLinks" runat="server" Visible="false" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="item" style="width: 429px">


                    <%--Pending On Me--%>
                    <div class="forms">
                        <asp:Label ID="Label7" runat="server" Visible="true" Text="Pending On Me">Pending On Me</asp:Label>

                        <asp:LinkButton ID="LinkButton3" CssClass="fa fa-times" ForeColor="red" runat="server" Font-Size="20px" Visible="false" Style="width: auto; margin-left: 30px" OnClick="cancelTask_Click">Cancel</asp:LinkButton>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grd3" CssClass="myGridStyle " Visible="false" Style="width: 400px; margin: 30px; margin-left: -45px" runat="server" AutoGenerateColumns="false" OnRowCommand="grd3_RowCommand" OnPageIndexChanging="grd3_PageIndexChanging" AllowPaging="true" PageSize="5">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <%#Eval("Date").ToString().Substring(0,Eval("Date").ToString().IndexOf(" ")) %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="From">
                                            <ItemTemplate>
                                                <%#Eval("Name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Accept">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn2" CssClass="fa fa-check button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto; text-decoration: none" runat="server" ForeColor="#00C157" CommandArgument='<%#Eval("IntId")%>' CommandName="B"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Reject">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtna2" CssClass="fa fa-times button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto; text-decoration: none" runat="server" ForeColor="Red" CommandArgument='<%#Eval("IntId")%>' CommandName="A"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="grd3" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="MyTask" runat="server" Visible="false" Text="No Pending Tasks"></asp:Label>
                    </div>
                </div>


                <%--Pending Requests--%>


                <div class="item" style="width: 430px; margin: 10px 0px 15px 10px">
                    <div class="forms">
                        <asp:Label ID="ALba" runat="server" Visible="true" Text="Pending On Me">My Pending Requests</asp:Label>

                        <asp:LinkButton ID="LinkButton5" CssClass="fa fa-times" ForeColor="red" runat="server" Font-Size="20px" Visible="false" Style="width: auto; margin-left: 30px" OnClick="cancelTask_Click">Cancel</asp:LinkButton>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="grd4" CssClass="myGridStyle grdTask" Visible="false" Style="width: 400px; margin: 30px; margin-left: -45px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="grd4_PageIndexChanging" AllowPaging="true" PageSize="5">
                                    <Columns>
                                        <asp:TemplateField HeaderText="DATE">
                                            <ItemTemplate>
                                                <%#Eval("Date").ToString().Substring(0,Eval("Date").ToString().IndexOf(" ")) %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="APPLIED TO">
                                            <ItemTemplate>
                                                <%#Eval("Name") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="EDIT">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn2" CssClass="fa fa-edit button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto" runat="server" ForeColor="#0072B5" CommandArgument='<%#Eval("IntId")%>' CommandName="B"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DELTE">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn1" CssClass="fa fa-trash button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto" runat="server" ForeColor="Red" CommandArgument='<%#Eval("IntId")%>' CommandName="A" OnClientClick="return ConfirmDelete(this);"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="grd4" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="MyRequest" runat="server" Visible="false" Text="No Pending Tasks"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="line">


                <%--Holidays--%>


                <div class="item">
                    <div class="forms">
                        <asp:Label ID="h" runat="server" CssClass="" Text="Holidays"></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="Holiday" CssClass="myGridStyle grdTask" Style="margin-left: -45px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="Holiday_PageIndexChanging" AllowPaging="true" PageSize="5">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="Date" runat="server" CssClass="hdate" Text=' <%#Eval("Date").ToString().Substring(0,Eval("Date").ToString().LastIndexOf(" ")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Name" runat="server" CssClass="" Text=' <%#Eval("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>

                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="Holiday" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />

                        <br />
                        <br />
                        <asp:Label ID="hs" runat="server" CssClass="" Visible="false" Text="No Pending Holiday"></asp:Label>
                    </div>

                </div>
                <div class="item" style="width: 429px">
                    <div class="forms">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label12" runat="server" Text="Celebrations"></asp:Label>
                                <%--<asp:LinkButton ID="AddNew" runat="server" Text="AddNew" Style="width: auto" CssClass="button login__submit" OnClientClick="sidebar()" />--%>
                                <asp:LinkButton ID="Lk1" runat="server" Font-Size="20px" Text="AddNew" Style="width: auto; margin-left: 20px" OnClientClick="sidebar()">+AddNew</asp:LinkButton>
                                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="modalBackground" runat="server" CancelControlID="Button5" TargetControlID="Lk1" PopupControlID="Panel1">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="Panel1" runat="server" CssClass="Popup" ClientIDMode="Static">

                                    <table class="mtable" id="table4" style="margin: 30px" runat="server">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label23" runat="server" Text="Celebrations"></asp:Label>
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:TextBox ID="NameCel" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Name"></asp:TextBox>
                                                <br />
                                            </td>

                                        </tr>
                                        <tr>

                                            <td>

                                                <asp:TextBox ID="DateCel" CssClass="login__input" Style="padding: 0px; width: 300px" AutoCompleteType="Disabled" runat="server" placeholder="Date Of Celebration"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender CssClass="" ID="CalendarExtender2" PopupButtonID="imgPopup" TargetControlID="DateCel" Format="MM/dd/yyyy" runat="server" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:TextBox ID="ForCel" CssClass="login__input" Style="padding: 0px; margin: 0px; width: 300px" runat="server" placeholder="Celebration For"></asp:TextBox>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:TextBox ID="LocCel" CssClass="login__input" Style="padding: 0px; width: 300px" runat="server" placeholder="Location for Celebration"></asp:TextBox>
                                                <br />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button2" CssClass="button login__submit" Style="width: auto; margin-left: 50px;" runat="server" Text="Submit" OnClick="Button2_Click" OnClientClick="rside()" />
                                            </td>
                                            <td>
                                                <asp:Button ID="Button5" CssClass="button login__submit" Style="width: auto; margin-left: -150px;" runat="server" Text="Cancel" OnClientClick="rside()" UseSubmitBehavior="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:GridView ID="grdcel" Visible="false" CssClass="myGridStyle " Style="margin-left: -55px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="grdcel_PageIndexChanging" AllowPaging="true" PageSize="5" OnRowCommand="grdcel_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="Date" runat="server" CssClass="" Text='<%#Eval("Date").ToString().Substring(0,Eval("Date").ToString().IndexOf(" ")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Name" runat="server" CssClass="" Text=' <%#Eval("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtna2" CssClass="fa fa-eye button login__submit" Style="border-radius: 100%; margin-top: -5px; margin-left: 35px; width: auto; text-decoration: none" runat="server" ForeColor="#0072B5" CommandArgument='<%#Eval("uid")%>' CommandName="A"></asp:LinkButton>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="asd" CssClass="fa fa-trash button login__submit" Style="border-radius: 100%; margin-top: -5px; text-decoration: none; margin-left: 35px; width: auto" runat="server" CommandArgument='<%#Eval("uid") %>' ForeColor="Red" CommandName="B" OnClientClick="return ConfirmDelete(this);"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EDIT">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="aasd" CssClass="fa fa-edit button login__submit" Style="border-radius: 100%; margin-top: -5px; text-decoration: none; margin-left: 35px; width: auto" runat="server" CommandArgument='<%#Eval("uid") %>' ForeColor="#0072B5" CommandName="C" OnClientClick="sidebara()"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>
                                <asp:LinkButton ID="LinkButton4" Font-Size="20px" runat="server" Style="display: none" Text="+AddNew">+AddNew</asp:LinkButton>


                                <%--Create a different popup class so as to run properly--%>


                                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" BackgroundCssClass="modalBackground" runat="server" CancelControlID="Button3" TargetControlID="LinkButton4" PopupControlID="Panel5">
                                </ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="Panel5" runat="server" CssClass="PopupD" ClientIDMode="Static">

                                    <table class="mtable" id="table6" style="margin: 30px" runat="server">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label18" runat="server" Text="Label">Celebrations</asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:Label ID="Label19" runat="server" Text="Name: "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="CelName" runat="server" Text="Name"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:Label ID="Label21" runat="server" Text="For: "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Celfor" runat="server" Text="Name"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:Label ID="Label20" runat="server" Text="Location: "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="CelLocation" runat="server" Text="Name"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:Label ID="Label22" runat="server" Text="Date: "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="CelDate" runat="server" Text="Name"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <asp:Button ID="Button3" CssClass="button login__submit" Style="width: auto; margin-left: 70px;" runat="server" Text="Close" UseSubmitBehavior="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:AsyncPostBackTrigger ControlID="ddlTask" EventName="SelectedIndexChanged" />--%>
                                <asp:AsyncPostBackTrigger ControlID="Button5" />
                                <asp:PostBackTrigger ControlID="grdcel" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="lblcel" runat="server" CssClass="" Visible="false" Text="No Celebrations Today"></asp:Label>
                    </div>
                </div>
                <div class="item" style="width: 429px !important">


                    <%--People On Leave--%>


                    <div class="forms">
                        <asp:Label ID="OnlE" runat="server" CssClass="" Text="People On Leave Today"></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="OnLeave" CssClass="myGridStyle grdTask" Style="margin-left: -45px" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="OnLeave_PageIndexChanging" AllowPaging="true" PageSize="5">
                                    <Columns>
                                        <asp:TemplateField HeaderText="NAME">
                                            <ItemTemplate>
                                                <asp:Label ID="Date" runat="server" CssClass="" Text=' <%#Eval("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Status ">
                                            <ItemTemplate>
                                                <asp:Label ID="lbla" runat="server" Text='<%#Eval("enumIsApproved").ToString()=="True"?"Approved":"Not Approved" %>' ForeColor='<%#Eval("enumIsApproved").ToString()=="True"?System.Drawing.ColorTranslator.FromHtml("#00C157"):System.Drawing.Color.Red %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager button login__input" />
                                </asp:GridView>

                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="OnLeave" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Pers" runat="server" CssClass="" Visible="false" Text="No One on Leave Today"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
