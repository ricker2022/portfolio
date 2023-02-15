using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class PlayerArea : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        DataSet ds = xSQL.查詢_戰隊清單_前台顯示(ref errCode);
        ArrayList P_icon_id = new ArrayList();
        ArrayList P_icon_path = new ArrayList();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            P_icon_id.Add(ds.Tables[0].Rows[i]["戰隊id"].ToString());
            P_icon_path.Add(ds.Tables[0].Rows[i]["遊戲ICON"].ToString());
        }

        ds = xSQL.查詢_選手清單_by前台顯示(ref errCode);
        if (ds.Tables[0].Rows.Count > 0)
        {
            int P_icon_index = 0;
            string html = "";
            string temp_id = "";
            string temp_team = "";
            string id = "";
            string team = "";
            string temp_div = "";
            string div = "";

            Random rand = new Random();
            DataTable result = ds.Tables[0].AsEnumerable().OrderBy(r => rand.Next()).CopyToDataTable();

            for (int i = 0; i < result.Rows.Count; i++)
            {
                temp_div = temp_div + "#player_div" + i.ToString() + ",";
                temp_team = temp_team + result.Rows[i]["戰隊id"].ToString() + ",";
                temp_id = temp_id + result.Rows[i]["選手id"].ToString() + ",";
                html = html + "<li>" +
                        "<div id=\"player_div" + i.ToString() + "\" style=\"background:url('" + result.Rows[i]["首頁輪播圖"].ToString() + "') top center no-repeat;height:575px;display:none;\">" +
                            "<div class=\"dBannerInfo\">" +
                                "<div class=\"dBIIcon\">";
                P_icon_index = P_icon_id.IndexOf(result.Rows[i]["戰隊id"].ToString());
                if (P_icon_index > -1)
                {
                    html = html + "<img src=\"" + P_icon_path[P_icon_index] + "\" />";
                }
                html = html + "</div>" +
                                "<div class=\"dBIName\">" + result.Rows[i]["選手代號"].ToString() + "</div>" +
                                "<div class=\"dBILine\"></div>" +
                                "<div class=\"dBIIntro\">" + result.Rows[i]["基本介紹"].ToString() + "</div>" +
                            "</div>" +
                        "</div>" +
                    "</li>";
            }
            for (int j = 0; j < temp_id.Length - 1; j++)
            {
                id = id + temp_id[j];
            }
            for (int j = 0; j < temp_team.Length - 1; j++)
            {
                team = team + temp_team[j];
            }
            for (int j = 0; j < temp_div.Length - 1; j++)
            {
                div = div + temp_div[j];
            }
            dBanner_temp.Value = html;
            dBanner_temp_id.Value = id;
            dBanner_temp_team.Value = team;
            dBanner_temp_div.Value = div;
        }
    }
}