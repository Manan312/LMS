using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using LMS.BusinessLayer;
using LMS.DataLayer;

namespace LMS.Pages
{
    public partial class AdminPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");
        int co = 0;
        DataTable adt = new DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Page.Title = "Master Page";
                Home.NavigateUrl = "Pages/AdminPage.aspx";
                LKU.Text = Session["UserName"].ToString();
                notification();
                
            }

        }
        public void bindlist()
        {
            Created();
            modified();
        }
        public void Created() { 
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "bindc");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", 0);
            cmd.Parameters.AddWithValue("@Id", 0);
            cmd.Parameters.AddWithValue("@Date", 0);
            cmd.Parameters.AddWithValue("@Reason", "");
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            adt.Columns.Add("Notifications");
            if (dt.Rows.Count != 0 && adt.Rows.Count == 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string e = dt.Rows[i][0].ToString();
                    string t = dt.Rows[i][1].ToString();
                    string d= dt.Rows[i][2].ToString();
                    d = d.Substring(0, d.IndexOf(" "));
                    string dc = dt.Rows[i][4].ToString();
                    dc = dc.Substring(0, dc.IndexOf(" "));
                    string s= dt.Rows[i][3].ToString();
                    if (s == "2")
                    {
                        e = e+" has created a "+t+" leave for date "+d +" on date " + dc;
                        DataRow dr = adt.NewRow();
                        dr["Notifications"] = e.ToString();
                        adt.Rows.Add(dr);
                    }
                }
            }
            co = dt.Rows.Count;
        }
        public void modified()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "bindm");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", 0);
            cmd.Parameters.AddWithValue("@Id", 0);
            cmd.Parameters.AddWithValue("@Date", 0);
            cmd.Parameters.AddWithValue("@Reason", "");
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0 && adt.Rows.Count == co)
            {
                for (int i = 0; i < dt.Rows.Count;i++)
                {
                    string e = dt.Rows[i][0].ToString();
                    string t = dt.Rows[i][1].ToString();
                    string d = dt.Rows[i][2].ToString();
                    d = d.Substring(0, d.IndexOf(" "));
                    string s = dt.Rows[i][3].ToString();
                    string dc= dt.Rows[i][4].ToString();
                    dc=dc.Substring(0, dc.IndexOf(" "));
                    if (s == "True")
                    {
                        e = e + " has deleted the " + t + " leave for the date " + d+" on date "+dc;
                        DataRow dr = adt.NewRow();
                        dr["Notifications"] = e.ToString();
                        adt.Rows.Add(dr);
                    }
                    if (s == "False")
                    {
                        e = e + " has modified the " + t + " leave for the date " + d +" on date " + dc;
                        DataRow dr = adt.NewRow();
                        dr["Notifications"] = e.ToString();
                        adt.Rows.Add(dr);
                    }
                }
                
            }
        }
        public void notification()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "notiad");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", 0);
            cmd.Parameters.AddWithValue("@Id", Session["EmpId"].ToString());
            cmd.Parameters.AddWithValue("@Date", "");
            cmd.Parameters.AddWithValue("@Reason", "");
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                count.InnerText = dt.Rows[0][0].ToString();
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
            cmd.Parameters.AddWithValue("@logout", DateTime.Now);
            int c = cmd.ExecuteNonQuery();
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
            cmd.Parameters.AddWithValue("@loginTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@logoutTime", "");
            cmd.ExecuteNonQuery();
            con.Close();
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
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
                Response.Write("No Entry");
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
            grd.PageIndex = 0;
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                using (ClsMain obj = new ClsMain())
                {
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
                cmd.Parameters.AddWithValue("@month", "");
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
                cmd.Parameters.AddWithValue("@month", "");
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
                show();
            }
        }

        protected void btnshowEmp_Click(object sender, EventArgs e)
        {
            showEmp();
        }
        public void showEmp()
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
            cmd.Parameters.AddWithValue("@month", "");
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
            grd3.DataSource = null;
            grd3.DataBind();
            attEmp.DataSource = null;
            attEmp.DataBind();
            grdattEmp.DataSource = null;
            grdattEmp.DataBind();
            grd2.PageIndex = 0;
            btnshowEmp.Text = "Leave Applicants";
        }

        protected void btnshow_Click(object sender, EventArgs e)
        {
        }
        public void show2()
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
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
                Response.Write("No Entry");
            con.Close();
            grd3.DataSource = dt;
            grd3.DataBind();
            int x = grd3.Rows.Count / 2;
            grd3.SelectedIndex = grd3.Rows.Count - 1;
            grd3.PageIndex = 0;
        }
        protected void grd3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "B")
            {
                Session["UserName"] = "ADMIN";
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
                cmd.Parameters.AddWithValue("@month", "");
                cmd.ExecuteNonQuery();
                con.Close();
                show2();
                int c = grd3.SelectedRow.RowIndex - 1;
                grd3.Rows[c].Focus();

            }
        }
        protected void btnshow2_Click(object sender, EventArgs e)
        {
            Page.Title = "Employee Record";

            grd.DataSource = null;
            grd.DataBind();
            grd2.DataSource = null;
            grd2.DataBind();
            attEmp.DataSource = null;
            attEmp.DataBind();
            grdattEmp.DataSource = null;
            grdattEmp.DataBind();
            show2();
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            grd.DataSource = null;
            grd.DataBind();
            grd2.DataSource = null;
            grd2.DataBind();
            grd3.DataSource = null;
            grd3.DataBind();
            attEmp.DataSource = null;
            attEmp.DataBind();
            grdattEmp.DataSource = null;
            grdattEmp.DataBind();
        }


        protected void grd2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd2.PageIndex = e.NewPageIndex;
            this.showEmp();
        }

        protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd.PageIndex = e.NewPageIndex;
            this.show();
        }
        protected void grd3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd3.PageIndex = e.NewPageIndex;
            this.show2();
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Session["Action"] = "CREATE";
            Response.Redirect("Create.aspx");
        }

        protected void backtoMain_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Response.Redirect("MainPage.aspx");
        }
        public void showAttendance()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("checkinout", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "viewEmp");
            cmd.Parameters.AddWithValue("@id",0);
            cmd.Parameters.AddWithValue("@login", "");
            cmd.Parameters.AddWithValue("@logout","");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                attEmp.DataSource=dt;
                attEmp.DataBind();
                attEmp.Visible = true;
            }
            grd.DataSource = null;
            grd.DataBind();
            grd2.DataSource = null;
            grd2.DataBind();
            grd3.DataSource = null;
            grd3.DataBind();
        }

        protected void btnattendance_Click(object sender, EventArgs e)
        {
            showAttendance();
            grdattEmp.Visible = false;
        }

        protected void view_Click(object sender, EventArgs e)
        {

        }

        protected void attEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            attEmp.PageIndex = e.NewPageIndex;
            this.showAttendance();
        }
        public void showEmpAttendance(int e)
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@flag", "viewAtt");
                Param[1] = new SqlParameter("@id", e);
                Param[2] = new SqlParameter("@logIn", "");
                Param[3] = new SqlParameter("@logOut", "");
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "checkinout", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                grdattEmp.DataSource = dt;
                grdattEmp.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void attEmp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "C")
            {
                showEmpAttendance(Convert.ToInt32(e.CommandArgument));
                ViewState["EID"] = e.CommandArgument;
                attEmp.Visible = false;
                grdattEmp.Visible = true;
                
            }
            grd.DataSource = null;
            grd.DataBind();
            grd2.DataSource = null;
            grd2.DataBind();
            grd3.DataSource = null;
            grd3.DataBind();
        }


        protected void grdattEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdattEmp.PageIndex = e.NewPageIndex;
            this.showEmpAttendance(Convert.ToInt32(ViewState["EID"]));
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (GridView1.Rows.Count == 0)
        //    {
        //        GridView1.Visible = true;
        //        shownoti();
        //    }
        //}
        //public void shownoti()
        //{
        //    if (GridView1.Rows.Count==0 || GridView1.Rows.Count != adt.Rows.Count)
        //    {
        //        bindlist();
        //        GridView1.DataSource = adt;
        //        GridView1.DataBind();
        //    }
        //}
        //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    this.shownoti();
        //}
    }
}
//int c = ddlstatus.Items.IndexOf(l);
//ddlstatus.Items[c].Attributes.Add("style", "color: black;");
//if (l.Text.ToString().IndexOf("deleted") != -1)
//{
//    ddlstatus.Items[c].Attributes.Add("style", "color: red;");
//}
//if (l.Text.ToString().IndexOf("created") != -1)
//{
//    ddlstatus.Items[c].Attributes.Add("style", "color: green;");
//}
//if (l.Text.ToString().IndexOf("modified") != -1)
//{
//    ddlstatus.Items[c].Attributes.Add("style", "color: blue;");
//}
//ddlstatus.Items[c].Attributes.Add("style", "border: 1px solid black; width: 100%;height:100px");