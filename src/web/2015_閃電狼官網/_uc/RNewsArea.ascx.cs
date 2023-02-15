using System;
using System.Collections.Generic;
using System.Collections;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class _uc_RNewsArea : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;

        DataSet ds = xSQL.查詢_戰隊清單_前台顯示(ref errCode);
        ArrayList icon_id_array = new ArrayList();
        ArrayList icon_path_array = new ArrayList();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            icon_id_array.Add(ds.Tables[0].Rows[i]["戰隊id"].ToString());
            icon_path_array.Add(ds.Tables[0].Rows[i]["遊戲ICON"].ToString());
        }
        string[] id = { "", "" };
        string[] 新聞標題 = { "", "" };
        string[] 新聞縮圖 = { "", "" };
        string[] 新聞日期 = { "", "" };
        string[] 新聞內文 = { "", "" };
        string[] 遊戲ICON1 = { "", "" };
        string[] 遊戲ICON2 = { "", "" };
        string[] 遊戲ICON3 = { "", "" };
        ds = xSQL.查詢_新聞清單_前台顯示by頁數(1, ref errCode);
        int icon_index = 0;
        int count = ds.Tables[0].Rows.Count;
        string news = null;
        for (int i = 0; i < ds.Tables[0].Rows.Count;i++ )
        {
            if (i < 2)
            {
                id[i] = ds.Tables[0].Rows[i]["新聞id"].ToString();
                新聞標題[i] = ds.Tables[0].Rows[i]["新聞標題"].ToString();
                新聞縮圖[i] = ds.Tables[0].Rows[i]["新聞縮圖"].ToString();
                新聞日期[i] = ds.Tables[0].Rows[i]["新聞日期"].ToString();
                news = HttpUtility.HtmlDecode(ds.Tables[0].Rows[i]["新聞內文"].ToString());
                news = Regex.Replace(news, "<.*?>", string.Empty);
                news = news.Replace("&nbsp;", "");
                新聞內文[i] = news;
                icon_index = icon_id_array.IndexOf(ds.Tables[0].Rows[i]["遊戲ICON1"].ToString());
                if (icon_index == -1)
                {
                    遊戲ICON1[i] = "";
                }
                else
                {
                    遊戲ICON1[i] = icon_path_array[icon_index].ToString();
                }

                icon_index = icon_id_array.IndexOf(ds.Tables[0].Rows[i]["遊戲ICON2"].ToString());
                if (icon_index == -1)
                {
                    遊戲ICON2[i] = "";
                }
                else
                {
                    遊戲ICON2[i] = icon_path_array[icon_index].ToString();
                }

                icon_index = icon_id_array.IndexOf(ds.Tables[0].Rows[i]["遊戲ICON3"].ToString());
                if (icon_index == -1)
                {
                    遊戲ICON3[i] = "";
                }
                else
                {
                    遊戲ICON3[i] = icon_path_array[icon_index].ToString();
                }
            }
        }
        if (count > 0)
        {
            RNewsCTitle1.Text = 新聞標題[0];
            RNewsCTime1.Text = 新聞日期[0];
            RNewsCPic1.ImageUrl = "../" + 新聞縮圖[0];
            RNewsCConent1.Text = 新聞內文[0];
            if (遊戲ICON1[0] == "")
            {
                RNewsCGameIcon1_1.Visible = false;
            }
            else
            {
                RNewsCGameIcon1_1.ImageUrl = "../" + 遊戲ICON1[0];
            }
            if (遊戲ICON2[0] == "")
            {
                RNewsCGameIcon1_2.Visible = false;
            }
            else
            {
                RNewsCGameIcon1_2.ImageUrl = "../" + 遊戲ICON2[0];
            }
            if (遊戲ICON3[0] == "")
            {
                RNewsCGameIcon1_3.Visible = false;
            }
            else
            {
                RNewsCGameIcon1_3.ImageUrl = "../" + 遊戲ICON3[0];
            }
            RNewsCMoreBtn1.NavigateUrl = "../NewsPage.aspx?news_id=" + id[0].ToString();
            RNewsCMoreBtn1.Target = "_blank";

            if (count > 1)
            {
                RNewsCTitle2.Text = 新聞標題[1];
                RNewsCTime2.Text = 新聞日期[1];
                RNewsCPic2.ImageUrl = "../" + 新聞縮圖[1];
                RNewsCConent2.Text = 新聞內文[1];
                if (遊戲ICON1[1] == "")
                {
                    RNewsCGameIcon2_1.Visible = false;
                }
                else
                {
                    RNewsCGameIcon2_1.ImageUrl = "../" + 遊戲ICON1[1];
                }
                if (遊戲ICON2[1] == "")
                {
                    RNewsCGameIcon2_2.Visible = false;
                }
                else
                {
                    RNewsCGameIcon2_2.ImageUrl = "../" + 遊戲ICON2[1];
                }
                if (遊戲ICON3[1] == "")
                {
                    RNewsCGameIcon2_3.Visible = false;
                }
                else
                {
                    RNewsCGameIcon2_3.ImageUrl = "../" + 遊戲ICON3[1];
                }
                RNewsCMoreBtn2.NavigateUrl = "../NewsPage.aspx?news_id=" + id[1].ToString();
                RNewsCMoreBtn2.Target = "_blank";
            }else
            {
                RNews1.Visible = false;
            }
        }else
        {
            RNewsArea.Visible = false;
        }
    }
}