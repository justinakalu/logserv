using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);
        MyClassObjects newclassobject = new MyClassObjects();

        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // check if staff exists
                String query2 = "SELECT * FROM Staff_Reg where fileNo = @fileNo or email = @email";

                con.Open();

                SqlCommand cmd2 = new SqlCommand(query2, con);
                cmd2.Parameters.AddWithValue("@email", txtemail.Value.Trim());
                cmd2.Parameters.AddWithValue("@fileNo", txtfileno.Value.Trim());

                SqlDataAdapter adapter = new SqlDataAdapter(cmd2);
                DataSet dataset2 = new DataSet();
                adapter.Fill(dataset2);
                ///int result2 = cmd2.ExecuteNonQuery();
                //con.Close();

                //Check submission was successful
                if (dataset2.Tables[0].Rows.Count>0)
                {
                    // A staff with this Email or Staff Id Exists
                    string title = "Registration cannot proceed";
                    string body = "A staff with this email or ID exists" +
                        " <br/> <br/> Make the necessary correction";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup2('" + title + "', '" + body + "');", true);

                }
                else
                {
                    //GET AND RETAIN THE VALUE OF THE SELECTED LGA
                    var lgaValue = "";
                    lgaValue = Request.Form[LGASelect.UniqueID];


                    //get the file name of the posted image
                    string imgName = Guid.NewGuid().ToString("N").Substring(0, 15) + fileupload.FileName;

                    //sets the image path
                    string imgPath = "../ImageStorage/" + imgName;

                    //get the size in bytes that
                    int imgSize = fileupload.PostedFile.ContentLength;

                    //validates the posted file before saving
                    if (fileupload.PostedFile != null && fileupload.PostedFile.FileName != "")
                    {
                        // 10240 KB means 10MB, You can change the value based on your requirement
                        if (fileupload.PostedFile.ContentLength > 10485760 /*this is in byte but equal to 5mb*/)
                        {
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_image", "toastr.error('Image file is too big', 'Error')", true);
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "EroorUpload", "showContent('Image file is too big','Error');", true);
                        }
                        else
                        {
                            //then save it to the Folder
                            fileupload.SaveAs(Server.MapPath(imgPath));
                            //Image1.ImageUrl = "~/" + imgPath;
                            string imgurl = imgPath;

                            //Calculate for age
                            //.....................
                            DateTime DOB = DateTime.Parse(daterangepicker.Value);
                            DateTime Newdate = DateTime.Now;

                            DateTime tmp = DOB;
                            int years = -1;
                            while (tmp < Newdate)
                            {
                                years++;
                                tmp = tmp.AddYears(1);
                            }

                            int age = years;


                            //Send to Database
                            //--------------------------------------------------------------------------------
                            string myuuid = Guid.NewGuid().ToString();
                            string gender;
                            DateTime now = DateTime.Now;
                            DateTime datereg = DateTime.Parse(dateofappointment.Value);
                            DateTime dob = DateTime.Parse(daterangepicker.Value);

                            if (maleRadio.Checked)
                            {
                                gender = "Male";
                            }
                            else
                            {
                                gender = "Female";
                            }

                            String query = "INSERT INTO Staff_Reg (uuid,fileNo, surname, firstname, middlename, " +
                                           "gender, qualification, homeaddress, stateoforigin, originLGA, dateofbirth, long_dateofbirth, " +
                                           "status, imageurl, dateregistered, long_dateregistered, appointmentdate, long_appointmentdate, age, servingLGA_Chart, email, phone, dead, retired) " +

                                           "VALUES (@uuid, @fileNo, @surname, @firstname, @middlename, @gender, @qualification, " +
                                           "@homeaddress, @stateoforigin, @originLGA, @dateofbirth, @long_dateofbirth, @status, @imageurl, @dateregistered, " +
                                           "@long_dateregistered, @appointmentdate, @long_appointmentdate, @age, @servingLGA_Chart, @email, @phone, @dead, @retired); " +

                                           "INSERT INTO service_Table (staff_uuid,fileno, firstname, lastname, dateofAction, long_dateofaction, servingLGA, " +
                                           "middlename, gradelevel, status, note) " +
                                           "VALUES (@staff_uuid, @fileno2, @firstname2, @lastname2, @dateofAction2, @long_dateofaction2, @servingLGA2, @middlename2, " +
                                           "@gradelevel2, @status2, @note)";

                            // open connection
                           // con.Open();

                            string note = "New record was created for " + txtfirstname.Value.Trim() + " " + txtsurname.Value.Trim() + ". Appointment was also recorded.";

                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@uuid", myuuid);
                            cmd.Parameters.AddWithValue("@fileNo", txtfileno.Value.Trim());
                            cmd.Parameters.AddWithValue("@surname", txtsurname.Value.Trim());
                            cmd.Parameters.AddWithValue("@firstname", txtfirstname.Value.Trim());
                            cmd.Parameters.AddWithValue("@middlename", txtmiddlename.Value.Trim());
                            cmd.Parameters.AddWithValue("@gender", gender);
                            cmd.Parameters.AddWithValue("@qualification", txtqualification.Value.Trim());
                            cmd.Parameters.AddWithValue("@homeaddress", txtaddress.Value.Trim());
                            cmd.Parameters.AddWithValue("@stateoforigin", StateSelect.Value.Trim());
                            cmd.Parameters.AddWithValue("@originLGA", lgaValue);
                            cmd.Parameters.AddWithValue("@dateofbirth", daterangepicker.Value.Trim());
                            cmd.Parameters.AddWithValue("@long_dateofbirth", dob.ToLongDateString());
                            cmd.Parameters.AddWithValue("@status", "New Staff Reg");
                            cmd.Parameters.AddWithValue("@imageurl", imgurl);
                            cmd.Parameters.AddWithValue("@dateregistered", now);
                            cmd.Parameters.AddWithValue("@long_dateregistered", DateTime.Now.ToLongDateString());
                            cmd.Parameters.AddWithValue("@appointmentdate", dateofappointment.Value.Trim());
                            cmd.Parameters.AddWithValue("@long_appointmentdate", datereg.ToLongDateString());
                            cmd.Parameters.AddWithValue("@age", age);
                            cmd.Parameters.AddWithValue("@servingLGA_Chart", RiversLGAselect.Value.Trim());
                            cmd.Parameters.AddWithValue("@email", txtemail.Value.Trim());
                            cmd.Parameters.AddWithValue("@phone", txtphone.Value.Trim());
                            cmd.Parameters.AddWithValue("@dead", "No");
                            cmd.Parameters.AddWithValue("@retired", "No");

                            cmd.Parameters.AddWithValue("@staff_uuid", myuuid);
                            cmd.Parameters.AddWithValue("@fileNo2", txtfileno.Value.Trim());
                            cmd.Parameters.AddWithValue("@firstname2", txtfirstname.Value.Trim());
                            cmd.Parameters.AddWithValue("@lastname2", txtsurname.Value.Trim());
                            cmd.Parameters.AddWithValue("@dateofAction2", now.Date);
                            cmd.Parameters.AddWithValue("@long_dateofaction2", now.ToLongDateString());
                            cmd.Parameters.AddWithValue("@servingLGA2", RiversLGAselect.Value.Trim());
                            cmd.Parameters.AddWithValue("@middlename2", txtmiddlename.Value.Trim());
                            cmd.Parameters.AddWithValue("@gradelevel2", txtgrade.Value.Trim());
                            cmd.Parameters.AddWithValue("@status2", "first appointment");
                            cmd.Parameters.AddWithValue("@note", note);

                            int result = cmd.ExecuteNonQuery();

                            //Check if submission was successful
                            if (result > 0)
                            {
                                string title = "Registration was successful";
                                string body = "Do you want to upload staff related documents such as appointment letter, promotion letter, e.t.c now?" +
                                    " <br/> <br/> This can be done later by using the Upload document Menu under the Staff Menu.";
                                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);

                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessMsg", "showContent('Registration was successful','success');", true);

                            }
                            else
                            {
                                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Your Message.');", true);
                            }

                            // Close connection
                            //con.Close();
                        }
                    }
                }
                cmd2.Dispose();
                adapter.Dispose();
                con.Close();
                con.Dispose();
            }
            catch /*(Exception ex)*/
            {
                //lblmsg.Text = "";
                //lblmsg.Text = ex.ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Errormsg", "showContent('Error occured','error');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_RegError", "toastr.error('Something went wrong', 'Error')", true);
            }
        }

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

        }

        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
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