using System;
using System.Collections.Generic;
using System.Collections;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _SearchArea : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (searchtype.SelectedValue == "player")
        {
            Response.Redirect("TeamsMember_search.aspx?key=" + TextBox1.Text);
        }
        if (searchtype.SelectedValue == "news")
        {
            Response.Redirect("News_search.aspx?key=" + TextBox1.Text);
        }
        if (searchtype.SelectedValue == "video")
        {
            Response.Redirect("Video_search.aspx?key=" + TextBox1.Text);
        }
        if (searchtype.SelectedValue == "album")
        {
            Response.Redirect("Album_search.aspx?key=" + TextBox1.Text);
        }
    }
}