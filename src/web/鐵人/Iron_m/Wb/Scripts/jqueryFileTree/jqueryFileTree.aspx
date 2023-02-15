<%@ Page Language="C#" AutoEventWireup="true" %>

<%
	//
	// jQuery File Tree ASP Connector
	//
	// Version 1.0
	//
	// Copyright (c)2008 Andrew Sweeny
	// asweeny@fit.edu
	// 24 March 2008
	//
	string dir;
	if(Request.Form["dir"] == null || Request.Form["dir"].Length <= 0)
		dir = "/";
	else
		dir = Server.UrlDecode(Request.Form["dir"]);

    string filter = "";
    if (Request.Form["filter"] != null && Request.Form["filter"].Length > 0)
        filter = "," + Request.Form["filter"].ToString() + ",";
        
	System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(dir);
    
	Response.Write("<ul class=\"jqueryFileTree\" style=\"display: none;\">\n");

    foreach (System.IO.DirectoryInfo di_child in di.GetDirectories())
    {
        if( ( di_child.Attributes & System.IO.FileAttributes.Hidden ) != System.IO.FileAttributes.Hidden )
        {
            Response.Write("\t<li class=\"directory collapsed\"><a href=\"#\" rel=\"" + dir + di_child.Name + "/\">" + di_child.Name + "</a></li>\n");
        }
    }

	foreach (System.IO.FileInfo fi in di.GetFiles())
	{   
        if (( (fi.Attributes & System.IO.FileAttributes.Hidden) != System.IO.FileAttributes.Hidden ))
        {
		    string ext = ""; 
		    if(fi.Extension.Length > 1)
			    ext = fi.Extension.Substring(1).ToLower();

            if (filter.Length == 0 || ( filter.Length > 0 && ext != "" && filter.IndexOf( "," + ext + "," ) >= 0 ))
            {
                Response.Write("\t<li class=\"file ext_" + ext + "\"><a href=\"#\" rel=\"" + dir + fi.Name + "\">" + fi.Name + "</a></li>\n");		
            }
        }        
	}
	Response.Write("</ul>");
 %>