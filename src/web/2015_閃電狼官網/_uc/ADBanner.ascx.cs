using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ADBanner : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        xSQL xSQL = new xSQL();
        int errCode = 0;        
        DataSet ds = xSQL.查詢_廣告輪播_前台顯示(ref errCode);
        string html = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            html = html + "<div id=\"ADBanner_div" + i.ToString() + "\" class=\"ADBanner_div\" style=\"position:relative;top:0;left:0\" >";
            if ((ds.Tables[0].Rows[i]["廣告網址"].ToString() == "") || (ds.Tables[0].Rows[i]["廣告網址"].ToString() == "http://"))
            {
                html = html + "<img src=\"" + ds.Tables[0].Rows[i]["圖片路徑"].ToString() + "\" />" +
                          "</div>";
            }
            else
            {
                html = html + "<a id=\"AD_link\" href=\"" + ds.Tables[0].Rows[i]["廣告網址"].ToString() + "\" target=\"_blank\">" +
                                    "<img src=\"" + ds.Tables[0].Rows[i]["圖片路徑"].ToString() + "\" />" +
                               "</a>" +
                          "</div>";
            }
        }
        if (ds.Tables[0].Rows.Count > 0)
        {
            AD_Banner_temp.Value = html;
            AD_Banner_count.Value = (ds.Tables[0].Rows.Count-1).ToString();
        }
        else
        {
            sliderFrame_AD.Visible = false;
        }
    }
}