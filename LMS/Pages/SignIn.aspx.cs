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
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Sign In";
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            checkrecord();
        }
        public void checkrecord()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@flag", "check");
                Param[1] = new SqlParameter("@Name", "");
                Param[2] = new SqlParameter("@pass", txtpass.Text);
                Param[3] = new SqlParameter("@Email", txtId.Text);
                Param[4] = new SqlParameter("@id", "");
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "SignUp", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                if (dt.Rows.Count > 0)
                {
                    Session["AID"] = dt.Rows[0]["Id"].ToString();
                    Response.Redirect("Documents.aspx");
                    
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sign Up Not Done Yet');window.location ='SignIn.aspx';", true);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}