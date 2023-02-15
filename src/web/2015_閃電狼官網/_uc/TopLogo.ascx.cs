using System;
using System.Collections;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _TopLogo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //xSQL xSQL = new xSQL();
        //int errCode = 0;
        //DataSet ds = xSQL.查詢_贊助廠商_前台顯示(ref errCode);
        //ArrayList logos = new ArrayList();
        //ArrayList links = new ArrayList();
        //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //{
        //    //Response.Write(dr["廠商Logo"].ToString() + "<br>");
        //    logos.Add(ds.Tables[0].Rows[i]["廠商Logo"].ToString());
        //    links.Add(ds.Tables[0].Rows[i]["廠商網址"].ToString());
        //}
        //string html = "";
        //int divs_count = Convert.ToInt16(Math.Floor(logos.Count / 3.0));
        //int divs_rest = logos.Count % 3;
        //int index = 0;
        //for (int i = 0; i < divs_count; i++) 
        //{
        //    html = html + "<div id=TopLogo_div" + i.ToString() + " class=\"TopLogo_div\" style=\"display:none;\">" +
        //                         "<ul>";
        //    for (int j = 0; j < 3; j++) 
        //    {
        //        index = (i * 3) + j;
        //        html = html + "<li style=\"background:url('" + logos[index] + "') 0px 0px no-repeat;\"><a href=\"" + links[index] + "\" target=\"_blank\"></a></li>";
        //    }
        //    html = html + "</ul>" +
        //                "</div>";
                            
        //}
        //if (divs_rest > 0)
        //{
        //    html = html + "<div id=TopLogo_div" + (divs_count).ToString() + " class=\"TopLogo_div\" style=\"display:none;\">" +
        //                         "<ul>";
        //    for (int j = 0; j < divs_rest; j++)
        //    {
        //        index = (divs_count * 3) + j;
        //        html = html + "<li style=\"background:url('" + logos[index] + "') 0px 0px no-repeat;\"><a href=\"" + links[index] + "\" target=\"_blank\"></a></li>";
        //    }
        //    html = html + "</ul>" +
        //                "</div>";
        //}
        //TopLogotemp.Value = html;
    }
}