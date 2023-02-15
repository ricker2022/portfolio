using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Wb.Models;


public class imsgObj
{
    //收發者, 皆暱稱
    public long fno;
    public string sender;
    public string icons;
    public string receiver;
    public string iconr;
    public string content;
    public bool isread;
    DateTime uptime;

    //用來顯示的非自己就是別人
    public string target = "";
    public string targeticon = "";
    public string targeticonlink = "";
    public string targetMoloKey = "";

    //談話方向
    public bool rightside = false;
    public string showname = "";
    public string showicon = "";

    //送個人檔案時, 是用頁面上的
    public imsgObj(DataRow dr, Userinfo myinfo = null)
    {
        fno = long.Parse(dr["流水號"].ToString());
        sender = dr["訊息發送者"].ToString();
        icons = dr["Icon名稱1"].ToString();
        if (icons.IndexOf("http") == -1)
        {
            if (icons == "")
                icons = "http://w2.ironforum.com.tw/icon/default.png";
            else
                icons = myStatic.toHttpUrl("~/img/icon/" + icons);
        }
        receiver = dr["訊息接收者"].ToString();
        iconr = dr["Icon名稱2"].ToString();
        if (iconr.IndexOf("http") == -1)
        {
            if (iconr == "")
                iconr = "http://w2.ironforum.com.tw/icon/default.png";
            else
                iconr = myStatic.toClientUrl("~/img/icon/" + iconr);
        }
        content = dr["訊息內容"].ToString();
        isread = bool.Parse(dr["讀取YN"].ToString());
        uptime = DateTime.Parse(dr["建立日期"].ToString());

        if (myinfo != null)
        {
            //我方送給對方的, 此時靠右, 並顯示自己
            if (myinfo.Nickname == sender)
            {
                target = receiver;
                targeticon = iconr;
                rightside = true;
                showname = sender;
                showicon = icons;
                isread = true;//我方若送方, 無條件設成己讀
            }
            else
            {
                target = sender;
                targeticon = icons;
                rightside = false;
                showname = sender;
                showicon = icons;
            }
            M_Member UH = new M_Member();
            Userinfo targetinfo = UH.getProfileByNickname(target);
            //targeticonlink = targetinfo.IconLink;
            if (targetinfo.icon != "")
                targeticon = targetinfo.icon;
            else
                targeticon = "http://w2.ironforum.com.tw/icon/default.png";

            targetMoloKey = targetinfo.molokey;
        }
    }

    public string link
    {
        get
        {
            return (myStatic.toClientUrl(url.usermsg) + "/" + target);
        }
    }

    public string date
    {
        get
        {
            return "";
            //return uptime.ToString(myStatic.datetimeFormat);
        }
    }
}