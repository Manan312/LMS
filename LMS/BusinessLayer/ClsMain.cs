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
    public class ClsMain : AbsClasMain, IDisposable
    {
        public void Dispose()
        {

        }
        public DataTable show()
        {
            try
            {
                SqlParameter[] Param = new SqlParameter[6];
                Param[0] = new SqlParameter("@State", state);
                Param[1] = new SqlParameter("@UID", uid);
                Param[2] = new SqlParameter("@Type", type);
                Param[3] = new SqlParameter("@Id", Id);
                Param[4] = new SqlParameter("@Date", date);
                Param[5] = new SqlParameter("@Reason", reason);
                SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "Leave", Param);
                DataTable dt = new DataTable();
                dt.Load(dr);
                return dt;
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable execute()
        {
            SqlParameter[] Param = new SqlParameter[6];
            Param[0] = new SqlParameter("@State", state);
            Param[1] = new SqlParameter("@UID", uid);
            Param[2] = new SqlParameter("@Type", type);
            Param[3] = new SqlParameter("@Id", Id);
            Param[4] = new SqlParameter("@Date", date);
            Param[5] = new SqlParameter("@Reason", reason);
            SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionString, CommandType.StoredProcedure, "Leave", Param);
            DataTable dt = new DataTable();
            dt.Load(dr);
            return dt;

        }
    }
}