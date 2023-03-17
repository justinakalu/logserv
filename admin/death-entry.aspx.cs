using System;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class death_entry : System.Web.UI.Page
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
            if(DDLFileNo.SelectedIndex == 0)
            {
                staffDiv.Visible = false;
            }
            else
            {
                con.Open();

                SqlCommand command = new SqlCommand("Select fileNo,surname, firstname, middlename, imageurl, qualification, age, gender, servingLGA_Chart from Staff_reg where uuid=@uuid", con);
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
                        Session["promotionFName"] = String.Format("{0}", reader["firstname"]);
                        Session["promotionLName"] = String.Format("{0}", reader["surname"]);
                        Session["promotionMName"] = String.Format("{0}", reader["middlename"]);
                        lblage.Text = String.Format("{0}", reader["age"]);

                        // Detail Div
                        staffDiv.Visible = true;

                        string servlga = String.Format("{0}", reader["servingLGA_Chart"]);

                        if(servlga == null)
                        {
                            //Do nothing
                        }
                        else
                        {
                            RiversLGAselect.Value = String.Format("{0}", reader["servingLGA_Chart"]);
                        }
                    }
                }

                con.Close();
                //}
            }
        }

        protected void submitpromotion(object sender, EventArgs e)
        {
            if(Session["promotionFName"] == null)
            {
                //Redirect to clear the form.
                Response.Redirect(Request.Url.AbsoluteUri);
            }

            // code for geting the value of CKeditor without HTML tags. This is to check if the editor contains value
            StringWriter myWriter = new StringWriter();
            HttpUtility.HtmlDecode(editor.Text, myWriter);
            string checkeditor = myWriter.ToString().Trim();

            if(DDLselectLevel.SelectedIndex == 0)
            {
                string title = "HOLD ON!   YOU CANNOT CONTINUE";
                string body = "kindly select staff grade level.";

                ClientScript.RegisterStartupScript(this.GetType(), "Popup2", "ShowPopup2('" + title + "', '" + body + "');", true);
                DDLselectLevel.Focus();
            }
            else if(txtrank.Value.Trim() == "")
            {
                string title = "HOLD ON!   YOU CANNOT CONTINUE";
                string body = "kindly enter staff RANK. If there is no rank for the staff, enter <b>'None'</b> in the box";

                ClientScript.RegisterStartupScript(this.GetType(), "Popup3", "ShowPopup2('" + title + "', '" + body + "');", true);
                txtrank.Focus();
            }
            else if(RiversLGAselect.SelectedIndex == 0)
            {
                string title = "HOLD ON!   YOU CANNOT CONTINUE";
                string body = "kindly select the Local Government Area where the staff is serving";

                ClientScript.RegisterStartupScript(this.GetType(), "Popup4", "ShowPopup2('" + title + "', '" + body + "');", true);
                RiversLGAselect.Focus();
            }
            else if(checkeditor.Length <= 0)
            {
                string title = "HOLD ON!   YOU CANNOT CONTINUE";
                string body = "kindly enter NOTE. If there is no further note about the staff, enter <b>'None'</b> in the Add Note box";
                editor.Focus();
                lblmsg.Text = title + "</br></br>" + " " + body + "</br></br>";
                lblmsg.ForeColor = Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup5", "ShowPopup2('" + title + "', '" + body + "');", true);
            }
            else
            {
                DateTime actiondate = DateTime.Parse(dateofdeath.Value);
                DateTime now = DateTime.Now;
                string neweditor = Server.HtmlEncode(editor.Text);


                String query = "INSERT INTO service_Table (staff_uuid, fileno, firstname, lastname, servingLGA, " +
                                "dateofAction, long_dateofaction, middlename, gradelevel, rank, note, status, activedate, long_activedate) " +
                                "VALUES (@staff_uuid, @fileno, @firstname, @lastname, @servingLGA, @dateofAction, " +
                                "@long_dateofaction, @middlename, @gradelevel, @rank, @note, @status, @activedate, @long_activedate) ";

                // open connection
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@staff_uuid", DDLFileNo.SelectedValue.ToString().Trim());
                cmd.Parameters.AddWithValue("@fileNo", DDLFileNo.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@firstname", Session["promotionFName"].ToString());
                cmd.Parameters.AddWithValue("@lastname", Session["promotionLName"].ToString());
                cmd.Parameters.AddWithValue("@servingLGA", RiversLGAselect.Value.ToString().Trim());
                cmd.Parameters.AddWithValue("@dateofAction", now.Date);
                cmd.Parameters.AddWithValue("@long_dateofaction", now.ToLongDateString());
                cmd.Parameters.AddWithValue("@middlename", Session["promotionMName"].ToString());
                cmd.Parameters.AddWithValue("@gradelevel", DDLselectLevel.Value.Trim());
                cmd.Parameters.AddWithValue("@rank", txtrank.Value.Trim());
                cmd.Parameters.AddWithValue("@note", neweditor);
                cmd.Parameters.AddWithValue("@status", "Dead");

                cmd.Parameters.AddWithValue("@activedate", actiondate.Date);
                cmd.Parameters.AddWithValue("@long_activedate", actiondate.ToLongDateString());

                int result = cmd.ExecuteNonQuery();

                //Check submission was successful
                if(result > 0)
                {
                    //Clear the sessions before adding values to them to avoid duplicate value
                    Session.Remove("promotionFName");
                    Session.Remove("promotionLName");
                    Session.Remove("promotionMName");

                    //Update retired coloumn in staff registration table
                    upateRegTable();

                    //return the fileno dropdown to 0
                    DDLFileNo.SelectedIndex = 0;
                }
                else
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Your Message.');", true);
                }

                // Close connection
                con.Close();
            }
        }

        protected void upateRegTable()
        {
            String query2 = "UPDATE Staff_Reg SET dead = @dead, retired = @retired, servingLGA_Chart = @servingLGA_Chart Where uuid = @uuid";

            // No need to open connection again since this method is called in Submitpromotion method that has opened connection
            //con.Open();

            SqlCommand cmd2 = new SqlCommand(query2, con);

            cmd2.Parameters.AddWithValue("@uuid", DDLFileNo.SelectedValue.ToString().Trim());
            cmd2.Parameters.AddWithValue("@servingLGA_Chart", RiversLGAselect.Value.ToString().Trim());
            cmd2.Parameters.AddWithValue("@dead", "Yes");
            cmd2.Parameters.AddWithValue("@retired", "No");

            int result = cmd2.ExecuteNonQuery();

            //Check submission was successful
            if(result > 0)
            {
                string title = "Death registration was successful";
                string body = "Do you want to upload staff related documents such as deathcertificate, e.t.c now?" +
                    " <br/> <br/> This can be done later by using the <b>Upload document</b> Menu under the Staff Menu.";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup1", "ShowPopup('" + title + "', '" + body + "');", true);
            }
            else
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Your Message.');", true);
            }

            //No need to close connection again since this method is called in Submitpromotion method that has opened connection
            //con.Close();
        }

        protected void DocUploadRedirect(object sender, EventArgs e)
        {
            Response.Redirect("Upload.aspx");
        }

        protected void ClearControls(object sender, EventArgs e)
        {
            //Redirect to clear the form.
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}