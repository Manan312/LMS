using LMS.DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LMS.Pages
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Change Password";
        }
        public Boolean check()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@state", "checkp");
                Param[1] = new SqlParameter("@id", Session["EmpId"]);
                Param[2] = new SqlParameter("@pass", txtpasas.Text);
                Param[3] = new SqlParameter("@LID", 0);
                Param[4] = new SqlParameter("@Name", "");
                Param[5] = new SqlParameter("@DID", 0);
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "login", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                if (dt.Rows.Count>0)
                {
                    if (dt.Rows[0]["vchPassword"].ToString() == txtId.Text)
                        return true;
                    return false;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (check())
            {
                exec("changePass");
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Old Password Is Wrong!!');window.location ='ChangePassword.aspx';", true);
        }
        public void exec(string flag)
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@state", flag);
                Param[1] = new SqlParameter("@id", Session["EmpId"]);
                Param[2] = new SqlParameter("@pass", txtpasas.Text);
                Param[3] = new SqlParameter("@LID", 0);
                Param[4] = new SqlParameter("@Name", "");
                Param[5] = new SqlParameter("@DID", 0);
                int c = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, CommandType.StoredProcedure, "login", Param);
                if (c == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Something went Wrong!!');window.location ='ChangePassword.aspx';", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Changed Succesfully');window.location ='ChangePassword.aspx';", true);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}