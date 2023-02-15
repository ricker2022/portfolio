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

public partial class _DefaultAlbumArea : System.Web.UI.UserControl
{
    public string html = "";
    public int 相簿批 = 0; //一批相簿顯示兩個
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        DataSet ds = xSQL.查詢_相簿清單_前台輪播(ref errCode);
        int total_row = ds.Tables[0].Rows.Count;
        if (total_row > 0)
        {
            DataTable dt相簿清單 = ds.Tables[0];

            ds = xSQL.查詢_戰隊清單_前台顯示(ref errCode);
            ArrayList icon_id_array = new ArrayList();
            ArrayList icon_path_array = new ArrayList();
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                icon_id_array.Add(ds.Tables[0].Rows[i]["戰隊id"].ToString());
                icon_path_array.Add(ds.Tables[0].Rows[i]["遊戲ICON"].ToString());
            }
            int index = 0;
            int 相簿數 = (dt相簿清單.Rows.Count > 6 ? 6 : dt相簿清單.Rows.Count);
            相簿批 = 相簿數 / 2 + (相簿數 % 2 == 1 ? 1 : 0);
            int width = 相簿數 * 330;
            DefaultAlbumBox.Attributes.Add("style", "width:" + width + "px");

            for (int i = 0; i < dt相簿清單.Rows.Count; i++)
            {
                html = html + "<li>" +
                                    "<div class=\"PageVideoCPic\">" +
                    //"<a href=\"AlbumPage.aspx?album=" + dt相簿清單.Rows[i]["相簿id"].ToString() + "&page=1\">" +
                                            "<div style=\"height:165px;overflow:hidden;cursor:pointer;\" onclick=\"寫入相簿瀏覽次數_點擊相簿D(" + dt相簿清單.Rows[i]["相簿id"].ToString() + ")\">" +
                                                "<img src=\"" + dt相簿清單.Rows[i]["相簿縮圖"].ToString() + "\" width=\"294\" style=\"margin-top:-28.5px;\" />" +
                                            "</div>" +
                    //"</a>" +
                                    "</div>" +
                                    "<div class=\"PageVideoCDate\">" + dt相簿清單.Rows[i]["相簿日期"].ToString() + "</div>" +
                                    "<div class=\"PageVideoCGameIcon\">" +
                                        "<ul class=\"PageVCGI\">";

                index = icon_id_array.IndexOf(dt相簿清單.Rows[i]["遊戲ICON3"].ToString());
                if (index > -1)
                {
                    html = html + "<li><img class=\"sGameIcon\" src=\"" + icon_path_array[index] + "\" /></li>";
                }
                index = icon_id_array.IndexOf(dt相簿清單.Rows[i]["遊戲ICON2"].ToString());
                if (index > -1)
                {
                    html = html + "<li><img class=\"sGameIcon\" src=\"" + icon_path_array[index] + "\" /></li>";
                }
                index = icon_id_array.IndexOf(dt相簿清單.Rows[i]["遊戲ICON1"].ToString());
                if (index > -1)
                {
                    html = html + "<li><img class=\"sGameIcon\" src=\"" + icon_path_array[index] + "\" /></li>";
                }


                html = html + "</ul>" +
                                    "</div>" +
                                    "<div class=\"PageVideoCTxt\" style=\"cursor:pointer;\" onclick=\"寫入相簿瀏覽次數_點擊相簿D(" + dt相簿清單.Rows[i]["相簿id"].ToString() + ")\">" + dt相簿清單.Rows[i]["相簿名稱"].ToString() + "</div>" +
                                "</li>";
            }
        }else
        {
            Panel1.Visible = false;
        }
    }
    protected void 按鈕_寫入相簿瀏覽次數D_Click(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        int album = Convert.ToInt16(album_idD.Value);
        xSQL.儲存_相簿清單_瀏覽次數(album, ref errCode);
        //Response.Redirect("AlbumPage.aspx?album=" + album + "&page=1");
        Response.Write("<script>");
        Response.Write("window.open('AlbumPage.aspx?album=" + album + "&page=1','_blank')");
        Response.Write("</script>");
    }
}