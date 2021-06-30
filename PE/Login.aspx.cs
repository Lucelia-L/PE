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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginUser(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OdbcConnection conn = new OdbcConnection(connstr);
            string name = tb_username.Text;
            string passwd_client = tb_password.Text;
            string passwd_serve = null;
            int age = 0;
            string sex = null;
            int user_id = 0;
            bool flag = false;

            try
            {
                conn.Open();
                string sql = "select * from user where name ='" + name + "'";
                OdbcCommand cmd = new OdbcCommand(sql, conn);
                OdbcDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    flag = true;
                    user_id = (int)rdr[0];
                    passwd_serve = (string)rdr[2];
                    age = (int)rdr[3];
                    sex = (string)rdr[4];
                }
                rdr.Close();      
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
            conn.Close();
            if (!flag)
            {
                Server.Transfer("Login.aspx");
            }
            if (passwd_client.Equals(passwd_serve))
            {
                Session.Add("age", age);
                Session.Add("sex", sex);
                Session.Add("username", name);
                Session.Add("user_id", user_id);
                Server.Transfer("Index.aspx");
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
    }
}