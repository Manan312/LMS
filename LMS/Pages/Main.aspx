<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="LMS.Pages.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="../css/login.css" rel="stylesheet" />
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'/>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" >
        <div>
            <table>
            <tr>
            <td><asp:Button ID="btnshowEmp" CssClass="button login__submit" runat="server" Text="Leave Applicants" OnClick="btnshowEmp_Click"/></td>
            <td><asp:Button ID="btnrefresh" CssClass="button login__submit" runat="server" Text="Back"  OnClick="btnrefresh_Click" /></td>
                
            </tr>        
            </table>
            <br/>
            <br/>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <asp:GridView ID="grd2"   CssClass="myGridStyle" style="margin:30px" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand2">
                <Columns>
                    <asp:TemplateField HeaderText="EMPLOYEE NAME" >
                        <ItemTemplate >
                            <%#Eval("Name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TOTAL LEAVES" >
                        <ItemTemplate >
                            <%#Eval("Leaves") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="VIEW">
                        <ItemTemplate>
                            <asp:Button ID="btnshow" CssClass="button login__submit" runat="server" style="border-radius:0px" CommandArgument='<%#Eval("IntId") %>' CommandName="C" Text="View" OnClick="btnshow_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="APPROVE">
                        <ItemTemplate>
                            <asp:Button ID="lbtn2" CssClass="button login__submit" style="border-radius:0px" runat="server" Text="APPROVE ALL" ForeColor="Green" CommandArgument='<%#Eval("IntId") %>' CommandName="B"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="REJECT" > 
                        <ItemTemplate >
                            <asp:Button ID="lbtn1" CssClass="button login__submit" style="border-radius:0px"   runat="server" Text="REJECT ALL" ForeColor="Red" CommandArgument='<%#Eval("intId")%>' CommandName="A"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <asp:GridView ID="grd"   CssClass="myGridStyle" style="margin-left:30px" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="EMPLOYEE NAME" >
                        <ItemTemplate >
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
                    
                    
                     <asp:TemplateField HeaderText="Created On">
                        <ItemTemplate>
                            <%#Eval("CreatedOn") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Approval ">
                        <ItemTemplate>
                         <asp:Label ID="lbla" runat="server" Text='<%#Eval("enumIsApproved").ToString()=="True"?"Approved":"Not Approved" %>' ForeColor='<%#Eval("enumIsApproved").ToString()=="True"?System.Drawing.Color.Green:System.Drawing.Color.Red %>'></asp:Label>                        
      
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Leave Status  ">
                        <ItemTemplate>
                         <asp:Label ID="lblb" runat="server" Text='<%#Eval("IsActive").ToString()=="True"?"Active":"Unactive" %>' ForeColor='<%#Eval("IsActive").ToString()=="True"?System.Drawing.Color.Green:System.Drawing.Color.Red %>'></asp:Label>                        
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="APPROVE">
                        <ItemTemplate>
                            <asp:Button ID="lbtn2" CssClass="button login__submit" style="border-radius:0px" runat="server" Text="APPROVE" ForeColor="Green" CommandArgument='<%#Eval("IntId") %>' CommandName="B"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="REJECT" > 
                        <ItemTemplate >
                            <asp:Button ID="lbtn1" CssClass="button login__submit" style="border-radius:0px"   runat="server" Text="REJECT" ForeColor="Red" CommandArgument='<%#Eval("intId")%>' CommandName="A"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                    </ContentTemplate>
            </asp:UpdatePanel>
            </div>
    </form>
</asp:Content>
