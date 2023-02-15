using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class upload1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            UploadFile(sender, e);
        }
    }
    protected void UploadFile(object sender, EventArgs e)
    {
        HttpFileCollection fileCollection = Request.Files;
        string fileType = string.Empty;
        for (int i = 0; i < fileCollection.Count; i++)
        {
            HttpPostedFile upload = fileCollection[i];
            //upload.FileName
            switch (upload.ContentType)
            {
                case "image/jpeg":
                    fileType = ".jpg";
                    break;
                case "image/png":
                    fileType = ".jpg";
                    break;
                   
            }
            if (fileType == string.Empty)
            {

            }else
            {
                string filename = Server.MapPath("~/Uploads/") + Path.GetRandomFileName() + ".jpg";
                upload.SaveAs(filename);
                
            }
               
     
        }
    }
}