using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class _MRAlbumArea : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        try
        {
            DataSet ds = xSQL.查詢_選手標記_相簿(Convert.ToInt16(Request.QueryString["player"].ToString()), ref errCode);

            string id_temp = null; string id = null;
            string img_temp = null; string img = null;
            string date_temp = null; string date = null;
            string info_temp = null; string info = null;
            int count = 0;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                id_temp = id_temp + ds.Tables[0].Rows[i]["來源id"].ToString() + ",";
                img_temp = img_temp + ds.Tables[0].Rows[i]["相簿縮圖"].ToString() + ",";
                date_temp = date_temp + ds.Tables[0].Rows[i]["相簿日期"].ToString() + ",";
                info_temp = info_temp + ds.Tables[0].Rows[i]["相簿名稱"].ToString() + ",";
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

                id_string.Value = id;
                img_string.Value = img;
                date_string.Value = date;
                info_string.Value = info;
            }
            else
            {
                MRAlbumArea.Style.Add("display", "none");
            }
        }catch(Exception ex)
        { }
    }
    protected void 按鈕_寫入相簿瀏覽次數Click(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        int album = Convert.ToInt16(album_id.Value);
        xSQL.儲存_相簿清單_瀏覽次數(album, ref errCode);
        Response.Write("<script>");
        Response.Write("window.open('AlbumPage.aspx?album=" + album + "&page=1','_blank')");
        Response.Write("</script>");
    }
}