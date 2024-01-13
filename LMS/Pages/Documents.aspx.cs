using LMS.DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace LMS.Pages
{
    public partial class Documents : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AID"] == null)
            {
                Response.Redirect("SignIn.aspx");
            }
            Head.Text = "Welcome Applicant Number : EIC2023" + Session["AID"].ToString();
            getDetails();
        }
        public void getDetails()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[17];
                Param[0] = new SqlParameter("@flag", "view");
                Param[1] = new SqlParameter("@id", Session["AID"]);
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

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void LKU_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("SignIn.aspx");
        }
        //public void checkPhoto()
        //{
        //    try
        //    {
        //        if (Photo.HasFile)
        //        {
        //            string ext = Path.GetExtension(Photo.FileName);
                    
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw (ex);
        //    }
        //}
        protected void FileSubmit_Click(object sender, EventArgs e)
        {
            //if (checkPhoto() && check10() && check12() && checkGrd())
            //{
            //    store();
            //}
            //else
            //{
            //    if (!checkPhoto())
            //    { 

            //    }
            //}
            try
            {
                string a = Session["AID"].ToString();
                var path = @"C:\Users\manan.garg\Desktop\LMS\LMS\Images\EIC2023"+Session["AID"].ToString()+"/";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                adhar.SaveAs(path + adhar.FileName);
                string s = adhar.FileName;
                Pan.SaveAs(path + Pan.FileName);
                Mar10.SaveAs(path + Mar10.FileName);
                Cer10.SaveAs(path + Cer10.FileName);
                Mar12.SaveAs(path + Mar12.FileName);
                Cer12.SaveAs(path + Cer12.FileName);
                MarGrd.SaveAs(path + MarGrd.FileName);
                Photo.SaveAs(path + Photo.FileName);
                SqlParameter[] Param = new SqlParameter[17];
                Param[0] = new SqlParameter("@flag", "create");
                Param[1] = new SqlParameter("@id", Session["AID"]);
                Param[2] = new SqlParameter("@adhar",s);
                Param[3] = new SqlParameter("@pan",Pan.FileName);
                Param[4] = new SqlParameter("@Marsheet10", Mar10.FileName);
                Param[5] = new SqlParameter("@certificate10", Cer10.FileName);
                Param[6] = new SqlParameter("@Marsheet12", Mar12.FileName);
                Param[7] = new SqlParameter("@certificate12", Cer12.FileName);
                Param[8] = new SqlParameter("@Diploma", "");
                Param[9] = new SqlParameter("@CourseGrd", GrdCrse.Text);
                Param[10] = new SqlParameter("@MarksheetGrd", MarGrd.FileName);
                Param[11] = new SqlParameter("@DL", "");
                Param[12] = new SqlParameter("@Passport", "");
                Param[13] = new SqlParameter("@ExpLetter", "");
                Param[14] = new SqlParameter("@photo",Photo.FileName);
                Param[15] = new SqlParameter("@exp", "");
                Param[16] = new SqlParameter("@fn", "EIC2023"+Session["AID"]);
                int c = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionString, CommandType.StoredProcedure, "documents", Param);
                
                if (c>0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Files Saved');window.location ='SignIn.aspx';", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Files Not Saved');window.location ='Documents.aspx';", true);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "1")
            {
                ExpLetter.Visible = true;
                ExpYear.Visible = true;
            }
            else
            {
                ExpLetter.Visible = false;
                ExpYear.Visible = false;
            }
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList2.SelectedValue == "1")
            {
                Oth.Visible = true;
                Moth.Visible = true;
            }
            else
            {
                Oth.Visible = false;
                Moth.Visible = false;
            }
        }
    }
}