using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace LMS.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Page.Title = Session["UserName"].ToString();
                Home.NavigateUrl = "../Pages/MainPage.aspx";
                string s = Session["UserName"].ToString();
                if (s.IndexOf(" ") != -1)
                    lkbt1n.Text = s.Substring(0, s.IndexOf(" "));
                else
                    lkbt1n.Text = s;
            }
        }

        protected void LKU_Click(object sender, EventArgs e)
        {
            record();
            con.Open();

            SqlCommand cmd = new SqlCommand("checkinout", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "logout");
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@ID", s);
            cmd.Parameters.AddWithValue("@login", "");
            cmd.Parameters.AddWithValue("@logout", "");
            int c = cmd.ExecuteNonQuery();
            con.Close();
            if (c != 0)
                Response.Redirect("Login.aspx");
            else
                Response.Write("<script>alert('No Entry')</script>");
        }
        public void record()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("record", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "logout");
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@ID", Session["SID"]);
            cmd.Parameters.AddWithValue("@Date", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("@EID", s);
            cmd.Parameters.AddWithValue("@loginTime", "");
            cmd.Parameters.AddWithValue("@logoutTime", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}