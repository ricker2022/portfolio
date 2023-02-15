using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class PageTMICVideoArea : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        DataSet ds = xSQL.查詢_選手標記_影片(Convert.ToInt16(Request.QueryString["player"].ToString()), ref errCode);
        string video_id = null; string id = null;
        string video_title = null; string title = null;
        string video_date = null; string date = null;
        string video_img = null; string img = null;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            video_id = video_id + ds.Tables[0].Rows[i]["來源id"].ToString() + ",";
            video_title = video_title + ds.Tables[0].Rows[i]["影片標題"].ToString() + ",";
            video_date = video_date + ds.Tables[0].Rows[i]["影片日期"].ToString() + ",";
            video_img = video_img + ds.Tables[0].Rows[i]["影片縮圖"].ToString() + ",";
        }
        if (video_id != null) 
        {
            for (int i = 0; i < video_id.Length - 1; i++)
            {
                id = id + video_id[i];
            }
            for (int i = 0; i < video_title.Length - 1; i++)
            {
                title = title + video_title[i];
            }
            for (int i = 0; i < video_date.Length - 1; i++)
            {
                date = date + video_date[i];
            }
            for (int i = 0; i < video_img.Length - 1; i++)
            {
                img = img + video_img[i];
            }
            video_id_temp.Value = id;
            video_title_temp.Value = title;
            video_date_temp.Value = date;
            video_img_temp.Value = img;
        }else
        {
            MRVideoArea.Style.Add("display", "none");
        }        
    }
}