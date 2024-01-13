using LMS.DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.IO;


namespace LMS.Pages
{
    public partial class ViewApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
                LKU.Text = "ADMIN";
        }
        public void showcred()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[5];
                Param[0] = new SqlParameter("@flag", "view");
                Param[1] = new SqlParameter("@id", 0);
                Param[2] = new SqlParameter("@name", "");
                Param[3] = new SqlParameter("@email", "");
                Param[4] = new SqlParameter("@pass", "");
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "signup", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                if (dt.Rows.Count > 0)
                {
                    credentials.Visible = true;
                    credentials.DataSource = dt;
                    credentials.DataBind();
                    documents.DataSource = null;
                    documents.DataBind();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        protected void btnshowcredentials_Click(object sender, EventArgs e)
        {
            showcred();
        }
        public void showdoc()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[17];
                Param[0] = new SqlParameter("@flag", "docs");
                Param[1] = new SqlParameter("@id", "");
                Param[2] = new SqlParameter("@adhar", "");
                Param[3] = new SqlParameter("@pan", "");
                Param[4] = new SqlParameter("@Marsheet10", "");
                Param[5] = new SqlParameter("@certificate10", "");
                Param[6] = new SqlParameter("@Marsheet12", "");
                Param[7] = new SqlParameter("@certificate12", "");
                Param[8] = new SqlParameter("@Diploma", "");
                Param[9] = new SqlParameter("@CourseGrd", "");
                Param[10] = new SqlParameter("@MarksheetGrd", "");
                Param[11] = new SqlParameter("@DL", "");
                Param[12] = new SqlParameter("@Passport", "");
                Param[13] = new SqlParameter("@ExpLetter", "");
                Param[14] = new SqlParameter("@photo", "");
                Param[15] = new SqlParameter("@exp", "");
                Param[16] = new SqlParameter("@fn", "");
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "documents", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                if (dt.Rows.Count > 0)
                {
                    documents.DataSource = dt;
                    documents.DataBind();
                    credentials.DataSource = null;
                    credentials.DataBind();

                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        protected void btnshowDocuments_Click(object sender, EventArgs e)
        {
            showdoc();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            credentials.DataSource = null;
            credentials.DataBind();
            documents.DataSource = null;
            documents.DataBind();
        }

        protected void backtoMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }

        protected void credentials_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string s = "";
            Int64 id = Convert.ToInt64(e.CommandArgument);
            if (e.CommandName == "A")
            {
                s = "delete";
            }
            if (e.CommandName == "B")
            {
                s = "edit";
            }
            if (e.CommandName == "C")
            {
                s = "deactivate";
            }
            if (e.CommandName == "D")
            {
                s = "activate";
            }
            excStat(s, id);
        }
        public void excStat(string s, Int64 id)
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[5];
                Param[0] = new SqlParameter("@flag", s);
                Param[1] = new SqlParameter("@id", id);
                Param[2] = new SqlParameter("@name", "");
                Param[3] = new SqlParameter("@email", "");
                Param[4] = new SqlParameter("@pass", "");
                int c = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, CommandType.StoredProcedure, "signup", Param);
                if (c > 0)
                {
                    showcred();
                }
                else
                {
                    showcred();
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        protected void credentials_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            credentials.PageIndex = e.NewPageIndex;
            this.showcred();
        }

        protected void documents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            documents.PageIndex = e.NewPageIndex;
            this.showdoc();
        }
        public void execDoc(string s, string id)
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[17];
                Param[0] = new SqlParameter("@flag", s);
                Param[1] = new SqlParameter("@id", "");
                Param[2] = new SqlParameter("@adhar", "");
                Param[3] = new SqlParameter("@pan", "");
                Param[4] = new SqlParameter("@Marsheet10", "");
                Param[5] = new SqlParameter("@certificate10", "");
                Param[6] = new SqlParameter("@Marsheet12", "");
                Param[7] = new SqlParameter("@certificate12", "");
                Param[8] = new SqlParameter("@Diploma", "");
                Param[9] = new SqlParameter("@CourseGrd", "");
                Param[10] = new SqlParameter("@MarksheetGrd", "");
                Param[11] = new SqlParameter("@DL", "");
                Param[12] = new SqlParameter("@Passport", "");
                Param[13] = new SqlParameter("@ExpLetter", "");
                Param[14] = new SqlParameter("@photo", "");
                Param[15] = new SqlParameter("@exp", "");
                Param[16] = new SqlParameter("@fn", id);
                int c = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, CommandType.StoredProcedure, "documents", Param);

                if (c > 0)
                {
                    showdoc();
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public void downZip(string folder)
        {
            string path = Server.MapPath(@"..\Images\"+folder);//Location for inside Test Folder  
            if (Directory.Exists(path))
            {
                string[] Filenames = Directory.GetFiles(path);
                using (ZipFile zip = new ZipFile())
                {
                    zip.AddFiles(Filenames, "Project");//Zip file inside filename  
                    zip.Save(@"C:\Users\manan.garg\Desktop\LMS\LMS\Images\" + folder + ".zip");//location and name for creating zip file  

                }
            }
        }
        public void delFold(string folder)
        {
            string path= Server.MapPath(@"..\Images\" + folder);
            if (Directory.Exists(path)) 
                Directory.Delete(path, true);
        }
        protected void documents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "B")
            {
                execDoc("deletedoc", e.CommandArgument.ToString());
                delFold(e.CommandArgument.ToString());
            }
            if (e.CommandName == "A")
            {
                downZip(e.CommandArgument.ToString());
            }
        }
        protected void Create_Click(object sender, EventArgs e)
        {
            Session["UserName"] = "ADMIN";
            Session["Action"] = "CREATE";
            Response.Redirect("Create.aspx");
        }
        protected void LKU_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Session.Clear();
            Session.Abandon();
        }
    }
}