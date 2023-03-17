using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class confirmation : System.Web.UI.Page
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

            SqlCommand command = new SqlCommand("SELECT * FROM Staff_Reg WHERE appointmentdate <= DATEADD(year,-2,GETDATE()) AND current_level >= '7' AND confirmed='No'", con);
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


        protected void Btncontinue_Click(object sender, EventArgs e)
        {
            try
            {
                string staffuuid = Request.Form["txtuuid"]; // Hidden input control
                                                            // 
                string staffimgUrl = Request.Form["txturl"]; // Hidden input control

                string staffqualification = Request.Form["txtqualification"]; // Hidden input control

                DateTime Confirmation_preparation_date_short = DateTime.Parse(daterangepicker.Value);

                DateTime Confirmation_application_date_short = DateTime.Parse(staffconfirmationApplicationdate.Value);

                DateTime DateofJobApplication_short = DateTime.Parse(Request.Form["txtDateofJobApplicationShort"]); // Hidden input control

                DateTime DateofFirstAppointment_short = DateTime.Parse(Request.Form["txtDateofFirstAppointmentshort"]); // Hidden input control



                String query2 = "UPDATE Staff_Reg SET confirmed = @confirmed, confirmation_date=@confirmation_date, long_confirmation_date=@long_confirmation_date, " +
                    "Confirmation_effective_date=@Confirmation_effective_date, Confirmation_effective_date_long=@Confirmation_effective_date_long, confirmed_by_id=@confirmed_by_id, " +
                    "confirmed_by_name=@confirmed_by_name, confirmation_application_date=@confirmation_application_date, " +
                    "confirmation_application_date_long=@confirmation_application_date_long Where uuid = @uuid";

                con.Open();

                DateTime effectivedate = DateofFirstAppointment_short.AddYears(2);// APPOINTMENT DATE PLUS 2 YEARS
                SqlCommand cmd = new SqlCommand(query2, con);

                cmd.Parameters.AddWithValue("@uuid", staffuuid);
                cmd.Parameters.AddWithValue("@confirmed", "Yes");
                cmd.Parameters.AddWithValue("@confirmation_date", Confirmation_preparation_date_short);
                cmd.Parameters.AddWithValue("@long_confirmation_date", Confirmation_preparation_date_short.ToLongDateString());
                cmd.Parameters.AddWithValue("@Confirmation_effective_date", effectivedate);
                cmd.Parameters.AddWithValue("@Confirmation_effective_date_long", effectivedate.ToLongDateString());
                cmd.Parameters.AddWithValue("@confirmed_by_id", userid);
                cmd.Parameters.AddWithValue("@confirmed_by_name", lblprofilename.Text);
                cmd.Parameters.AddWithValue("@confirmation_application_date", Confirmation_application_date_short);
                cmd.Parameters.AddWithValue("@confirmation_application_date_long", Confirmation_application_date_short.ToLongDateString());


                int result = cmd.ExecuteNonQuery();
                con.Close();

                //Check submission was successful
                if (result > 0)
                {
                    Session["confirmation_staffuuid"] = staffuuid;

                    Session["confirmation_preparationdate_short"] = Confirmation_preparation_date_short;

                    Session["confirmation_preparationdate_long"] = Confirmation_preparation_date_short.ToLongDateString();

                    Session["confirmation_staffDateofFirstAppointment_short"] = DateofFirstAppointment_short;

                    Session["confirmation_staffDateofFirstAppointment_long"] = Request.Form["txtDateofFirstAppointmentlong"]; // Hidden input control

                    Session["confirmation_DateofJobApplication_short"] = DateofJobApplication_short;

                    Session["confirmation_DateofJobApplication_Long"] = Request.Form["txtDateofJobApplicationLong"]; // Hidden input control

                    Session["confirmation_secretary"] = txtsecretary.Value.Trim();

                    Session["confirmation_txtdesignation"] = txtdesignation.Value.Trim();

                    Session["confirmation_staff_fileno"] = Request.Form["txtfileno"]; // Hidden input control

                    Session["confirmation_staff_fullname"] = Request.Form["txtfullname"]; // Hidden input control

                    Session["confirmation_staffgender"] = Request.Form["txtgender"]; // Hidden input control

                    Session["confirmation_servinglga"] = Request.Form["txtservinglga"]; // Hidden input control

                    Session["confirmation_application_date_short"] = Confirmation_application_date_short;

                    Session["confirmation_application_date_long"] = Confirmation_application_date_short.ToLongDateString();

                    Session["Confirmation_effective_date_short"] = effectivedate;

                    Session["Confirmation_effective_date_long"] = effectivedate.ToLongDateString();

                    Session["Confirmation_staffimgurl"] = staffimgUrl;

                    Session["Confirmation_staffqualification"] = staffqualification;

                    Response.Redirect("confirmation_letter.aspx");
                }
                else
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Your Message.');", true);
                }
            }
            catch (Exception ex)
            {
                //lblmsg.Text = "";
                //lblmsg.Text = ex.ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Errormsg", "showContent('Error occured','error');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_RegError", "toastr.error('Something went wrong', 'Error')", true);
            }


        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "viewstaff")
            {
                string uuid = e.CommandArgument.ToString();
                //Session.Add("profile_staffuuid", uuid);
                Session["profile_staffuuid"] = uuid;
                Response.Redirect("profile.aspx");
            }
        }
    }
}