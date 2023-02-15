using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization.Json;
using System.Web.Script.Serialization;
public partial class CalendarEvent : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.Params["date"] != null)
        {

            Response.Write(HttpUtility.HtmlEncode("November 4, 2013 00:00:00$KR初賽<br/>第一條<br/>第二條|November 3, 2013 00:00:00$KR初賽 第一條 第二條"));
        }
        else if(Request.Params["banner"]!=null)
        {
            string bannerString = "<ul class='bjqs'>" +
                "<li><a href='" + "#" + "'><img src='" + "../../_img/navBanner/banner01.jpg" + "' title='" + "Automatically generated caption 1" + "' alt='" + "alt1" + "' /></a></li>" +
              "<li><a href='" + "#" + "'><img src='" + "../../_img/navBanner/banner02.jpg" + "' title='" + "Automatically generated caption 2" + "' alt='" + "alt2" + "' /></a></li>" +
            "<li><a href='" + "#" + "'><img src='" + "../../_img/navBanner/banner03.jpg" + "' title='" + "Automatically generated caption 3" + "' alt='" + "alt3" + "' /></a></li>" +
            "<li><a href='" + "#" + "'><img src='" + "../../_img/navBanner/banner01.jpg" + "' title='" + "Automatically generated caption 4" + "' alt='" + "alt4" + "' /></a></li>" +
            "<li><a href='" + "#" + "'><img src='" + "../../_img/navBanner/banner02.jpg" + "' title='" + "Automatically generated caption 5" + "' alt='" + "alt5" + "' /></a></li>" +
         "</ul>";
            Response.Write(bannerString);
        }
        else
        {
        ////    string strFileName = Path.GetFileName(Request.Files[0].FileName);
        ////    string strSaveLocation = Server.MapPath("~/Uploads/") + strFileName;
      
        ////    Request.Files[0].SaveAs(strSaveLocation);
        ////    Response.ContentType = "application/json";
        ////    string aaa = "{files:[{url:'http://localhost:49984/Uploads/" 
        ////        + strFileName + "',thumbnailUrl:'http://lh6.ggpht.com/N65Lg6RfZvG06GFOhY-psUUmcm-ZheaG6UZMvx2t1dXaT6yIiJd3QPjRmqngxsBXarrX-FSliQeZJwGGcRZa-M07COIsP1UN=s80',name:'Tulips.jpg',type:'image/jpeg',size:620888,deleteUrl:'http://localhost:49984/Uploads/"
        ////        + strFileName+"?delete=true',deleteType:DELETE}]}";
        ////    Response.Write(aaa);


        ////  string contentType=  Request.Files[0].ContentType;
        ////  string url = strSaveLocation;
       
        //////    files rlt = new files() { id = id, name = name };
        ////  //  DataContractJsonSerializer json = new DataContractJsonSerializer(rlt.GetType());
        ////  //  json.WriteObject(context.Response.OutputStream, rlt);

        //    HttpFileCollection fileCollection = Request.Files;

        //    UploadFile(fileCollection);
        }

    }

    protected void UploadFile(HttpFileCollection fileCollection)
    {
       // HttpFileCollection fileCollection = Request.Files;
        for (int i = 0; i < fileCollection.Count; i++)
        {
            HttpPostedFile upload = fileCollection[i];
            string filename = Server.MapPath("~/Uploads/") + Path.GetRandomFileName();
            upload.SaveAs(filename);
        }
    }
     class files
    {
        public string url { get; set; }
        public string thumbnailUrl { get; set; }
        public string name { get; set; }
        public string type { get; set; }
        public int size { get; set; }

        public string deleteUrl { get; set; }
        public string deleteType { get; set; }
       
        
    }
  
}