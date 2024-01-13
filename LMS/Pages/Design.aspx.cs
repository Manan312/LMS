using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS.Pages
{
    public partial class Design : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddNew_Click(object sender, EventArgs e)
        {
            Panel1.CssClass += "viewPopup";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Attributes.Add("style", "transform:translate(90%,0%);transition: transform 1.4s, left 1.4s;");
        }

        protected void AddNew_Click1(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
           Response.Write("<script>alert('Done');</script>");
        }
    }
}