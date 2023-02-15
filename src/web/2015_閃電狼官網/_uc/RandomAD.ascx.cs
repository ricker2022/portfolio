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

public partial class RandomAD : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        xSQL xSQL = new xSQL();
        int errCode = 0;
        //廣告隨機三則
        DataSet ds = xSQL.查詢_廣告輪播_隨機三則(ref errCode);
        HyperLink hy = new HyperLink();
        string hy_id = null;
        int k = 0;
        for (int i = 0; i < ds.Tables[0].Rows.Count;i++ )
        {
            k++;
            if (k == 1)
            {
                hy_id = "HyperLink" + k.ToString();
                //Response.Write(dr["圖片路徑"].ToString());
                hy = (HyperLink)Panel1.FindControl(hy_id);
                hy.ImageUrl = "../" + ds.Tables[0].Rows[i]["圖片路徑"].ToString();
                //Response.Write(dr["廣告網址"].ToString());
                if ((ds.Tables[0].Rows[i]["廣告網址"].ToString() == "") || (ds.Tables[0].Rows[i]["廣告網址"].ToString() == "http://"))
                {

                }
                else
                {
                    hy.NavigateUrl = ds.Tables[0].Rows[i]["廣告網址"].ToString();
                    hy.Target = "_blank";
                }
            }
        }
        if (k == 0)
        {
            ADBanner.Visible = false;
        }
    }
}