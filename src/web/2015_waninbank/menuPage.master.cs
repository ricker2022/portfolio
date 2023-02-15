using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class menuPage : System.Web.UI.MasterPage
{
    public string requestID ="";
    public string nowID = "";
    public string browser = "電腦版";
    protected Boolean boo = true;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            nowID = "About";
        }
        else
        {
            nowID = "";
        }
        requestID = Request.FilePath;
        nowID = requestID.Split('/')[requestID.Split('/').Length - 1].Split('.')[0];
       
    }
}
