using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class onMobileLineBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string bookNo = "01";
            bookNo = Request.Params["no"] == null ? "01" : Request.Params["no"];
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/_img/bookImg/" + bookNo));
            if(!dir.Exists){
                dir = new DirectoryInfo(Server.MapPath("~/_img/bookImg/01"));
                bookNo = "01";
            }
            FileInfo[] files = dir.GetFiles();
            StringBuilder sb = new StringBuilder();
            foreach (FileInfo file in files)
            {
                //<li><img src="" data-original="../image/bookImg/01/02.jpg" /></li>
                sb.Append("<img src='' data-original='_img/bookImg/" + bookNo + "/" + file.Name + "' style='width:100%;'  />");
                //sb.Append("<img src='_img/bookImg/" + bookNo + "/" + file.Name + "'  style='width:100%;' />");
            }
            bookImg.InnerHtml = sb.ToString();
        }
    }
}