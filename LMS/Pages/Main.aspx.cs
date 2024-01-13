using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using LMS.BusinessLayer;

namespace LMS.Pages
{
    public partial class Main : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = Request.QueryString["UserName"];
            if (Session["UserName"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Page.Title = "Master Page";

            }
        }

        public void show()
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("Leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "selectLeave");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", "");
            cmd.Parameters.AddWithValue("@Id", ViewState["kk"]);
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
            
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                using (ClsMain obj = new ClsMain()) {
                    DataTable c = new DataTable();
                    obj.state = "reject";
                    obj.uid = Convert.ToInt32(e.CommandArgument);
                    obj.type = Convert.ToInt32(0);
                    obj.Id = 0;
                    obj.date = "";
                    obj.reason = "";
                    DataTable a = obj.execute();
                    if (a.Rows.Count > 0)
                    {
                        obj.state = "selectLeave";
                        obj.Id = Convert.ToInt32(a.Rows[0]["EmpId"]);
                        c = obj.show();
                        grd.DataSource = c;
                        grd.DataBind();
                    }
                }
                //con.Open();
                //SqlCommand cmd = new SqlCommand("Leave", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@State", "reject");
                //cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                //cmd.Parameters.AddWithValue("@Type", 0);
                //cmd.Parameters.AddWithValue("@Id", 0);
                //cmd.Parameters.AddWithValue("@Date", 0);
                //cmd.Parameters.AddWithValue("@Reason", "");
                //cmd.ExecuteNonQuery();
                //con.Close();
                //show();
            }
            else if (e.CommandName == "B")
            {
                using (ClsMain obj = new ClsMain())
                {
                    DataTable c = new DataTable();
                    obj.state = "approve";
                    obj.uid = Convert.ToInt32(e.CommandArgument);
                    obj.type = Convert.ToInt32(0);
                    obj.Id = 0;
                    obj.date = "";
                    obj.reason = "";
                    DataTable a=obj.execute();
                    if (a.Rows.Count > 0)
                    {
                        obj.state = "selectLeave";
                        obj.Id = Convert.ToInt32(a.Rows[0]["EmpId"]);
                        c =obj.show();
                        grd.DataSource = c;
                        grd.DataBind();
                    }
                }
                //con.Open();
                //SqlCommand cmd = new SqlCommand("Leave", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@State", "approve");
                //cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                //cmd.Parameters.AddWithValue("@Type", 0);
                //cmd.Parameters.AddWithValue("@Id", 0);
                //cmd.Parameters.AddWithValue("@Date", 0);
                //cmd.Parameters.AddWithValue("@Reason", "");
                //cmd.ExecuteNonQuery();
                //con.Close();
                //show();
            }
        }
        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Response.Redirect("Leave.aspx");
        }

        



        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void grd_RowCommand2(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "rejectall");
                cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Type", 0);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Date", 0);
                cmd.Parameters.AddWithValue("@Reason", "");
                cmd.ExecuteNonQuery();
                con.Close();
                ViewState["kk"] = e.CommandArgument;
                show();
            }
            else if (e.CommandName == "B")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("Leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "approveall");
                cmd.Parameters.AddWithValue("@UID", 0);
                cmd.Parameters.AddWithValue("@Type", 0);
                cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Date", 0);
                cmd.Parameters.AddWithValue("@Reason", "");
                cmd.ExecuteNonQuery();
                con.Close();
                ViewState["kk"] = e.CommandArgument;
                show();
            }
            if (e.CommandName == "C")
            {
                ViewState["kk"] = e.CommandArgument;
                grd2.Visible = false;
                grd.Visible = true;
                btnshowEmp.Text = "Back";
                show();
            }
        }

        protected void btnshowEmp_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "employee");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", 0);
            cmd.Parameters.AddWithValue("@Id", 0);
            cmd.Parameters.AddWithValue("@Date", 0);
            cmd.Parameters.AddWithValue("@Reason", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
                Response.Write("No Entry");
            con.Close();
            grd2.DataSource = dt;
            grd2.DataBind();
            grd2.Visible = true;
            grd.Visible = false;
            btnshowEmp.Text = "Leave Applicants";
        }

        protected void btnshow_Click(object sender, EventArgs e)
        {
        }
    }
}