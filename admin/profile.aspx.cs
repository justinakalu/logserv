using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);
       
        protected void Page_Load(object sender, EventArgs e)
        {
            //check login
            if(Session["username"] != null || Session["userimgurl"] != null)
            {
                //Assign seesion values to controls
                userimg.Src = Session["userimgurl"].ToString();
                lblusername.Text = Session["username"].ToString();
                userimg2.Src = Session["userimgurl"].ToString();
                lblprofilename.Text = Session["userfullname"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            if(!this.IsPostBack)
            {
                if(Session["profile_staffuuid"] != null)
                {
                    con.Open();

                    LoadDropDown();
                    loadstaff();
                    Bindgrid();
                    BindDocGrid();

                    con.Close();
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        public void loadstaff()
        {

            string uuid = Session["profile_staffuuid"].ToString();

            //con.Open();

            SqlCommand command = new SqlCommand("Select * from Staff_reg where uuid=@uuid", con);
            command.Parameters.AddWithValue("@uuid", uuid);
            using(SqlDataReader reader = command.ExecuteReader())
            {
                if(reader.Read())
                {
                    lblname.Text = String.Format("{0}", reader["surname"]) + " " + String.Format("{0}", reader["firstname"]) + " " + String.Format("{0}", reader["middlename"]);
                    lbladdress.Text = String.Format("{0}", reader["homeaddress"]);
                    lblage.Text = String.Format("{0}", reader["age"]);
                    staffimg.ImageUrl = String.Format("{0}", reader["imageurl"]);
                    lblAppointmentDate.Text = String.Format("{0}", reader["long_appointmentdate"]);
                    lbldateregistered.Text = String.Format("{0}", reader["long_dateregistered"]);
                    lblemail.Text = String.Format("{0}", reader["email"]);
                    lblfileno.Text = String.Format("{0}", reader["fileNo"]);
                    lblgender.Text = String.Format("{0}", reader["gender"]);
                    lblLGAofService.Text = String.Format("{0}", reader["servingLGA_Chart"]);
                    lblLGAorigin.Text = String.Format("{0}", reader["originLGA"]);
                    lblphone.Text = String.Format("{0}", reader["phone"]);
                    lblqualification.Text = String.Format("{0}", reader["qualification"]);
                    lblstateoforigin.Text = String.Format("{0}", reader["stateoforigin"]);

                    DDLstaff.ClearSelection();
                    DDLstaff.Items.FindByText(String.Format("{0}", reader["fileNo"])).Selected = true;
                }
            }

            // con.Close();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if(e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }

            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblnewNote = (Label)e.Row.FindControl("lblnote");
                lblnewNote.Text = Server.HtmlDecode(lblnewNote.Text);
            }
        }

        protected void docGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {


                Image img = (Image)e.Row.FindControl("fileimg");
                Label lblfilename2 = (Label)e.Row.FindControl("lblfilename");

                if(lblfilename2.Text.Contains(".docx") || lblfilename2.Text.Contains(".doc"))
                {
                    img.ImageUrl = "~/File_ext_Images/word3.png";
                }
                if(lblfilename2.Text.Contains(".csv") || lblfilename2.Text.Contains(".xlsx")
                    || lblfilename2.Text.Contains(".xlsm") || lblfilename2.Text.Contains(".xls")
                    || lblfilename2.Text.Contains(".xltx") || lblfilename2.Text.Contains(".xltm"))  //XLSX, XLSM, XLS, XLTX, and XLTM
                {
                    img.ImageUrl = "~/File_ext_Images/excel.jpg";
                }
                if(lblfilename2.Text.Contains(".pdf"))
                {
                    img.ImageUrl = "~/File_ext_Images/pdf4.png";
                }
                if(lblfilename2.Text.Contains(".txt"))
                {
                    img.ImageUrl = "~/File_ext_Images/txt3.png";
                }
                if(lblfilename2.Text.Contains(".ppt"))
                {
                    img.ImageUrl = "~/File_ext_Images/powerpoint3.jpg";
                }
            }

            //check if the row is the header row
            if(e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }

        }

        public void Bindgrid()
        {

            string uuid = Session["profile_staffuuid"].ToString();
            //con.Open();

            SqlCommand command = new SqlCommand("SELECT * FROM service_Table where staff_uuid = @staff_uuid order by id desc", con);
            command.Parameters.AddWithValue("@staff_uuid", uuid);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            TimelineGrid.DataSource = ds;
            TimelineGrid.DataBind();

            //con.Close();

        }

        public void BindDocGrid()
        {

            string uuid = Session["profile_staffuuid"].ToString();
            //con.Open();

            SqlCommand command = new SqlCommand("SELECT * FROM staff_doc where staffuuid = @staffuuid order by id desc", con);
            command.Parameters.AddWithValue("@staffuuid", uuid);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            Docgrid.DataSource = ds;
            Docgrid.DataBind();

            //con.Close();

        }

        public void LoadDropDown()
        {
            string com = "Select * from Staff_Reg";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DDLstaff.DataSource = dt;
            DDLstaff.DataBind();
            DDLstaff.DataTextField = "fileNo";
            DDLstaff.DataValueField = "uuid";
            DDLstaff.DataBind();
            DDLstaff.Items.Insert(0, new ListItem("-Click here to select-", "0"));
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }

        protected void loadstaff(object sender, EventArgs e)
        {

            if(DDLstaff.SelectedIndex == 0)
            {
                // Do nothing
            }
            else
            {
                string ddl_staffuuid = DDLstaff.SelectedValue.ToString();
                Session["profile_staffuuid"] = ddl_staffuuid;

                // Load controls
                con.Open();

                loadstaff();
                Bindgrid();
                BindDocGrid();

                con.Close();
            }
        }
    }
}