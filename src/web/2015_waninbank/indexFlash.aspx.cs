using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class indexFlash : System.Web.UI.Page
{
    public string browser = "電腦版";
    protected Boolean boo = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        string agent = Request.Headers["user-agent"].ToLower().ToString();
        if (Request.Headers["user-agent"] != null)
        {
            if (agent.IndexOf("android") != -1 || agent.IndexOf("iphone") != -1 || agent.IndexOf("ipad") != -1 || agent.IndexOf("windows phone") != -1)
            {
                browser = "手機版";
            }
        }
    }
}