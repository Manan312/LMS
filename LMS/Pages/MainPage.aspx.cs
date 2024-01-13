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
    public partial class MainPage : System.Web.UI.Page
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
                showLeaves();
                string s = Session["UserName"].ToString();
                if (s.IndexOf(" ") != -1)
                    lkbt1n.Text = s.Substring(0, s.IndexOf(" "));
                else
                    lkbt1n.Text = s;
                if (s == "ADMIN")
                {
                    EmpD.Visible = true;
                    grdan.Columns[2].Visible = true;
                    grdan.Columns[3].Visible = true;
                    grdcel.Columns[3].Visible = true;
                    grdcel.Columns[4].Visible = true;
                }
                else
                {
                    grdan.Columns[2].Visible = false;
                    grdan.Columns[3].Visible = false;
                    grdcel.Columns[4].Visible = false;
                    grdcel.Columns[3].Visible = false;
                    lk23.Attributes.Add("style", "display:none");
                    Lk1.Attributes.Add("style", "display:none");

                }
                Page.SetFocus("Calendar");
                notification();
                bindAllTasks();
            }
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

                    cmd.Parameters.AddWithValue("@month", "");
                    cmd.ExecuteNonQuery();
                    con.Close();

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
                cmd.Parameters.AddWithValue("@month", "");
                cmd.ExecuteNonQuery();
                con.Close();

            }
            txtDate.Text = "";
            CalendarExtender1.SelectedDate = null;
            txtType.Text = "";
            txtReason.Text = "";
            btnsave.Text = "Submit";
            btndelete.Visible = false;
            cancelLeave.Visible = false;
            table1.Visible = false;
            lblleave.Visible = true;
            showLeaves();
            Calendar.SelectedDate = DateTime.MinValue;
            OnLeaves();
            Response.Redirect("MainPage.aspx");
        }
        public void notification()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "noti");
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
        //public void show()
        //{

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("leave", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@State", "selectallE");
        //    cmd.Parameters.AddWithValue("@UID", 0);
        //    string s = Session["EmpId"].ToString();
        //    cmd.Parameters.AddWithValue("@Type", txtType.Text);
        //    cmd.Parameters.AddWithValue("@Id", s);
        //    cmd.Parameters.AddWithValue("@Date", txtDate.Text);
        //    cmd.Parameters.AddWithValue("@Reason", txtReason.Text);

        //    cmd.Parameters.AddWithValue("@month", "");
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);
        //    con.Close();
        //    if (dt.Rows.Count != 0)
        //    {
        //        grd.DataSource = dt;
        //        grd.DataBind();
        //        Page.SetFocus("grd");

        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('No Entry')</script>");
        //        grd.DataSource = null;
        //        grd.DataBind();
        //    }

        //}
        //protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "A")
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("leave", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@State", "delete");
        //        cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
        //        cmd.Parameters.AddWithValue("@Type", 0);
        //        cmd.Parameters.AddWithValue("@Id", 0);
        //        cmd.Parameters.AddWithValue("@Date", 0);
        //        cmd.Parameters.AddWithValue("@Reason", "");

        //        cmd.Parameters.AddWithValue("@month", "");
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //        show();
        //    }
        //    else if (e.CommandName == "B")
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("leave", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@State", "select");
        //        cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
        //        cmd.Parameters.AddWithValue("@Type", 0);
        //        cmd.Parameters.AddWithValue("@Id", 0);
        //        cmd.Parameters.AddWithValue("@Date", 0);
        //        cmd.Parameters.AddWithValue("@Reason", "");

        //        cmd.Parameters.AddWithValue("@month", "");
        //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        con.Close();
        //        txtType.Text = dt.Rows[0][1].ToString();
        //        string s = dt.Rows[0][3].ToString();
        //        txtDate.Text = s.Substring(0, s.IndexOf(" "));
        //        CalendarExtender1.SelectedDate = Convert.ToDateTime(s);
        //        txtReason.Text = dt.Rows[0][4].ToString();
        //        btnsave.Text = "Update";
        //        ViewState["kk"] = e.CommandArgument;
        //    }
        //}
        public void bindlist()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "bindu");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", 0);
            cmd.Parameters.AddWithValue("@Id", Session["EmpId"].ToString());
            cmd.Parameters.AddWithValue("@Date", 0);
            cmd.Parameters.AddWithValue("@Reason", "");

            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0 && ddlstatus.Items.Count == 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string d = dt.Rows[i][0].ToString().Substring(0, dt.Rows[i][0].ToString().IndexOf(" "));
                    string s = dt.Rows[i][1].ToString();
                    if (s == "True")
                    {
                        d = d + " has been Approved";
                        ddlstatus.BackColor = System.Drawing.ColorTranslator.FromHtml("#00C157");
                    }
                    else
                    {
                        d = d + " has not been Approved";
                        ddlstatus.BackColor = System.Drawing.Color.Red;
                    }
                    ddlstatus.Items.Insert(i, d);
                }
                ddlstatus.Items.Insert(0, "Your Notifications");

            }
        }
        public void showLeaves()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "selectLeaves");
            cmd.Parameters.AddWithValue("@UID", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@Type", txtType.Text);
            cmd.Parameters.AddWithValue("@Id", s);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);

            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                ll1.Text = dt.Rows[0]["Sick"].ToString();
                ll2.Text = dt.Rows[0]["Casual"].ToString();
                ll3.Text = dt.Rows[0]["Paid"].ToString();
                ll4.Text = dt.Rows[0]["Approved"].ToString();
                int c = Convert.ToInt32(dt.Rows[0]["Rejected"]);
                int d = Convert.ToInt32(dt.Rows[0]["deleted"]);
                ll5.Text = (c - d).ToString();

            }
            else
                Response.Write("<script>alert('Something Went Wrong')</script>");
        }
        //protected void btnshow_Click(object sender, EventArgs e)
        //{
        //    show();
        //    btnshow.Visible = false;
        //    btnClear.Visible = true;
        //    Page.SetFocus("btnshow");
        //}


        //protected void btnClear_Click(object sender, EventArgs e)
        //{
        //    btnshow.Visible = true;
        //    btnClear.Visible = false;
        //    grd.DataSource = null;
        //    grd.DataBind();
        //}


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
            cmd.Parameters.AddWithValue("@ID",Session["SID"]);
            cmd.Parameters.AddWithValue("@Date", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("@EID", s);
            cmd.Parameters.AddWithValue("@loginTime", "");
            cmd.Parameters.AddWithValue("@logoutTime", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //protected void grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    grd.PageIndex = e.NewPageIndex;
        //    this.show();
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            ddlstatus.Visible = true;
            LinkButton1.Visible = true;
            Button1.Visible = false;
            bindlist();
            foreach (ListItem l in ddlstatus.Items)
            {
                int c = ddlstatus.Items.IndexOf(l);
                ddlstatus.Items[c].Attributes.Add("style", "color: black;");
                if (l.Text.ToString().IndexOf("not") != -1)
                {
                    ddlstatus.Items[c].Attributes.Add("style", "color: red;");
                }
                if (l.Text.ToString().IndexOf("not") == -1)
                {
                    ddlstatus.Items[c].Attributes.Add("style", "color: green;");
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            ddlstatus.Visible = false;
            LinkButton1.Visible = false;
            Button1.Visible = true;
        }

        public void bindAllTasks()
        {
            check();
            showTask();
            MyPending();
            MyRequests();
            Links();
            holidays();
            OnLeaves();
            announcement();
            celebrations();
        }
        public void check()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("checkinout", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "extract");
            string s1 = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@ID", s1);
            cmd.Parameters.AddWithValue("@login", "");
            cmd.Parameters.AddWithValue("@logout", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                string o = dt.Rows[0]["CheckIn"].ToString();
                CheckIn.Text = o.Substring(o.IndexOf(" "));
                o = DateTime.Now.ToString();
                Day.Text = o.Substring(0, o.IndexOf(" "));
                Hours.Text = dt.Rows[0]["CheckOut"].ToString();
                ViewState["Hours"] = Hours.Text;
                Present.Text = dt.Rows[0]["Present"].ToString();
            }
        }
        public void celebrations()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("celebration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "extract");
            cmd.Parameters.AddWithValue("@id", 0);
            cmd.Parameters.AddWithValue("@name", "");
            cmd.Parameters.AddWithValue("@for", "");
            cmd.Parameters.AddWithValue("@location", "");
            cmd.Parameters.AddWithValue("@date", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                lblcel.Visible = false;
                grdcel.DataSource = dt;
                grdcel.DataBind();
                grdcel.Visible = true;
            }
            else
            {
                grdcel.Visible = false;
                lblcel.Visible = true;
            }
        }
        public void OnLeaves()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "onleave");
            cmd.Parameters.AddWithValue("@UID", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@Type", txtType.Text);
            cmd.Parameters.AddWithValue("@Id", s);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                OnLeave.DataSource = dt;
                OnLeave.DataBind();
            }
            else
            {
                OnLeave.Visible = false;
                Pers.Visible = true;
            }
        }
        public void holidays()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("holiday", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "all");
            cmd.Parameters.AddWithValue("@month", DateTime.Now.Month);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Holiday.DataSource = dt;
                Holiday.DataBind();
            }
            else
            {
                Holiday.Visible = false;
                hs.Visible = true;
            }
        }
        public void showTask()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("tasks", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "showp");
            cmd.Parameters.AddWithValue("@id", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@tn", txtType.Text);
            cmd.Parameters.AddWithValue("@f", s);
            cmd.Parameters.AddWithValue("@tt", "");
            cmd.Parameters.AddWithValue("@td", txtDate.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                createTask.Visible = true;
                grd2.Visible = true;
                grd2.DataSource = dt;
                grd2.DataBind();
                blTstatus.Visible = false;

            }
            else
            {

                blTstatus.Visible = true;
                blTstatus.Text = "No Pending Tasks";

            }
        }
        protected void grd2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd2.PageIndex = e.NewPageIndex;
            this.showTask();
            Page.SetFocus("grd2");
        }

        protected void btnsTask_Click(object sender, EventArgs e)
        {
            if (btnsTask.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("tasks", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "create");
                cmd.Parameters.AddWithValue("@id", 0);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@tn", txtTName.Text);
                cmd.Parameters.AddWithValue("@f", s);
                cmd.Parameters.AddWithValue("@tt", txtTto.Text);
                cmd.Parameters.AddWithValue("@td", txtTDes.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                showTask();
                Task.Visible = false;
                createTask.Visible = true;
                createTask.Attributes.Add("style", "display:block");
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("tasks", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "update");
                cmd.Parameters.AddWithValue("@id", ViewState["kk"]);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@tn", txtTName.Text);
                cmd.Parameters.AddWithValue("@f", s);
                cmd.Parameters.AddWithValue("@tt", txtTto.Text);
                cmd.Parameters.AddWithValue("@td", txtTDes.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                showTask();
                Task.Visible = false;
                createTask.Visible = true;
                createTask.Attributes.Add("style", "display:block");
                btnsTask.Text = "Submit";
            }
            if (grd2.Visible == true)
            {
                Page.SetFocus("grd2");
            }
            else
                Page.SetFocus("blTstatus");
        }

        protected void createTask_Click(object sender, EventArgs e)
        {
            Page.SetFocus("txtTDes");

            Task.Visible = true;
            grd2.Visible = false;
        }

        protected void cancelTask_Click(object sender, EventArgs e)
        {
            Task.Visible = false;
            Page.SetFocus("Label6");
            createTask.Visible = true;
            showTask();
        }
        public void MyPending()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "OnMe");
            cmd.Parameters.AddWithValue("@UID", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@Type", txtType.Text);
            cmd.Parameters.AddWithValue("@Id", s);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                grd3.Visible = true;
                grd3.DataSource = dt;
                grd3.DataBind();
                MyTask.Visible = false;

            }
            else
            {

                MyTask.Visible = true;
                MyTask.Text = "No Pending Tasks";
                grd3.Visible = false;
            }

        }
        public void MyRequests()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "MyPen");
            cmd.Parameters.AddWithValue("@UID", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@Type", txtType.Text);
            cmd.Parameters.AddWithValue("@Id", s);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                grd4.Visible = true;
                grd4.DataSource = dt;
                grd4.DataBind();
                MyRequest.Visible = false;

            }
            else
            {

                MyRequest.Visible = true;
                MyRequest.Text = "No Pending Tasks";
                grd4.Visible = false;
            }
        }
        protected void grd3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd3.PageIndex = e.NewPageIndex;
            this.MyPending();
            Page.SetFocus("grd3");
        }

        protected void grd4_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd4.PageIndex = e.NewPageIndex;
            this.MyRequests();
            Page.SetFocus("grd4");
        }
        public void Links()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("links", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "extract");
            cmd.Parameters.AddWithValue("@id", 0);
            string s = Session["EmpId"].ToString();
            cmd.Parameters.AddWithValue("@title", txtLTitle.Text);
            cmd.Parameters.AddWithValue("@link", txtLink.Text);
            cmd.Parameters.AddWithValue("@eid", s);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                grd5.Visible = true;
                grd5.DataSource = dt;
                grd5.DataBind();
                MyLinks.Visible = false;


            }
            else
            {

                MyLinks.Visible = true;
                MyLinks.Text = "No Links";
                grd5.Visible = false;
            }
            cancelLink.Visible = false;
            createLink.Visible = true;
        }
        protected void grd5_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd5.PageIndex = e.NewPageIndex;
            this.Links();
            Page.SetFocus("grd5");
        }

        protected void createLink_Click(object sender, EventArgs e)
        {
            cancelLink.Visible = true;
            MyLinks.Visible = false;
            Page.SetFocus("txtLink");
            createLink.Visible = false;
            Table3.Visible = true;
            grd5.Visible = false;
        }

        protected void cancelLink_Click(object sender, EventArgs e)
        {
            cancelLink.Visible = false;
            Table3.Visible = false;
            createLink.Visible = true;
            if (grd5.Rows.Count > 0)
                Page.SetFocus("grd5");
            else
                Page.SetFocus("MyLinks");

            Links();
        }

        protected void LinkCreate_Click(object sender, EventArgs e)
        {
            if (LinkCreate.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("links", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "create");
                cmd.Parameters.AddWithValue("@id", 0);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@title", txtLTitle.Text);
                cmd.Parameters.AddWithValue("@link", txtLink.Text);
                cmd.Parameters.AddWithValue("@eid", s);
                cmd.ExecuteNonQuery();
                con.Close();
                Links();
                Table3.Visible = false;
                createLink.Visible = true;
                createLink.Attributes.Add("style", "display:block");
                cancelLink.Visible = false;
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("links", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "edit");
                cmd.Parameters.AddWithValue("@id", ViewState["Link"]);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@title", txtLTitle.Text);
                cmd.Parameters.AddWithValue("@link", txtLink.Text);
                cmd.Parameters.AddWithValue("@eid", s);
                cmd.ExecuteNonQuery();
                con.Close();
                Links();
                Table3.Visible = false;
                createLink.Visible = true;
                createLink.Attributes.Add("style", "display:block");
                cancelLink.Visible = false;
            }
            txtLTitle.Text = "";
            txtLink.Text = "";
        }



        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Cell.Text = "";
            }
            if (!e.Day.IsOtherMonth)
            {
                con.Open();
                Literal l = new Literal(); //Creating a literal  
                l.Visible = true;
                l.Text = "<br/>"; //for breaking the line in cell  
                e.Cell.Controls.Add(l); //adding in all cell  
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "selectallE");
                cmd.Parameters.AddWithValue("@UID", 0);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@Type", txtType.Text);
                cmd.Parameters.AddWithValue("@Id", s);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                string m = e.Day.Date.Month.ToString();
                cmd.Parameters.AddWithValue("@month", m);
                ViewState["month"] = m;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                string ed = e.Day.Date.ToString();
                e.Cell.Attributes.Add("style", "font-weight:bold;border:1px solid black;font-size:20px");
                if (e.Day.IsWeekend)
                {
                    e.Cell.Controls.Add(new Label { Text = "Week Off" });
                    e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#d3d3d3");
                    e.Cell.Attributes.Add("style", "font-weight:bold;border:1px solid black");
                    e.Cell.ForeColor = System.Drawing.Color.Gray;

                }
                foreach (DataRow dr in dt.Rows)
                {
                    ed = e.Day.Date.ToString();

                    ed = ed.Substring(0, ed.IndexOf(" "));
                    string x = dr["Date"].ToString();

                    if (Convert.ToDateTime(ed) == Convert.ToDateTime(x))
                    {
                        e.Cell.Controls.Add(new Label { Text = dr["LeaveType"].ToString() });
                        e.Cell.Attributes.Add("style", "font-weight:bold");

                        if (dr["enumIsApproved"].ToString() == "True")
                        {
                            e.Cell.Attributes.Add("style", "font-weight:bold;border:1px solid black");
                            e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#00C157");
                        }
                        else
                        {
                            e.Cell.Attributes.Add("style", "font-weight:bold;border:1px solid black");
                            e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#d3d3d3");
                        }
                    }
                }
            }
        }

        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            Page.SetFocus("Calendar");
            if (Calendar.SelectedDate.DayOfWeek.ToString() != "Sunday" && Calendar.SelectedDate.DayOfWeek.ToString() != "Saturday")
            {
                if (!string.IsNullOrEmpty(Calendar.SelectedDate.ToString()))
                {

                    int c = UpdateLeave();
                    if (c == 1)
                    {
                        btnsave.Text = "Update";
                        btndelete.Visible = true;
                        Page.SetFocus("txtType");
                    }
                    else
                    {
                        txtDate.Text = Calendar.SelectedDate.ToString();
                        txtDate.Text = txtDate.Text.Substring(0, txtDate.Text.IndexOf(" "));
                        Page.SetFocus("txtType");
                    }

                }
                else
                {
                    btnsave.Text = "Submit";
                    btndelete.Visible = false;
                }
                txtDate.Text = Calendar.SelectedDate.ToString();
                txtDate.Text = txtDate.Text.Substring(0, txtDate.Text.IndexOf(" "));
                Page.SetFocus("txtType");
                cancelLeave.Visible = true;
                table1.Visible = true;
                lblleave.Visible = false;
            }
        }
        public int UpdateLeave()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "select");
            cmd.Parameters.AddWithValue("@UID", 0);
            string s = Session["EmpId"].ToString();
            string d = Calendar.SelectedDate.ToString();
            d = d.Substring(0, d.IndexOf(" "));
            cmd.Parameters.AddWithValue("@Type", txtType.Text);
            cmd.Parameters.AddWithValue("@Id", s);
            cmd.Parameters.AddWithValue("@Date", d);
            cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                txtType.Text = dt.Rows[0][1].ToString();
                string st = dt.Rows[0][3].ToString();
                txtDate.Text = st.Substring(0, st.IndexOf(" "));
                CalendarExtender1.SelectedDate = Convert.ToDateTime(st);
                txtReason.Text = dt.Rows[0][4].ToString();
                btnsave.Text = "Update";
                ViewState["kk"] = dt.Rows[0]["IntId"];
                return 1;
            }
            else
            {
                return 0;

            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "delete");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", 0);
            cmd.Parameters.AddWithValue("@Id", Session["EmpId"]);
            cmd.Parameters.AddWithValue("@Date", txtDate.Text);
            cmd.Parameters.AddWithValue("@Reason", "");
            cmd.Parameters.AddWithValue("@month", "");
            cmd.ExecuteNonQuery();
            con.Close();
            txtDate.Text = "";
            CalendarExtender1.SelectedDate = null;
            txtType.Text = "";
            txtReason.Text = "";
            btnsave.Text = "Submit";
            btndelete.Visible = false;
            Calendar.SelectedDate = DateTime.MinValue;
            Page.SetFocus("Calendar");
            showLeaves();
            Response.Redirect("MainPage.aspx");
        }

        protected void cancelLeave_Click(object sender, EventArgs e)
        {
            cancelLeave.Visible = false;
            txtDate.Text = "";
            CalendarExtender1.SelectedDate = null;
            txtType.Text = "";
            txtReason.Text = "";
            btnsave.Text = "Submit";
            btndelete.Visible = false;
            Calendar.SelectedDate = DateTime.MinValue;
            Page.SetFocus("Calendar");
            table1.Visible = false;
            lblleave.Visible = true;
        }

        protected void grd3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "approve");
                cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@Type", txtType.Text);
                cmd.Parameters.AddWithValue("@Id", s);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                cmd.Parameters.AddWithValue("@month", "");
                int c = cmd.ExecuteNonQuery();
                con.Close();
                if (c > 0)
                    MyPending();

            }
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("leave", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@State", "reject");
                cmd.Parameters.AddWithValue("@UID", e.CommandArgument);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@Type", txtType.Text);
                cmd.Parameters.AddWithValue("@Id", s);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text);
                cmd.Parameters.AddWithValue("@month", "");
                int c = cmd.ExecuteNonQuery();
                con.Close();
                if (c > 0)
                    MyPending();
            }
            if (grd3.Visible == true)
            {
                Page.SetFocus("grd3");
            }
            else
                Page.SetFocus("MyTask");
            OnLeaves();
        }

        protected void Holiday_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Holiday.PageIndex = e.NewPageIndex;
            this.holidays();
            Page.SetFocus("Holiday");
        }

        protected void OnLeave_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            OnLeave.PageIndex = e.NewPageIndex;
            this.OnLeaves();
            Page.SetFocus("OnLeave");
        }

        protected void grdan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdan.PageIndex = e.NewPageIndex;
            this.announcement();
            Page.SetFocus("grdan");
        }

        public void announcement()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("announcements", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "extract");
            cmd.Parameters.AddWithValue("@id", 0);
            cmd.Parameters.AddWithValue("@Name", txtAnn.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                grdan.Visible = true;
                grdan.DataSource = dt;
                grdan.DataBind();
                bann.Visible = false;
            }
            else
            {
                bann.Visible = true;
                grdan.Visible = false;
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("announcements", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FLAG", "create");
            cmd.Parameters.AddWithValue("@id", 0);
            cmd.Parameters.AddWithValue("@Name", txtAnn.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            announcement();
            Page.SetFocus("grdan");
        }

        protected void EmpD_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }

        protected void grdan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("announcements", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FLAG", "view");
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Name", txtAnn.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                AnName.Text = dt.Rows[0]["Announcement"].ToString();
                string d = dt.Rows[0]["CreatedOn"].ToString();
                AnDescription.Text = d.Substring(0, d.IndexOf(" "));
                ModalPopupExtender6.Show();
            }
            if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("announcements", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FLAG", "delete");
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Name", txtAnn.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                announcement();
            }
            if (e.CommandName == "C")
            {
                Panel2.Attributes.Add("class", "viewPopup");
                ModalPopupExtender2.Show();
            }

        }

        protected void grdcel_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcel.PageIndex = e.NewPageIndex;
            this.celebrations();
            Page.SetFocus("grdcel");
        }

        protected void grdcel_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("celebration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "view");
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@name", "");
                cmd.Parameters.AddWithValue("@for", "");
                cmd.Parameters.AddWithValue("@location", "");
                cmd.Parameters.AddWithValue("@date", "");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                CelName.Text = dt.Rows[0]["Name"].ToString();
                Celfor.Text = dt.Rows[0]["For"].ToString();
                CelLocation.Text = dt.Rows[0]["Location"].ToString();
                string s = dt.Rows[0]["Date"].ToString();
                CelDate.Text = s.Substring(0, s.IndexOf(" "));
                ModalPopupExtender4.Show();
            }
            if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("celebration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "delete");
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.Parameters.AddWithValue("@name", "");
                cmd.Parameters.AddWithValue("@for", "");
                cmd.Parameters.AddWithValue("@location", "");
                cmd.Parameters.AddWithValue("@date", "");
                cmd.ExecuteNonQuery();
                con.Close();
                celebrations();
                if (grdcel.Rows.Count > 0)
                {
                    lblcel.Visible = false;
                }
                else
                    grdcel.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("celebration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "create");
            cmd.Parameters.AddWithValue("@id", 0);
            cmd.Parameters.AddWithValue("@name", NameCel.Text);
            cmd.Parameters.AddWithValue("@for", ForCel.Text);
            cmd.Parameters.AddWithValue("@location", LocCel.Text);
            cmd.Parameters.AddWithValue("@date", DateCel.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            celebrations();
            Page.SetFocus("grdcel");
        }

        protected void lk23_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
        }

        protected void grd5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("links", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "delete");
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@title", txtLTitle.Text);
                cmd.Parameters.AddWithValue("@link", txtLink.Text);
                cmd.Parameters.AddWithValue("@eid", s);
                cmd.ExecuteNonQuery();
                con.Close();
                Links();

            }
            if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("links", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@flag", "view");
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                string s = Session["EmpId"].ToString();
                cmd.Parameters.AddWithValue("@title", txtLTitle.Text);
                cmd.Parameters.AddWithValue("@link", txtLink.Text);
                cmd.Parameters.AddWithValue("@eid", s);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                Table3.Visible = true;
                grd5.Visible = false;
                txtLink.Text = dt.Rows[0]["Link"].ToString();
                txtLTitle.Text = dt.Rows[0]["Title"].ToString();
                LinkCreate.Text = "Update";
                cancelLink.Visible = true;
                createLink.Visible = false;
                ViewState["Link"] = e.CommandArgument;
                Page.SetFocus("txtLTitle");
            }
            if (grd5.Visible == true)
            {
                Page.SetFocus("grd5");
            }
            else
                Page.SetFocus("myLinks");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void LinkButton6_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Profiles.aspx");
        }
    }
}