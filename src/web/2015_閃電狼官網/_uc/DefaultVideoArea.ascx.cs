using System;
using System.Collections.Generic;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class _DefaultVideoArea : System.Web.UI.UserControl
{
    public string html = "";
    public int 影片批 = 0; //一批影片顯示兩個
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        DataSet ds = xSQL.查詢_影片清單_前台輪播(ref errCode);
        int total_row = ds.Tables[0].Rows.Count;
        if (total_row > 0)
        {
            DataTable dt影片清單 = ds.Tables[0];

            ds = xSQL.查詢_戰隊清單_前台顯示(ref errCode);
            ArrayList icon_id_array = new ArrayList();
            ArrayList icon_path_array = new ArrayList();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                icon_id_array.Add(ds.Tables[0].Rows[i]["戰隊id"].ToString());
                icon_path_array.Add(ds.Tables[0].Rows[i]["遊戲ICON"].ToString());
            }          
            int index = 0;
            int 影片數 = (dt影片清單.Rows.Count > 6 ? 6 : dt影片清單.Rows.Count);
            影片批 = 影片數 / 2 + (影片數 % 2 == 1 ? 1 : 0);
            int width = 影片數 * 330;
            DefaultVideoBox.Attributes.Add("style", "width:" + width + "px");
            
            for (int i = 0; i < dt影片清單.Rows.Count; i++)
            {
                html = html + "<li>" +
                                    "<div class=\"PageVideoCPic\"><a href=\"VideoPage.aspx?video=" + dt影片清單.Rows[i]["影片id"].ToString() + "\" target=\"_blank\"><img src=\"" + dt影片清單.Rows[i]["影片縮圖"].ToString() + "\" width=\"294\" /></a></div>" +
                                    "<div class=\"PageVideoCDate\">" + dt影片清單.Rows[i]["影片日期"].ToString() + "  " + dt影片清單.Rows[i]["影片時間"].ToString() + "</div>" +
                                    "<div class=\"PageVideoCGameIcon\">" +
                                        "<ul class=\"PageVCGI\">";

                index = icon_id_array.IndexOf(dt影片清單.Rows[i]["遊戲ICON3"].ToString());
                if (index > -1)
                {
                    html = html + "<li><img class=\"sGameIcon\" src=\"" + icon_path_array[index] + "\" /></li>";
                }
                index = icon_id_array.IndexOf(dt影片清單.Rows[i]["遊戲ICON2"].ToString());
                if (index > -1)
                {
                    html = html + "<li><img class=\"sGameIcon\" src=\"" + icon_path_array[index] + "\" /></li>";
                }
                index = icon_id_array.IndexOf(dt影片清單.Rows[i]["遊戲ICON1"].ToString());
                if (index > -1)
                {
                    html = html + "<li><img class=\"sGameIcon\" src=\"" + icon_path_array[index] + "\" /></li>";
                }


                html = html + "</ul>" +
                                    "</div>" +
                                    "<div class=\"PageVideoCTxt\"><a href=\"VideoPage.aspx?video=" + dt影片清單.Rows[i]["影片id"].ToString() + "\" target=\"_blank\">" + dt影片清單.Rows[i]["影片標題"].ToString() + "</a></div>" +
                                "</li>";
            }
        }else
        {
            Panel1.Visible = false;
        }
    }
}