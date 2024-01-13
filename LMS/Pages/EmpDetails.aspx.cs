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
    public partial class EmpDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Employee Details";

            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            
          
        }
        
        public void show()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "showall");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", "");
            cmd.Parameters.AddWithValue("@Id", "");
            cmd.Parameters.AddWithValue("@Date", "");
            cmd.Parameters.AddWithValue("@Reason", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
                Response.Write("No Entry");
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
            int x = grd.Rows.Count / 2;
            grd.SelectedIndex = grd.Rows.Count - 1;


        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "B")
            {
                Session["UserName"]="ADMIN";
                Session["EmpId"] = e.CommandArgument;
                Session["Action"] = "EDIT";
                Response.Redirect("Create.aspx");
            }
            if (e.CommandName == "C")
            {
                Session["UserName"] = "ADMIN";
                Session["EmpId"] = e.CommandArgument;
                Session["Action"] = "VIEW";
                Response.Redirect("Create.aspx");
            }
            else if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "deleteEmp");
                cmd.Parameters.AddWithValue("@UID", 0);
                cmd.Parameters.AddWithValue("@Type", 0);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Date", 0);
                cmd.Parameters.AddWithValue("@Reason", "");
                
                
                cmd.ExecuteNonQuery();
                con.Close();
                show();
                int c = grd.SelectedRow.RowIndex-1;
                grd.Rows[c].Focus();

            }
        }
        protected void btnshow_Click(object sender, EventArgs e)
        {
            Page.Title = "Employee Record";
            btnshow.Visible = false;
            btnClear.Visible = true;
            
                show();
        }
        

        protected void btnback_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Response.Redirect("Leave.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            
            grd.DataSource = null;
            grd.DataBind();
            btnshow.Visible = true;
            btnClear.Visible = false;
        }

        
    }
}