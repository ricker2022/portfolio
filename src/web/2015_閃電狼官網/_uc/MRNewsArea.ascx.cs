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

public partial class _MRNewsArea : System.Web.UI.UserControl
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
        ds = xSQL.查詢_選手標記_新聞(Convert.ToInt16(Request.QueryString["player"]), ref errCode);
        string[] news_list = { "0", "0" };
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (i < 2)
            {
                news_list[i] = ds.Tables[0].Rows[i]["來源id"].ToString();
            }
            else
            {
                break;
            }
        }
        int icon_index = 0;
        if (news_list[0] != "0")
        {
            //新聞清單[0] = dr["新聞標題"].ToString();
            //新聞清單[1] = dr["新聞日期"].ToString();
            //新聞清單[2] = dr["新聞縮圖"].ToString();
            //新聞清單[3] = dr["遊戲ICON1"].ToString();
            //新聞清單[4] = dr["遊戲ICON2"].ToString();
            //新聞清單[5] = dr["遊戲ICON3"].ToString();
            //新聞清單[6] = dr["新聞內文"].ToString();
            //新聞清單[7] = dr["前台顯示"].ToString();
            string[] 新聞清單 = { "", "", "", "", "", "", "", "" };
            新聞清單 = xSQL.查詢_新聞清單_byID(Convert.ToInt16(news_list[0]), ref errCode);
            RNewsCTitle0.InnerText = 新聞清單[0];
            RNewsCTime0.InnerText = 新聞清單[1];
            RNewsCPic0.Attributes.Add("src", "../" + 新聞清單[2]);
            icon_index = icon_id_array.IndexOf(新聞清單[3]);
            if (icon_index == -1)
            {
                新聞清單[3] = "";
            }else
            {
                HtmlGenericControl icon_li = new HtmlGenericControl("li");
                HtmlGenericControl icon_img = new HtmlGenericControl("img");
                icon_img.Attributes.Add("src", icon_path_array[icon_index].ToString());
                icon_img.Attributes.Add("class", "sGameIcon");
                icon_li.Controls.Add(icon_img);
                RNewsCGameIcon0.Controls.Add(icon_li);
                //RNewsCGameIcon01.Attributes.Add("src", "../" + icon_path_array[icon_index].ToString());
                //Response.Write(icon_path_array[icon_index].ToString());
            }
            icon_index = icon_id_array.IndexOf(新聞清單[4]);
            if (icon_index == -1)
            {
                新聞清單[4] = "";
            }
            else
            {
                HtmlGenericControl icon_li = new HtmlGenericControl("li");
                HtmlGenericControl icon_img = new HtmlGenericControl("img");
                icon_img.Attributes.Add("src", icon_path_array[icon_index].ToString());
                icon_img.Attributes.Add("class", "sGameIcon");
                icon_li.Controls.Add(icon_img);
                RNewsCGameIcon0.Controls.Add(icon_li);
                
                //RNewsCGameIcon02.Attributes.Add("src", "../" + icon_path_array[icon_index].ToString());
            }
            icon_index = icon_id_array.IndexOf(新聞清單[5]);
            if (icon_index == -1)
            {
                新聞清單[5] = "";
            }else
            {
                HtmlGenericControl icon_li = new HtmlGenericControl("li");
                HtmlGenericControl icon_img = new HtmlGenericControl("img");
                icon_img.Attributes.Add("src", icon_path_array[icon_index].ToString());
                icon_img.Attributes.Add("width", "28px");
                icon_li.Controls.Add(icon_img);
                RNewsCGameIcon0.Controls.Add(icon_li);
                //RNewsCGameIcon03.Attributes.Add("src", "../" + icon_path_array[icon_index].ToString());
            }
            string news = HttpUtility.HtmlDecode(新聞清單[6]);
            news = Regex.Replace(news, "<.*?>", string.Empty);
            news = news.Replace("&nbsp;", "");
            RNewsCConent0.InnerHtml = news;
            RNewsCMoreBtn0.Attributes.Add("href", "../NewsPage.aspx?news_id=" + news_list[0].ToString());
            RNewsCMoreBtn0.Attributes.Add("target", "_blank");

        }
        else
        {
            MRNewsContent0.Attributes.Add("style", "display:none;");
        }
        if (news_list[1] != "0")
        {
            //新聞清單[0] = dr["新聞標題"].ToString();
            //新聞清單[1] = dr["新聞日期"].ToString();
            //新聞清單[2] = dr["新聞縮圖"].ToString();
            //新聞清單[3] = dr["遊戲ICON1"].ToString();
            //新聞清單[4] = dr["遊戲ICON2"].ToString();
            //新聞清單[5] = dr["遊戲ICON3"].ToString();
            //新聞清單[6] = dr["新聞內文"].ToString();
            //新聞清單[7] = dr["前台顯示"].ToString();
            string[] 新聞清單 = { "", "", "", "", "", "", "", "" };
            新聞清單 = xSQL.查詢_新聞清單_byID(Convert.ToInt16(news_list[1]), ref errCode);
            
            RNewsCTitle1.InnerText = 新聞清單[0];
            RNewsCTime1.InnerText = 新聞清單[1];
            RNewsCPic1.Attributes.Add("src", "../" + 新聞清單[2]);
            icon_index = icon_id_array.IndexOf(新聞清單[3]);
            if (icon_index == -1)
            {
                新聞清單[3] = "";
            }
            else
            {
                HtmlGenericControl icon_li = new HtmlGenericControl("li");
                HtmlGenericControl icon_img = new HtmlGenericControl("img");
                icon_img.Attributes.Add("src", icon_path_array[icon_index].ToString());
                icon_img.Attributes.Add("class", "sGameIcon");
                icon_li.Controls.Add(icon_img);
                RNewsCGameIcon1.Controls.Add(icon_li);
                //RNewsCGameIcon01.Attributes.Add("src", "../" + icon_path_array[icon_index].ToString());
                //Response.Write(icon_path_array[icon_index].ToString());
            }
            icon_index = icon_id_array.IndexOf(新聞清單[4]);
            if (icon_index == -1)
            {
                新聞清單[4] = "";
            }
            else
            {
                HtmlGenericControl icon_li = new HtmlGenericControl("li");
                HtmlGenericControl icon_img = new HtmlGenericControl("img");
                icon_img.Attributes.Add("src", icon_path_array[icon_index].ToString());
                icon_img.Attributes.Add("class", "sGameIcon");
                icon_li.Controls.Add(icon_img);
                RNewsCGameIcon1.Controls.Add(icon_li);

                //RNewsCGameIcon02.Attributes.Add("src", "../" + icon_path_array[icon_index].ToString());
            }
            icon_index = icon_id_array.IndexOf(新聞清單[5]);
            if (icon_index == -1)
            {
                新聞清單[5] = "";
            }
            else
            {
                HtmlGenericControl icon_li = new HtmlGenericControl("li");
                HtmlGenericControl icon_img = new HtmlGenericControl("img");
                icon_img.Attributes.Add("src", icon_path_array[icon_index].ToString());
                icon_img.Attributes.Add("class", "sGameIcon");
                icon_li.Controls.Add(icon_img);
                RNewsCGameIcon1.Controls.Add(icon_li);
                //RNewsCGameIcon03.Attributes.Add("src", "../" + icon_path_array[icon_index].ToString());
            }

            string news = HttpUtility.HtmlDecode(新聞清單[6]);
            news = Regex.Replace(news, "<.*?>", string.Empty);
            news = news.Replace("&nbsp;", "");
            RNewsCConent1.InnerHtml = news;
            RNewsCMoreBtn1.Attributes.Add("href", "../NewsPage.aspx?news_id=" + news_list[1].ToString());
            RNewsCMoreBtn1.Attributes.Add("target", "_blank");
        }
        else
        {
            MRNewsContent1.Attributes.Add("style", "display:none;");
        }
        if ((news_list[0] == "0") && (news_list[1] == "0"))
        {
            MRNewsArea.Visible = false;            
        }
    }
}