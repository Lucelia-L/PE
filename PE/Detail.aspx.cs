using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Odbc;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PE
{
    public partial class Detail : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void SendComment(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OdbcConnection conn = new OdbcConnection(connstr);
            int article_id = Int32.Parse(Request.QueryString["article_id"]);
            int user_id =(int)Session["user_id"];
            string comment = TextBox1.Text;
            try
            {
                conn.Open();
                string sql = "insert into comment(user_id,article_id,content) values(" + user_id + "," + article_id + ",'" + comment + "')";
                OdbcCommand cmd = new OdbcCommand(sql, conn);
                cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
            conn.Close();       
        }
    }
}