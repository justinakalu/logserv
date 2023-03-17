using ClassData;
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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);
        DataTable GeneralDT;
        int TotalStaffCount, DeadstaffCount, retiredStaff, promotedStaff, transferredStaff, inServiceStaff, outOfServiceStaff = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            //check login
            if (Session["username"] != null || Session["userimgurl"] != null)
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


            if (!Page.IsPostBack)
            {
                //.....LOAD CONTROLS.....
                load_details();


                //...For Chart...

                //if all values labels are not displaying, set the interval for AxisX or AxisY
                Chart1.ChartAreas[0].AxisX.Interval = 1;

                // to change the Label font style set the font
                Chart1.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10f);

                ClassObject classobject = new ClassObject();
                classobject.OpenConnection();
                Chart1.DataSource = classobject.ShowDataInGridView("Select count(servingLGA_Chart) AS NEWCOUNT, servingLGA_Chart From Staff_Reg GROUP BY servingLGA_Chart");
            }
        }

        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void load_details()
        {
            con.Open();

            SqlCommand command = new SqlCommand("Select * from Staff_reg", con);
            command.CommandType = CommandType.Text;


            // For getting total of Death, Out of service, etc
            using (SqlDataAdapter sda = new SqlDataAdapter(command))
            {
                using (DataTable FromRegDt = new DataTable())
                {
                    sda.Fill(FromRegDt);

                    if (FromRegDt.Rows.Count > 0)
                    {
                        //get total number of staff including dead and retired ones
                        TotalStaffCount = FromRegDt.Rows.Count;

                        //get number of death
                        DeadstaffCount = FromRegDt.Select("dead = 'Yes'").Length;

                        //get number of retired
                        retiredStaff = FromRegDt.Select("retired = 'Yes'").Length;
                    }

                    lblTotalNoOfStaff.Text = TotalStaffCount.ToString(); //for total number of staff including dead and retired ones
                    lblNoOfDeath.Text = DeadstaffCount.ToString(); //for number of death
                    lblNoOfRetiredStaff.Text = retiredStaff.ToString();//for number of retired
                }
            }


            //............FOR GETTING THE NO OF PROMOTED AND TRANSFERRED STAFF.....................

            SqlCommand command2 = new SqlCommand("Select * from service_Table", con);
            command2.CommandType = CommandType.Text;
            using (SqlDataAdapter sda = new SqlDataAdapter(command2))
            {
                using (DataTable PromAndTransDT = new DataTable())
                {
                    sda.Fill(PromAndTransDT);


                    //--------------------------------------------------------------------------------------------------------------------

                    // FOR PROMOTION
                    if (PromAndTransDT.Rows.Count > 0)
                    {


                        // Clone the schema to the promotedDt table.
                        DataTable promotedDt = PromAndTransDT.Clone();

                        //   Get all promoted records using Select( ) method and put them in promoted datable. 
                        foreach (DataRow row in PromAndTransDT.Select("status = 'Promoted'"))
                        {
                            promotedDt.ImportRow(row);
                        }

                        if (promotedDt.Rows.Count > 0)
                        {
                            //remove duplicate fileno numbers to get exact number of promoted staff               
                            DataTable promotedDistinctDT = (from rows in promotedDt.AsEnumerable()
                                                            group rows by new { ColA = rows["fileno"] } into grp
                                                            select grp.First()).CopyToDataTable();
                            promotedStaff = promotedDistinctDT.Rows.Count;
                            lblNoOfPromotion.Text = promotedStaff.ToString();
                        }
                        else
                        {
                            lblNoOfPromotion.Text = "0";
                        }

                        //---------------------------------------------------------------------------------------------------------------------

                        // FOR TRANSFERS
                        // Clone the schema to the transferDt table.
                        DataTable transferDt = PromAndTransDT.Clone();

                        //   Get all transferred records using Select( ) method and put them in transfer datable. 
                        foreach (DataRow row in PromAndTransDT.Select("status = 'Transferred'"))
                        {
                            transferDt.ImportRow(row);
                        }

                        if (transferDt.Rows.Count > 0)
                        {
                            //remove duplicate fileno numbers to get exact number of transferred staff               
                            DataTable transferDistinctDT = (from rows in transferDt.AsEnumerable()
                                                            group rows by new { ColA = rows["fileno"] } into grp
                                                            select grp.First()).CopyToDataTable();


                            transferredStaff = transferDistinctDT.Rows.Count;
                            lblNoTransfered.Text = transferredStaff.ToString();
                        }
                        else
                        {
                            lblNoTransfered.Text = "0";
                        }

                    }
                }
            }
            con.Close();


            //OTHER CALCULATIONS

            outOfServiceStaff = DeadstaffCount + retiredStaff; //For out of service staff
            lblOutOfService.Text = outOfServiceStaff.ToString();

            inServiceStaff = TotalStaffCount - outOfServiceStaff; //For serving staff
            lblinService.Text = inServiceStaff.ToString();

        }

        private DataTable RemoveDuplicatesRecords(DataTable dt)
        {
            //Returns just 5 unique rows
            var UniqueRows = dt.AsEnumerable().Distinct(DataRowComparer.Default);
            DataTable dt2 = UniqueRows.CopyToDataTable();
            return dt2;
        }
    }
}
