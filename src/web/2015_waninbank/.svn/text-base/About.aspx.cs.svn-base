using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string filename = "waninBook01.pdf";
        //從Server端取得檔案 
        Stream FileStream;
        FileStream = File.OpenRead(Server.MapPath("~/waninBook/waninBook01.pdf"));
        downloadBook(filename, FileStream);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string filename = "waninBook02.pdf";
        //從Server端取得檔案 
        Stream FileStream;
        FileStream = File.OpenRead(Server.MapPath("~/waninBook/waninBook02.pdf"));
        downloadBook(filename, FileStream);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        string filename = "waninBook03.pdf";
        //從Server端取得檔案 
        Stream FileStream;
        FileStream = File.OpenRead(Server.MapPath("~/waninBook/waninBook03.pdf"));
        downloadBook(filename, FileStream);
    }
    protected void downloadBook(string filename, Stream FileStream)
    {
        Byte[] Buf = new byte[FileStream.Length];
        FileStream.Read(Buf, 0, int.Parse(FileStream.Length.ToString()));
        FileStream.Close();

        //準備下載檔案 
        Response.ClearHeaders();
        Response.Clear();
        Response.Expires = 0;
        Response.Buffer = false;
        Response.ContentType = "Application/save-as";
        Response.Charset = "utf-8";
        //透過Header設定檔名 
        Response.AddHeader("Content-Disposition", "Attachment; filename=" + HttpUtility.UrlEncode(filename));
        Response.BinaryWrite(Buf);
        Response.End();
    }

    
}