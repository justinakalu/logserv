using HtmlAgilityPack;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.IO;
using System.Text;
using System.Web;

namespace logserv.admin
{
    public partial class confirmation_letter : System.Web.UI.Page
    {
        string confirmation_filename = "trial";
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


            string baseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

            //ASSIGNING VALUES FROM SESSION VARIABLES
            //For First Letter
            logoimg.Src = baseUrl + "/File_ext_Images/riversLogo2.png";
            lblDatePrepared.Text = Session["confirmation_preparationdate_long"].ToString();
            lblStaffFileNo.Text = Session["confirmation_staff_fileno"].ToString();
            lblStaffName.Text = Session["confirmation_staff_fullname"].ToString().ToUpper();
            lblServingLGA.Text = Session["confirmation_servinglga"].ToString() + " " + "Local Government Council";
            lblServingLGA2.Text = Session["confirmation_servinglga"].ToString() + " " + "Local Government Council";
            lblConfirmationApplicationDate.Text = Session["confirmation_application_date_long"].ToString();
            lblDesignation.Text = Session["confirmation_txtdesignation"].ToString();
            lblSecretaryName.Text = Session["confirmation_secretary"].ToString();
            lblServingLGA3.Text = Session["confirmation_servinglga"].ToString() + " " + "Local Government Council";
            lblStaffName2.Text = Session["confirmation_staff_fullname"].ToString().ToUpper();
            lblSecretaryName2.Text = Session["confirmation_secretary"].ToString();
            lblConfirmationEffectiveDate.Text = Session["Confirmation_effective_date_long"].ToString();


            //For Second Letter
            logoimgLetter2.Src = baseUrl + "/File_ext_Images/riversLogo2.png";
            lblDatePreparedLetter2.Text = Session["confirmation_preparationdate_long"].ToString();
            lblStaffFileNoLetter2.Text = Session["confirmation_staff_fileno"].ToString();
            lblStaffNameLetter2.Text = Session["confirmation_staff_fullname"].ToString().ToUpper();
            lblServingLGALetter2.Text = Session["confirmation_servinglga"].ToString() + " " + "Local Government Council";
            lblConfirmationApplicationDateLetter2.Text = Session["confirmation_application_date_long"].ToString();
            lblDesignationLetter2.Text = Session["confirmation_txtdesignation"].ToString();
            lblSecretaryName2Letter2.Text = Session["confirmation_secretary"].ToString();
            lblConfirmationEffectiveDateLetter2.Text = Session["Confirmation_effective_date_long"].ToString();

        }
        protected void Usersignout(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {


            //FOR FIRST LETTER
            HtmlNode.ElementsFlags["img"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["input"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["hr"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["br"] = HtmlElementFlag.Closed;

            HtmlDocument doc = new HtmlDocument();
            doc.OptionFixNestedTags = true;
            doc.LoadHtml(selectedhtml1.Value);
            selectedhtml1.Value = doc.DocumentNode.OuterHtml;
            string filename = lblStaffName.Text + " Confirmation Letter";



            using (MemoryStream stream = new MemoryStream())
            {
                Encoding unicode = Encoding.UTF8;
                StringReader sr = new StringReader(selectedhtml1.Value);
                Document pdfDoc = new Document(PageSize.A4, 30f, 30f, 40f, 10f);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);
                pdfDoc.Open();
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                pdfDoc.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=" + filename + ".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(stream.ToArray());
                //Response.End();
                //Response.Flush();
                Response.Write("<script type='text/javaScript'> window.location.href = 'upload_confirmation.aspx'; </script>");
            }

        }

        protected void btnExport_Click2(object sender, EventArgs e)
        {

            //FOR SECOND LETTER
            HtmlNode.ElementsFlags["img"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["input"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["hr"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["br"] = HtmlElementFlag.Closed;

            HtmlDocument doc2 = new HtmlDocument();
            doc2.OptionFixNestedTags = true;
            doc2.LoadHtml(selectedhtml2.Value);
            selectedhtml2.Value = doc2.DocumentNode.OuterHtml;
            string filename2 = lblStaffNameLetter2.Text + " Confirmation Letter";

            using (MemoryStream stream2 = new MemoryStream())
            {
                Encoding unicode = Encoding.UTF8;
                StringReader sr2 = new StringReader(selectedhtml2.Value);
                Document pdfDoc2 = new Document(PageSize.A4, 30f, 30f, 50f, 10f);
                PdfWriter writer2 = PdfWriter.GetInstance(pdfDoc2, stream2);
                pdfDoc2.Open();
                XMLWorkerHelper.GetInstance().ParseXHtml(writer2, pdfDoc2, sr2);
                pdfDoc2.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=" + filename2 + ".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(stream2.ToArray());
                Response.End();
                Response.Flush();
            }

        }

        protected void btncontinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("upload_confirmation.aspx");
        }

    }
}