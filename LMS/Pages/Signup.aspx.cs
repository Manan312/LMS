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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Sign Up";
        }
        public void createrecord()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@flag", "create");
                Param[1] = new SqlParameter("@Name", txtName.Text);
                Param[2] = new SqlParameter("@pass", txtpass1.Text);
                Param[3] = new SqlParameter("@Email", txtId1.Text);
                Param[4] = new SqlParameter("@id", "");
                int c = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, CommandType.StoredProcedure, "SignUp", Param);
                if (c > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sign Up Done');window.location ='AdminPage.aspx';", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sign Up Not Done Yet');window.location ='SignUp.aspx';", true);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            createrecord();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}