using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class onLineBook : System.Web.UI.Page
{
    public string bookNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["no"] != null && !"".Equals(Request.Params["no"]))
        {
            string innerHtml = "";
            if (Request.Params["no"] != null && !"".Equals(Request.Params["no"]))
            {
                bookNo = Request.Params["no"];
            }
            else {
                bookNo = "01";
            }

            DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/image/bookImg/" + bookNo));
            FileInfo[] files = dir.GetFiles();
            
            foreach (FileInfo file in files)
            {
                if (file.Name.Substring(0,2).Equals("01"))
                {
                    bigImg.InnerHtml = "<img src='image/bookImg/" + bookNo + "/" + file.Name + "'/>";
                }
                innerHtml += "<li><a><img src='' lazy='image/bookImg/" + bookNo + "/" + file.Name + "' class='bookImg' /></a></li>";
            }
            bookUl.InnerHtml = innerHtml;
        }
        
    }
}