using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS
{
    public partial class sideMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Session["Action"] = "CREATE";
            hl1.NavigateUrl = "Pages/Main.aspx";
            hl2.NavigateUrl = "Pages/EmpDetails.aspx";
            hl3.NavigateUrl = "";
            hl4.NavigateUrl = "Pages/Create.aspx";
        }
    }
}