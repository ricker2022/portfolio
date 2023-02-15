using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[Serializable]
public class url
{
    public static string cureHOST = "http://www.ironforum.com.tw";

    //uniUpload相關
    //public static string unireturn = "http://192.168.2.29:5817/ironforumNEO/xpage/unireturn.aspx";
    //public static string unireturn = "http://www.ironforum.com.tw/xpage/unireturn.aspx";
    //public static string uniimgUpload = "http://w2.ironforum.com.tw/uniUpload.aspx";
    //public static string uniiconUpload = "http://w2.ironforum.com.tw/iconUpload.aspx";

    public static string tempGo = "";
    public static string home = "~/";
    public static string rehome = "~/home";
    public static string news = "~/news";
    public static string subj = "~/subj";
    public static string user = "~/userinfo";
    public static string forum = "~/forum";
    public static string forumdetail = "~/forumdetail";
    public static string usermsg = "~/usermsg/mybox";
    //public static string userLink(string molokey, bool client = true)
    //{
    //    string link = "";
    //    if (client)
    //        link = myMethod.toClientUrl(url.user) + "/" + molokey;
    //    else
    //        link = url.user + "/" + molokey;
    //    return link;
    //}

}
