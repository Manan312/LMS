using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using LMS.DataLayer;

namespace LMS.Pages
{
    public partial class Profiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = Session["UserName"].ToString();
            if(!IsPostBack)
            view();
        }
        public void view()
        {
            viewp();
            viewb();
            viewd();
        }
        public void viewd()
        {
            DataTable dt = show("viewd");
            if (dt.Rows.Count > 0)
            {
                PosName.Text = dt.Rows[0]["LevelName"].ToString();
                DName.Text = dt.Rows[0]["DeptName"].ToString();
            }
        }
        public void viewp()
        {
            DataTable dt = show("viewp");
            if (dt.Rows.Count > 0)
            {
                Pname.Text = dt.Rows[0]["Name"].ToString();
            }
        }
        public void viewb()
        {
            DataTable dt = show("viewb");
            if (dt.Rows.Count > 0)
            {
                Bname.Text = dt.Rows[0]["BankName"].ToString();
                accno.Text = dt.Rows[0]["AccountNumber"].ToString();
                ifc.Text = dt.Rows[0]["IFSC"].ToString();
            }
        }
        public DataTable show(string flag)
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[7];
                Param[0] = new SqlParameter("@flag", flag);
                Param[1] = new SqlParameter("@id", Session["EmpId"]);
                Param[2] = new SqlParameter("@name", "");
                Param[3] = new SqlParameter("@bacc", 0);
                Param[4] = new SqlParameter("@bn", "");
                Param[5] = new SqlParameter("@ifc", "");
                Param[6] = new SqlParameter("@phone", 0);
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "profile", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                return dt;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "EDIT")
            {
                Bname.Enabled = true;
                accno.Enabled = true;
                ifc.Enabled = true;
                Button1.Text = "SUBMIT";
            }
            else
            {
                Button1.Text = "EDIT";
                store("bdetails", "", Convert.ToInt64(accno.Text), Bname.Text, ifc.Text, 0);
                Pname.Enabled = false;
                accno.Enabled = false;
                ifc.Enabled = false;
            }
            
        }
        public void store(string flag, string name, Int64 acn, string bname, string ifc, Int64 phone)
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[7];
                Param[0] = new SqlParameter("@flag", flag);
                Param[1] = new SqlParameter("@id", Session["EmpId"]);
                Param[2] = new SqlParameter("@name", name);
                Param[3] = new SqlParameter("@bacc", acn);
                Param[4] = new SqlParameter("@bn", bname);
                Param[5] = new SqlParameter("@ifc", ifc);
                Param[6] = new SqlParameter("@phone", phone);
                int c = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, CommandType.StoredProcedure, "profile", Param);
                if (c == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Something went Wrong!!');window.location ='Profiles.aspx';", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Details Stored Succesfully');window.location ='Profiles.aspx';", true);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnper_Click(object sender, EventArgs e)
        {
            if (btnper.Text == "EDIT")
            {
                Pname.Enabled = true;
                btnper.Text = "SUBMIT";
            }
            else 
            {
                btnper.Text = "EDIT";
                store("perde", Pname.Text, 0, "", "", 0);
                Pname.Enabled = false;
            }
        }
    }
}
