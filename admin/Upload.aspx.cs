using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace logserv.admin
{
    public partial class Upload : System.Web.UI.Page
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

            loadDropdown();
        }

        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void ClearControls(object sender, EventArgs e)
        {
            //Redirect to clear the form.
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void loadDropdown()
        {
            if(!Page.IsPostBack)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT fileNo,uuid,firstname,surname FROM Staff_Reg", con);
                    con.Open();

                    DDLFileNo.DataSource = cmd.ExecuteReader();
                    DDLFileNo.DataTextField = "fileNo";
                    DDLFileNo.DataValueField = "uuid";
                    DDLFileNo.DataBind();
                    DDLFileNo.Items.Insert(0, new ListItem("Select staff file No.", "0"));
                    con.Close();
                }
                catch(Exception Ex)
                {
                    lblmsg.ForeColor = Color.Red;
                    lblmsg.Text = "Error: " + Ex.Message;
                    //Console.WriteLine("Error: " + Ex.Message);
                }
            }
        }

        protected void loadstaffdetails(object sender, EventArgs e)
        {
            if(txtdescription.Value.Trim() == "")
            {
                string title = "HOLD ON!   YOU CANNOT CONTINUE";
                string body = "kindly enter Document(s) Description.";
                DDLFileNo.SelectedIndex = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2('" + title + "', '" + body + "');", true);
            }
            else
            {


                con.Open();

                SqlCommand command = new SqlCommand("Select fileNo,surname, firstname, middlename, imageurl, qualification, age, gender from Staff_reg where uuid=@uuid", con);
                command.Parameters.AddWithValue("@uuid", DDLFileNo.SelectedValue.ToString().Trim());
                using(SqlDataReader reader = command.ExecuteReader())
                {
                    if(reader.Read())
                    {
                        lblfullname.Text = String.Format("{0}", reader["surname"]) + " " + String.Format("{0}", reader["firstname"]) + " " + String.Format("{0}", reader["middlename"]);
                        lblqualification.Text = String.Format("{0}", reader["qualification"]);
                        lblage.Text = String.Format("{0}", reader["age"]);
                        imgstaff.ImageUrl = String.Format("{0}", reader["imageurl"]);
                        lblgender.Text = String.Format("{0}", reader["gender"]);

                        //Clear the sessions before adding values to them to avoid duplicate value
                        Session.Remove("fileupload_staffuuid");
                        Session.Remove("fileupload_staff_fileno");
                        Session.Remove("fileupload_staff_fullname");
                        Session.Remove("fileupload_Description");

                        //Create session for FileUploader.ashx file
                        Session.Add("fileupload_staffuuid", DDLFileNo.SelectedValue.ToString().Trim());
                        Session.Add("fileupload_staff_fileno", String.Format("{0}", reader["fileNo"]));
                        Session.Add("fileupload_staff_fullname", lblfullname.Text);
                        Session.Add("fileupload_Description", txtdescription.Value.Trim());

                        // Detail Div
                        staffDiv.Visible = true;

                        //Response.Redirect(string.Format("Upload.aspx?name={0}&id={1}", lblfullname.Text, DDLFileNo.SelectedValue.ToString().Trim()));
                    }
                }

                con.Close();
            }
        }

    }
}