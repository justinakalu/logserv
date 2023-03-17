using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace logserv.admin
{
    public partial class upload_confirmation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);

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

            loadstaffdetails();


            if (!IsPostBack)
            {
                // GeneratePDF();
            }
        }

        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void ClearControls(object sender, EventArgs e)
        {
            //Redirect.
            Response.Redirect("confirmed.aspx");
        }

        //protected void GeneratePDF()
        //{
        //    //SESSIONS FROM CONFIRMATION PAGE
        //    string newfilename = Session["pdf_filename"].ToString();
        //    string htmlbody = Session["htmlbody"].ToString();

        //    //FOR FIRST LETTER
        //    HtmlNode.ElementsFlags["img"] = HtmlElementFlag.Closed;
        //    HtmlNode.ElementsFlags["input"] = HtmlElementFlag.Closed;
        //    HtmlNode.ElementsFlags["hr"] = HtmlElementFlag.Closed;
        //    HtmlNode.ElementsFlags["br"] = HtmlElementFlag.Closed;

        //    HtmlDocument doc = new HtmlDocument();
        //    doc.OptionFixNestedTags = true;
        //    doc.LoadHtml(htmlbody);
        //    htmlbody = doc.DocumentNode.OuterHtml;
        //    string filename = newfilename + " Confirmation Letter";



        //    using (MemoryStream stream = new MemoryStream())
        //    {
        //        Encoding unicode = Encoding.UTF8;
        //        StringReader sr = new StringReader(htmlbody);
        //        Document pdfDoc = new Document(PageSize.A4, 30f, 30f, 40f, 10f);
        //        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);
        //        pdfDoc.Open();
        //        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
        //        pdfDoc.Close();

        //        Response.ContentType = "application/pdf";
        //        Response.AddHeader("content-disposition", "attachment;filename=" + filename + ".pdf");
        //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //        Response.BinaryWrite(stream.ToArray());
        //        //Response.End();
        //        HttpContext.Current.ApplicationInstance.CompleteRequest();
        //        Response.Flush();
        //        //Response.Redirect("sss.aspx");
        //    }
        //}

        protected void loadstaffdetails()
        {
            string staffuuid = Session["confirmation_staffuuid"].ToString();
            lblfullname.Text = Session["confirmation_staff_fullname"].ToString();
            lblqualification.Text = Session["Confirmation_staffqualification"].ToString();
            imgstaff.ImageUrl = Session["Confirmation_staffimgurl"].ToString();
            staffFileNo.Text = Session["confirmation_staff_fileno"].ToString();

            //Clear the sessions before adding values to them to avoid duplicate value
            Session.Remove("fileupload_staffuuid");
            Session.Remove("fileupload_staff_fileno");
            Session.Remove("fileupload_staff_fullname");
            Session.Remove("fileupload_Description");

            //Create session for FileUploader.ashx file
            Session.Add("fileupload_staffuuid", staffuuid);
            Session.Add("fileupload_staff_fileno", staffFileNo.Text);
            Session.Add("fileupload_staff_fullname", lblfullname.Text);
            Session.Add("fileupload_Description", "confirmation");

        }

    }
}