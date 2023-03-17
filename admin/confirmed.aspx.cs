using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class confirmed : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);
        string imgurl;
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            //check login
            if (Session["username"] != null || Session["userimgurl"] != null)
            {
                //Assign session values to controls
                userimg.Src = Session["userimgurl"].ToString();
                lblusername.Text = Session["username"].ToString();
                userimg2.Src = Session["userimgurl"].ToString();
                lblprofilename.Text = Session["userfullname"].ToString();
                userid = Session["userid"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }


            if (!this.IsPostBack)
            {
                Bindgrid();
            }
        }

        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        public void Bindgrid()
        {
            con.Open();

            SqlCommand command = new SqlCommand("SELECT * FROM Staff_Reg WHERE confirmed='Yes'", con);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            staffgrid.DataSource = ds;
            staffgrid.DataBind();

            con.Close();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }

        }

        protected void Editstaff(object sender, EventArgs e)
        {
            string editstaffuuid = (sender as LinkButton).CommandArgument;
            Session["editstaffuuid"] = editstaffuuid;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowEditPopup();", true);
            //Response.Redirect("edit-staff.aspx");
        }

        protected void showdetails(object sender, EventArgs e)
        {
            //string editstaffuuid = (sender as LinkButton).CommandArgument;
            //Bindgrid();

        }


     

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "viewstaff")
            {
                string uuid = e.CommandArgument.ToString();
                Session["profile_staffuuid"] = uuid;
                Response.Redirect("profile.aspx");
            }
        }
    }
}