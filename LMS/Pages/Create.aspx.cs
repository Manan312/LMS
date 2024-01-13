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
    public partial class Create : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=10.10.10.74;Database = Leave_Management; User ID = sqltrn; Password = Trn@455");

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["UserName"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string a = Session["Action"].ToString();
                if (a.Equals("EDIT"))
                {
                    lblUpdate.Visible = true;
                    lblUpdate.Text = "Do you want to update the details of the Employee with Id= "+Session["EmpId"]+"?";
                    use.Visible = false;
                    txtLID.Visible = false;
                    pas.Visible = false;
                    txtDID.Visible = false;
                    txtName.Visible = false;
                    txtpass.Visible = false;
                    txtId.Visible = false;
                    le.Visible = false;
                    de.Visible = false;
                    na.Visible = false;
                    btnnew.Visible = false;
                    btnedit.Visible = true;
                    btn_backEmp.Visible = true;
                    btnback.Visible = false;
                }
                if (a.Equals("VIEW"))
                {
                    view();
                    btn_backEmp.Visible = true;
                    btnedit.Visible = false;
                    btnnew.Visible = false;
                    btnback.Visible = false;
                    txtId.ReadOnly = true;
                    txtDID.ReadOnly = true;
                    txtLID.ReadOnly = true;
                    txtpass.ReadOnly = true;
                    txtName.ReadOnly=true;
                }
                Page.Title = a + " RECORD";
                
            }
        }
        
        protected void btn_record_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("new", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (!string.IsNullOrEmpty(txtId.Text))
            {
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(txtId.Text));
                cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@LID", txtLID.Text);
                cmd.Parameters.AddWithValue("@DID", txtDID.Text);
                int c = cmd.ExecuteNonQuery();
                if (c != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User details saved sucessfully');window.location ='AdminPage.aspx';", true);
                    txtDID.Text = "";
                    txtpass.Text = "";
                    txtLID.Text = "";
                    txtId.Text = "";
                    txtName.Text = "";
                    lblUpdate.Text = "Editted Details for Employee with Id=" + Session["EmpId"] + " Succesfully!";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Something went Wrong!!');window.location ='AdminPage.aspx';", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Something went Wrong!!');window.location ='AdminPage.aspx';", true);
            }
        }
        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Response.Redirect("AdminPage.aspx");
        }
        
        public void edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "selectEmp");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", "");
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(Session["EmpId"].ToString()));
            cmd.Parameters.AddWithValue("@Date", "");
            cmd.Parameters.AddWithValue("@Reason", "");
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
                Response.Write("No Entry");
            con.Close();
            txtpass.Text = dt.Rows[0][4].ToString();
            txtLID.Text = dt.Rows[0][2].ToString();
            txtDID.Text = dt.Rows[0][3].ToString();
            txtId.Text = dt.Rows[0][0].ToString();
            txtName.Text = dt.Rows[0][1].ToString();
            btnnew.Visible = true;
            btnedit.Visible = false;
            
            btnnew.Text = "Submit";
        }
        public void view()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("leave", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@State", "selectView");
            cmd.Parameters.AddWithValue("@UID", 0);
            cmd.Parameters.AddWithValue("@Type", "");
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(Session["EmpId"].ToString()));
            cmd.Parameters.AddWithValue("@Date", "");
            cmd.Parameters.AddWithValue("@Reason", "");
            cmd.Parameters.AddWithValue("@month", "");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 0)
                Response.Write("No Entry");
            con.Close();
            txtpass.Text = dt.Rows[0][4].ToString();
            txtLID.Text = dt.Rows[0][2].ToString();
            txtDID.Text = dt.Rows[0][3].ToString();
            txtId.Text = dt.Rows[0][0].ToString();
            txtName.Text = dt.Rows[0][1].ToString();
            btnnew.Visible = true;
            btnedit.Visible = false;

            btnnew.Text = "Submit";
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            edit();
            lblUpdate.Visible = false;
            use.Visible = true;
            pas.Visible = true;
            txtLID.Visible = true;
            txtDID.Visible = true;
            txtName.Visible = true;
            txtpass.Visible = true;
            txtId.Visible = true;
            le.Visible = true;
            de.Visible = true;
            na.Visible = true;
        }


        protected void btn_backEmp_Click(object sender, EventArgs e)
        {
            Session["UserName"]="ADMIN";
            Response.Redirect("AdminPage.aspx");
        }
    }
}

