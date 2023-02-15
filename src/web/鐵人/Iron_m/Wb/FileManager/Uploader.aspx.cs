using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
public partial class FileManager_Uploader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //AuthenticateFileManager();
    }



    public void AuthenticateFileManager()
    {
        /* Edit this funcation to  AuthenticateFileManager*/
        
        string SessionID = Request["sessionid"].ToString();

        if (Request.Cookies[SessionID] != null)
        {

        }
        else
        {
            Response.Clear();
            Response.Write("Access Denied");
            Response.End();
        }

    }


}