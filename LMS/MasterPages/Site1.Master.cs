using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS.MasterPages
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void UploadPhoto_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                Response.Write("<script>alert("+FileUpload1.FileName+")</script>");
            }

            //Check whether Directory (Folder) exists.
           

            //Save the File to the Directory (Folder).
            

            //Display the Picture in Image control.
            
                UploadPhoto.Attributes.Add("style", "display:none");
        }

        protected void EmpImage_Click(object sender, ImageClickEventArgs e)
        {
            UploadPhoto.Attributes.Add("style", "display:block");
        }
    }
}