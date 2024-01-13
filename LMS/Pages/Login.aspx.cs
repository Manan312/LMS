using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using System.Threading;
using LMS.BusinessLayer;
using System.Text.RegularExpressions;

namespace LMS.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("checkinout", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FLAG", "logout");
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@ID", s);
                cmd.Parameters.AddWithValue("@login", "");
                cmd.Parameters.AddWithValue("@logout", "");
                int c=cmd.ExecuteNonQuery();
                if (c < 0)
                {
                    Response.Write("<script>alert('Wrong User Id OR Password')</script>");
                }
                Session.Abandon();
                Session.Clear();
            }
            Page.Title = "Login Page";
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            DataTable c = new DataTable();
            if (string.IsNullOrEmpty(txtId.Text) || string.IsNullOrEmpty(txtId.Text))
            {
                Response.Redirect("Login.aspx");
            }
            using (ClsLogin obj = new ClsLogin())
            {
                obj.intId = -11;
                if (Regex.IsMatch(txtId.Text, @"^\d+$"))
                    obj.intId = Convert.ToInt32(txtId.Text);
                else
                    Response.Write("<script>alert('Wrong Employee Id')</script>");
                obj.password = txtpass.Text;
                c = obj.check();
                if (c.Rows.Count > 0)
                {
                    string User = c.Rows[0][0].ToString();
                    Session["UserName"] = User;
                    Session["EmpId"] = txtId.Text;
                    LoginT();
                    record();
                    if (User.Equals("ADMIN"))
                        Response.Redirect("MainPage.aspx");
                    else
                        Response.Redirect("MainPage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Wrong User Id OR Password')</script>");
                }
            }
            //con.Open();
            //SqlCommand cmd = new SqlCommand("Login", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@State", "check");
            //cmd.Parameters.AddWithValue("@id", txtId.Text);
            //cmd.Parameters.AddWithValue("@pass", txtpass.Text);
            //cmd.Parameters.AddWithValue("@name", "");
            //cmd.Parameters.AddWithValue("@LID", "");
            //cmd.Parameters.AddWithValue("@DID", "");
            //cmd.ExecuteNonQuery();
            //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //if (dt.Rows.Count != 0)
            //{
            //    string User = dt.Rows[0][0].ToString();
            //    Session["UserName"] = User;
            //    Session["EmpId"] = txtId.Text;
            //    if (User.Equals("ADMIN"))
            //        Response.Redirect("Leave.aspx");
            //    else
            //        Response.Redirect("Employee.aspx");

            //}
            //else
            //{
            //    Response.Write("<script>alert('Wrong User Id OR Password')</script>");
            //}
        }
        public void LoginT()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("checkinout", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "login");
            string s1 = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@ID", s1);
            cmd.Parameters.AddWithValue("@login", "");
            cmd.Parameters.AddWithValue("@logout", "");
            int c = cmd.ExecuteNonQuery();
            con.Close();
            if (c == 0)
                Response.Redirect("Login.aspx");
        }
        public void record()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("record", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "login");
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@ID", 0);
            cmd.Parameters.AddWithValue("@Date", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("@EID", s);
            cmd.Parameters.AddWithValue("@loginTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@logoutTime", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            Session["SID"] = dt.Rows[0]["ID"].ToString();
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }
    }
}