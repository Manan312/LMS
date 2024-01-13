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
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (Session["UserName"]==null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    Page.Title = Session["UserName"].ToString();
            //    lblName.Text = "Welcome " + Session["UserName"].ToString();
            //}
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "insert");
                if (!string.IsNullOrEmpty(txtType.Text) && !string.IsNullOrEmpty(txtDate.Text) && !string.IsNullOrEmpty(txtReason.Text))
                {
                    cmd.Parameters.AddWithValue("@UID", 0);
                    cmd.Parameters.AddWithValue("@Type", txtType.Text);
                    cmd.Parameters.AddWithValue("@Id", Session["EmpId"].ToString());
                    cmd.Parameters.AddWithValue("@Date", txtDate.Text.ToString());
                    cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    show();
                }
                else
                {
                    //lblUser.ForeColor = System.Drawing.Color.Red;
                    //lblUser.Text = "Enter all Entries Properly!!!";
                }
            }
            else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "update");
                cmd.Parameters.AddWithValue("@UID", ViewState["kk"]);
                cmd.Parameters.AddWithValue("@Type", txtType.Text);
                cmd.Parameters.AddWithValue("@Id", Session["EmpId"].ToString());
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                show();
            }
            txtDate.Text="";
            txtType.Text = "";
            txtReason.Text = "";
            btnsave.Text = "Submit";
        }
        public void show()
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "selectallE");
            cmd.Parameters.AddWithValue("@UID", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@Type", txtType.Text);
            cmd.Parameters.AddWithValue("@Id", s);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            { 
                grd.DataSource = dt;
            grd.DataBind(); 
            }
            else
                Response.Write("<script>alert('Something Went Wrong')</script>");
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "delete");
                cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Type", 0);
                cmd.Parameters.AddWithValue("@Id", 0);
                cmd.Parameters.AddWithValue("@Date", 0);
                cmd.Parameters.AddWithValue("@Reason", "");
                cmd.ExecuteNonQuery();
                con.Close();
                show();
            }
            else if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "select");
                cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Type", 0);
                cmd.Parameters.AddWithValue("@Id", 0);
                cmd.Parameters.AddWithValue("@Date", 0);
                cmd.Parameters.AddWithValue("@Reason", "");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                txtType.Text = dt.Rows[0][1].ToString();
                string s = dt.Rows[0][3].ToString();
                txtDate.Text = s.Substring(0, s.IndexOf(" "));
                txtReason.Text = dt.Rows[0][4].ToString();
                btnsave.Text = "Update";
                ViewState["kk"] = e.CommandArgument;
                
            }
        }

        protected void btnshow_Click(object sender, EventArgs e)
        {
            show();
            btnshow.Visible = false;
            btnClear.Visible = true;
            
        }

        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            btnshow.Visible = true;
            btnClear.Visible = false;
            grd.DataSource = null;
            grd.DataBind();
        }
    }
}