using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about : System.Web.UI.Page
{
    public string language = "tc";
    public int provNo = 1;
    public int menuNo = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["l"] == null && Request["p"] == null)
        {
            provNo = 0;
        }

        if (Request["l"] != null)
        {
            switch (Request["l"].ToString())
            {
                case "en": language = "en"; break;
                case "ch": language = "sc"; break;
            }
        }
        if (Request["p"] != null)
        {
            bool t = Int32.TryParse(Request["p"].ToString(), out menuNo);
            if (language.Equals("tc")) { provNo = 0; }
            if (language.Equals("sc")) { provNo = 4; }
            if (language.Equals("en")) { provNo = 8; }
        }
    }
}