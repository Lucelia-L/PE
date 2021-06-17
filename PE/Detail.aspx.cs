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
 
            Debug.WriteLine("开始连接");

            string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            Debug.WriteLine(connstr);

            OdbcConnection conn = new OdbcConnection(connstr);

            int article_id = Int32.Parse(Request.QueryString["article_id"]);
            int user_id =(int)Session["user_id"];
            string comment = TextBox1.Text;
            Debug.WriteLine("获取数据");
            try
            {
                conn.Open();
                string sql = "insert into comment(user_id,article_id,content) values(" + user_id + "," + article_id + ",'" + comment + "')";
                Debug.WriteLine(sql);
                OdbcCommand cmd = new OdbcCommand(sql, conn);
                cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
                Response.Write(ex.ToString());
            }
            conn.Close();
            Debug.WriteLine("结束连接");
            
        }
    }
}