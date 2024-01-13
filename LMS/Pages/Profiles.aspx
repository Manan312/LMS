<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site1.Master" AutoEventWireup="true" CodeBehind="Profiles.aspx.cs" Inherits="LMS.Pages.Profiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            width: 429px;
        }
        .auto-style2 {
            width: 222px;
        }
        .auto-style4 {
            width: 419px;
        }
        .auto-style5 {
            border-bottom: 2px solid #D1D1D4;
            background: none;
            padding-left: 24px;
            font-weight: 700;
            font-size: 20px;
            transition: .2s;
            resize: none;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
            padding-right: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .auto-style6 {
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="rightcontent">
        <div class="lines">
            <div class="" style="font-size: 25px; margin: 20px">
                Personal Info
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="display: inline-flex">
                            <div>
                                <table>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="Name: "></asp:Label></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="Pname" runat="server" CssClass="login__input" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="auto-style2"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="Phone: "></asp:Label></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="Phone" runat="server" CssClass="login__input"></asp:TextBox>
                                        </td>
                                        <td class="auto-style2"></td>
                                    </tr>
                                </table>
                            </div>
                            <div style="margin: 100px 40px 10px 90px">
                                <asp:Button ID="btnper" runat="server" CssClass="login__submit" Text="EDIT" OnClick="btnper_Click" />
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnper" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="lines">
            <div class="" style="font-size: 25px; margin: 20px">
                Bank Info
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div style="display: inline-flex">
                            <div style="">
                                <table style="">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="Bank Name: "></asp:Label></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="Bname" runat="server" CssClass="login__input" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="auto-style6"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="Account Number: "></asp:Label></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="accno" runat="server" CssClass="login__input" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="auto-style6">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^[0-9]*$" ControlToValidate="accno" ValidationGroup="A" ErrorMessage="Enter Numbers only" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="IFSC: "></asp:Label></td>
                                        <td class="auto-style3">
                                            <asp:TextBox ID="ifc" runat="server" CssClass="login__input" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="auto-style6"></td>
                                    </tr>
                                </table>
                            </div>
                            <div style="margin: 100px 40px 10px 90px">
                                <asp:Button ID="Button1" runat="server" ValidationGroup="A" CssClass="login__submit" Text="EDIT" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button1" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="lines">
            <div class="" style="font-size: 25px; margin: 20px">
                Work Info
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div style="display: inline-flex">
                            <div>
                                <table>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="Department Name: "></asp:Label></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="DName" runat="server" CssClass="login__input" Enabled="false"></asp:TextBox>
                                        </td >
                                        <td class="auto-style2"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label runat="server" Text="Position: "></asp:Label></td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="PosName" runat="server" CssClass="login__input" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td class="auto-style2"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </ContentTemplate>

                </asp:UpdatePanel>
                <br />
                <br />
            </div>
        </div>
        
    </div>
</asp:Content>
