using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Globalization;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using LMS.AbstractLayer;
using LMS.DataLayer;
using System.Data;
using System;
namespace LMS.BusinessLayer

{
    public class ClsLogin:AbsClsLogin,IDisposable
    {
        public void Dispose()
        {

        }
        public DataTable check()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@State", "check");
                Param[1] = new SqlParameter("@id", intId);
                Param[2] = new SqlParameter("@pass", password);
                Param[3] = new SqlParameter("@Name", "");
                Param[4] = new SqlParameter("@LID", ""  );
                Param[5] = new SqlParameter("@DID", "");
                SqlDataReader c = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "login", Param);
                DataTable dt = new DataTable();
                dt.Load(c);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}