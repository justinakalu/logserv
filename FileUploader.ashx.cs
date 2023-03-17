using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Web.SessionState;
using logserv.admin;

namespace logserv
{
    /// <summary>
    /// Summary description for FileUploader
    /// </summary>
    public class FileUploader : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            DateTime now = DateTime.Now;

            //CALL SESSION VARIABLES
            if(context.Session["fileupload_staffuuid"] != null)
            {
                string staffuuid = context.Session["fileupload_staffuuid"].ToString();
                string staff_fileNo = context.Session["fileupload_staff_fileno"].ToString();
                string staff_fullname = context.Session["fileupload_staff_fullname"].ToString();
                string docdescription = context.Session["fileupload_Description"].ToString();

                try
                {
                    SqlConnection con = new SqlConnection(MyClassObjects.ConnectionString);
                    context.Response.ContentType = "text/plain";
                    string FilesPath = HttpContext.Current.Server.MapPath("~/UploadedDoc/");
                    string[] files;
                    string uploadedfiles = "";
                    foreach(string s in context.Request.Files)
                    {
                        HttpPostedFile file = context.Request.Files[s];
                        int fileSizeInBytes = file.ContentLength;
                        string fileName = file.FileName;
                        string fileExtension = file.ContentType;
                        if(!string.IsNullOrEmpty(fileName))
                        {
                            fileExtension = System.IO.Path.GetExtension(fileName);
                            files = System.IO.Directory.GetFiles(FilesPath);
                            uploadedfiles = fileName;
                            string path = HttpContext.Current.Server.MapPath("~/UploadedDoc/") + uploadedfiles;
                            file.SaveAs(path);

                            String query = "INSERT INTO staff_doc (Filename,filepath,staffuuid,staff_fileNo,fullname,docdescription,dateuploaded,long_dateuploaded) " +
                                           "VALUES (@Filename, @filepath,@staffuuid,@staff_fileNo,@fullname,@docdescription,@dateuploaded,@long_dateuploaded)";

                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@Filename", uploadedfiles);
                            cmd.Parameters.AddWithValue("@filepath", "~/UploadedDoc/" + uploadedfiles);
                            cmd.Parameters.AddWithValue("@staffuuid", staffuuid);
                            cmd.Parameters.AddWithValue("@staff_fileNo", staff_fileNo);
                            cmd.Parameters.AddWithValue("@fullname", staff_fullname);
                            cmd.Parameters.AddWithValue("@docdescription", docdescription);
                            cmd.Parameters.AddWithValue("@dateuploaded", now.Date);
                            cmd.Parameters.AddWithValue("@long_dateuploaded", now.ToLongDateString());
                            con.Open();
                            cmd.ExecuteNonQuery();
                            // con.Close();                  
                        }
                    }
                    context.Response.Write(uploadedfiles);
                }
                catch(Exception ex)
                {
                    context.Response.Write("ERROR: " + ex.Message);
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}