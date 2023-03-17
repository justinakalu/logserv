using System;
using System.Data.SqlClient;

namespace logserv.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(Object sender, EventArgs e)
        {
            lblmsg.Text = "";

            MyClassObjects classobject = new MyClassObjects();
            classobject.OpenConnection();
            string str = string.Format("Select * From admin_login where username = '{0}' and password= '{1}'", txtusername.Value.Trim(), txtpsw.Value.Trim());
            SqlDataReader dr = classobject.DataReader(str);
            dr.Read();
            if(dr.HasRows)
            {
                //create session variables 
                Session["username"] = String.Format("{0}", dr["username"]);
                Session["userimgurl"] = String.Format("{0}", dr["imgurl"]);
                Session["userfullname"] = String.Format("{0}", dr["name"]);
                Session["userid"] = String.Format("{0}", dr["userid"]); // This is known as uuid from staff reg
                Session["usertype"] = String.Format("{0}", dr["usertype"]);
                // Login code
                Response.Redirect("home.aspx");
            }
            else
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Incorrect login details";
            }

            classobject.CloseConnection();
        }
    }
}