using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class _uc_VideoArea : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        DataSet ds = xSQL.查詢_戰隊清單_前台顯示(ref errCode);
        ArrayList img_id = new ArrayList();
        ArrayList img_path = new ArrayList();
        for (int i = 0; i < ds.Tables[0].Rows.Count;i++ )
        {
            img_id.Add(ds.Tables[0].Rows[i]["戰隊id"].ToString());
            img_path.Add(ds.Tables[0].Rows[i]["遊戲ICON"].ToString());
        }

        ds = xSQL.查詢_影片清單_前台輪播(ref errCode);

        string id_temp = null; string id = null;
        string img_temp = null; string img = null;
        string date_temp = null; string date = null;
        string info_temp = null; string info = null;
        string icon1_temp = null; string icon1 = null;
        string icon2_temp = null; string icon2 = null;
        string icon3_temp = null; string icon3 = null;
        int img_index = 0;
        int j = 0;
        int count = 0;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (j < 5)
            {
                id_temp = id_temp + ds.Tables[0].Rows[i]["影片id"].ToString() + ",";
                img_temp = img_temp + ds.Tables[0].Rows[i]["影片縮圖"].ToString() + ",";
                date_temp = date_temp + ds.Tables[0].Rows[i]["影片日期"].ToString() + ",";
                info_temp = info_temp + ds.Tables[0].Rows[i]["影片標題"].ToString() + ",";
                img_index = img_id.IndexOf(ds.Tables[0].Rows[i]["遊戲ICON1"].ToString());
                if (img_index > -1)
                {
                    icon1_temp = icon1_temp + img_path[img_index] + ",";
                }
                else
                {
                    icon1_temp = icon1_temp + ",";
                }
                img_index = img_id.IndexOf(ds.Tables[0].Rows[i]["遊戲ICON2"].ToString());
                if (img_index > -1)
                {
                    icon2_temp = icon2_temp + img_path[img_index] + ",";
                }
                else
                {
                    icon2_temp = icon2_temp + ",";
                }
                img_index = img_id.IndexOf(ds.Tables[0].Rows[i]["遊戲ICON3"].ToString());
                if (img_index > -1)
                {
                    icon3_temp = icon3_temp + img_path[img_index] + ",";
                }
                else
                {
                    icon3_temp = icon3_temp + ",";
                }
            }
            j++;
            count++;
        }
        if (count > 0)
        {
            for (int i = 0; i < id_temp.Length - 1; i++)
            {
                id = id + id_temp[i];
            }
            for (int i = 0; i < img_temp.Length - 1; i++)
            {
                img = img + img_temp[i];
            }
            for (int i = 0; i < date_temp.Length - 1; i++)
            {
                date = date + date_temp[i];
            }
            for (int i = 0; i < info_temp.Length - 1; i++)
            {
                info = info + info_temp[i];
            }
            for (int i = 0; i < icon1_temp.Length - 1; i++)
            {
                icon1 = icon1 + icon1_temp[i];
            }
            for (int i = 0; i < icon2_temp.Length - 1; i++)
            {
                icon2 = icon2 + icon2_temp[i];
            }
            for (int i = 0; i < icon3_temp.Length - 1; i++)
            {
                icon3 = icon3 + icon3_temp[i];
            }
            V_id_string.Value = id;
            V_img_string.Value = img;
            V_date_string.Value = date;
            V_info_string.Value = info;
            V_icon1_string.Value = icon1;
            V_icon2_string.Value = icon2;
            V_icon3_string.Value = icon3;
        }else
        {
            VideoArea.Visible = false;
        }
    }
}