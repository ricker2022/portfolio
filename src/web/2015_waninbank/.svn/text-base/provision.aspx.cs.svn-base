using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class provision : System.Web.UI.Page
{
    public string language = "";
    public bool provCtrl = false;
    public int provNo = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["l"] != null){
            switch (Request["l"].ToString())
            {
                case "en": language = "English"; break;
                case "ch": language = "简体中文"; break;
            }
        }
        if(Request["p"] != null ){
            provCtrl = true;
            bool t = Int32.TryParse(Request["p"].ToString(), out provNo);
            if (t && provNo > 4)
            {
                provNo = 1;
            }
            else if (provNo == 4 && language.Equals("English"))
            {
                provNo = 1;
            }
        }
        
    }
}