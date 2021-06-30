using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace PE
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SexCustomValidator(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "请选择性别") args.IsValid = false;
        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            if (!CustomValidator1.IsValid)
            {
                CustomValidator1.Text = "请选择性别";
                return;
            }
            string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OdbcConnection conn = new OdbcConnection(connstr);
            string name = tb_username.Text;
            string passwd = tb_password.Text;
            int age = Int32.Parse(tb_age.Text);
            string sex = ddl_sex.SelectedValue;

            try
            {
                conn.Open();
                string sql = "insert into user(name,passwd,age,sex) values('" + name + "','" + passwd + "'," + age + ",'" + sex + "')";
                OdbcCommand cmd = new OdbcCommand(sql, conn);
                cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
            }
            conn.Close();
            Server.Transfer("Login.aspx");
        }


    }
}