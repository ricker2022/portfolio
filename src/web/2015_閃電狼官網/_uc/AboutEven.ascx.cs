using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class _AboutEven : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        string html = "";
        DataSet ds = xSQL.查詢_事件清單_for大事件(ref errCode);
        
        int count = 0;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string 事件日期 = ds.Tables[0].Rows[i]["事件日期"].ToString();
            string[] date = 事件日期.Split('/');
            string month = new DateTime(2014, Convert.ToInt16(date[1]), 11).ToString("MMM", new CultureInfo("en-US"));
            //Response.Write(date[2] + "/" + date[1] + "/" + date[0] + "<BR>");
            html = html + "<div class=\"item\" data-id=\"" + date[2] + "/" + date[1] + "/" + date[0] + "\" data-description=\"" + ds.Tables[0].Rows[i]["事件標題"].ToString() + "\">" +
                                   "<img src=\"" + ds.Tables[0].Rows[i]["事件圖片"].ToString() + "\" alt=\"\"/>" +
                                   "<h2>" + month + ", " + date[2] + "</h2>" +
                                   "<span style=\"height:70px;font-size:12px;margin:0px 20px 15px 20px;overflow:hidden;text-align:justify;font-family:'Microsoft JhengHei';line-height:1.5;\">" + ds.Tables[0].Rows[i]["事件簡介"].ToString() + "</span>" +
                                   "<div class=\"read_more\" data-id=\"" + date[2] + "/" + date[1] + "/" + date[0] + "\">Read more</div>" +
                               "</div>" +
                               "<div class=\"item_open\" data-id=\"" + date[2] + "/" + date[1] + "/" + date[0] + "\" data-access=\"_uc/TimeLine/content.aspx?id=" + ds.Tables[0].Rows[i]["事件id"].ToString() + "\">" +
                                   "<div class=\"item_open_content\">" +
                                       "<img class=\"ajaxloader\" src=\"_uc/TimeLine/images/timeline/loadingAnimation.gif\" alt=\"\" />" +
                                   "</div>" +
                               "</div>";
            count++;
        }
        if(count>0)
        {
            temp_html.Value = html;
            no_data.Visible = false;
        }else
        {
            timeline.Visible = false;
            no_data.Visible = true;
        }
    }
}