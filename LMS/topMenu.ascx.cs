using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS
{
    public partial class topMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string u = Session["UserName"].ToString();
            if (u == "ADMIN")
            {
                Home.NavigateUrl = "~/Pages/AdminPage.aspx";

            }
            else {
                Home.NavigateUrl = "~/Pages/MainPage.aspx";
            }
            Logot.Text = u;
            Logot.NavigateUrl= "~/Pages/Login.aspx";
        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        
    }
}