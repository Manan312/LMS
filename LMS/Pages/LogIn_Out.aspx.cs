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
namespace LMS.Pages
{
    public partial class LogIn_Out : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Login Page";
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtId.Text) || string.IsNullOrEmpty(txtId.Text))
            {
                Response.Redirect("Login.aspx");
            }
            // using the code here...                
            con.Open();
            SqlCommand cmd = new SqlCommand("Login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "check");
            cmd.Parameters.AddWithValue("@id", txtId.Text);
            cmd.Parameters.AddWithValue("@pass", txtpass.Text);
            cmd.Parameters.AddWithValue("@name", "");
            cmd.Parameters.AddWithValue("@LID", "");
            cmd.Parameters.AddWithValue("@DID", "");
            cmd.ExecuteNonQuery();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)


            {
                string User = dt.Rows[0][0].ToString();
                if (User.Equals("ADMIN")) 
                {
                    
                    Response.Redirect("Leave.aspx"); 
                }
            else
                Response.Redirect("Employee.aspx");
                Session["UserName"] = User;
                Session["EmpId"] = txtId.Text;
            }
            else
            {
                Response.Write("<script>alert('Wrong User Id OR Password')</script>");
            }
        }
    }
}