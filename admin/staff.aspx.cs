using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class staff : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);
        string imgurl;

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

            SqlCommand command = new SqlCommand("SELECT * FROM Staff_Reg", con);
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
            if(e.Row.RowType == DataControlRowType.Header)
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

        protected void Btnupdate_Click(object sender, EventArgs e)
        {


            //get the file name of the posted image
            string imgName = Guid.NewGuid().ToString("N").Substring(0, 15) + fileupload.FileName;

            //sets the image path
            string imgPath = "../ImageStorage/" + imgName;

            //get the size in bytes that
            int imgSize = fileupload.PostedFile.ContentLength;

            //CHECK NEW IMAGE UPLOAD TO DETERMINE IMAGE URL
            if(fileupload.PostedFile != null && fileupload.PostedFile.FileName != "")

            {
                //There is a new image upload
                if(fileupload.PostedFile.ContentLength > 10485760 /*this is in byte but equal to 5mb*/)
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_image", "toastr.error('Image file is too big', 'Error')", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "EroorUpload", "showContent('Image file is too big','Error');", true);
                }
                else
                {
                    //then save it to the Folder
                    fileupload.SaveAs(Server.MapPath(imgPath));
                    //Image1.ImageUrl = "~/" + imgPath;
                    imgurl = imgPath;
                }
            }
            else
            {
                //There is no new image upload. Retain the old image URL
                string newurl = Request.Form["txturl"];
                imgurl = newurl;
            }


            //Calculate for age
            //.....................
            DateTime DOB = DateTime.Parse(daterangepicker.Value);
            DateTime Newdate = DateTime.Now;

            DateTime tmp = DOB;
            int years = -1;
            while(tmp < Newdate)
            {
                years++;
                tmp = tmp.AddYears(1);
            }

            int age = years;


            //Send to Database
            //--------------------------------------------------------------------------------

            string gender;
            DateTime now = DateTime.Now;
            DateTime dob = DateTime.Parse(daterangepicker.Value);

            if(maleRadio.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "Female";
            }

            //GET AND RETAIN THE VALUE OF THE SELECTED LGA AND UUID
            var lgaValue = "";
            lgaValue = Request.Form[LGASelect.UniqueID];

            string newuuid = Request.Form["txtuuid"];


            String query2 = "UPDATE Staff_Reg SET fileNo = @fileNo, surname=@surname, firstname=@firstname, middlename=@middlename," +
                "qualification=@qualification, homeaddress=@homeaddress, imageurl=@imageurl, dateofbirth=@dateofbirth," +
                "stateoforigin=@stateoforigin, originLGA=@originLGA, gender=@gender, long_dateofbirth=@long_dateofbirth, age=@age Where uuid = @uuid;" +

                "UPDATE service_Table SET fileNo = @fileNo, lastname = @surname, firstname = @firstname, middlename = @middlename Where staff_uuid = @uuid;" +

                "UPDATE staff_doc SET staff_fileNo = @fileNo, fullname = @fullname Where staffuuid = @uuid";

            con.Open();

            SqlCommand cmd = new SqlCommand(query2, con);

            cmd.Parameters.AddWithValue("@uuid", newuuid);
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
            cmd.Parameters.AddWithValue("@imageurl", imgurl);
            cmd.Parameters.AddWithValue("@age", age);

            cmd.Parameters.AddWithValue("@fullname", txtfirstname.Value.Trim() + " " + txtsurname.Value.Trim() + " " + txtmiddlename.Value.Trim());

            int result = cmd.ExecuteNonQuery();
            con.Close();

            //Check submission was successful
            if(result > 0)
            {
                Bindgrid();

                string title = "UPDATE";
                string body = "Record was successfully updated";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup1", "ShowPopup('" + title + "', '" + body + "');", true);
            }
            else
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Your Message.');", true);
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if(e.CommandName == "deletestaff")
            {

                string uuid = e.CommandArgument.ToString();
                con.Open();

                SqlCommand cmd = new SqlCommand("delete from Staff_Reg where uuid=@uuid; delete from service_Table where staff_uuid=@uuid; delete from staff_doc where staffuuid=@uuid", con);
                cmd.Parameters.AddWithValue("@uuid", uuid);
                int i = cmd.ExecuteNonQuery();
                con.Close();

                if(i > 0)
                {
                    string title = "SUCCESSFUL RECORD DELETION";
                    string body = "Staff records were permanently deleted";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup3", "ShowPopup('" + title + "', '" + body + "');", true);

                    Bindgrid();
                }
                else
                {
                    string title = "RECORD DELETION";
                    string body = "Record was not deleted";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup4", "ShowPopup2('" + title + "', '" + body + "');", true);
                }

            }
            else if(e.CommandName == "viewstaff")
            {
                string uuid = e.CommandArgument.ToString();
                //Session.Add("profile_staffuuid", uuid);
                Session["profile_staffuuid"] = uuid;
                Response.Redirect("profile.aspx");
            }
        }
    }
}