using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[Serializable]
public class myStatic
{
    public myStatic()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public static string officialName = "鉄人論壇";
    //目前站台名稱
    public static string molofreechargeUrl = "http://reward.molo.gs/webapi/deposit.ashx";
    public static bool online = false;
    public static string webPath ="";// /IronforumNEO
    public static int localmode = 0;//目前套用在DB, 0正式, 1本機, 2在219 

    public static SiteType siteNow
    {
        set
        {
            HttpContext.Current.Session["SiteNow"] = value;
        }
        get
        {
            //預設是全站台
            if (HttpContext.Current.Session["SiteNow"] == null)
                HttpContext.Current.Session["SiteNow"] = (int)SiteType.SCII;

            return (SiteType)HttpContext.Current.Session["SiteNow"];
        }
    }

    //把波浪網址轉成client網址
    public static string toClientUrl(string serverurl)
    {
        //return url.cureHOST + serverurl.Substring(1);
        return serverurl.Substring(1);
    }
    //把波浪網址轉成client網址
    public static string toHttpUrl(string serverurl)
    {
        //return url.cureHOST + serverurl.Substring(1);
        return url.cureHOST + serverurl.Substring(1);
    }
    //回傳是否有重覆序號, 要送個趴浮
    public static bool isrepeatVar(ref List<string> bufferlist, string val)
    {
        if (bufferlist.Contains(val))
            return true;
        else
        {
            bufferlist.Add(val);
            return false;
        }
    }
    public static string genLink(string attrid, string fno)
    {
        if (online)
            return toClientUrl(url.forumdetail) + "/" + attrid + "/" + fno;
        else
            return webPath + toClientUrl(url.forumdetail) + "/" + attrid + "/" + fno;
    }
    //是否在locale
    public static bool isLocale
    {
        get
        {
            string myIP = "";
            myIP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            if (myIP == "::1" || HttpContext.Current.Request["code"] == "geass" || myIP == "192.168.2.29" || myIP == "192.168.2.32" || myIP == "192.168.2.23")
                return true;
            else
                return false;
        }
    }
    public static string msg(int errcode){
        string result = "";
        switch (errcode)
        {
            case 1: result = "資料庫連線失敗"; break;
            case 2: result = "資料庫執行失敗"; break;
            case 3: result = "參數錯誤"; break;
            case 4: result = "無此Molokey"; break;
            case 5: result = "Molokey重覆"; break;
            case 6: result = "密碼錯誤"; break;
            case 7: result = "帳號未啟用"; break;
            case 8: result = "密碼不符"; break;
            case 9: result = "屬性重複"; break;
            case 10: result = "無此屬性"; break;
            case 11: result = "重複發文"; break;
            case 12: result = "無此文章"; break;
            case 13: result = "帳號重複"; break;
            case 14: result = "無此帳號"; break;
            case 15: result = "帳號權限已存在"; break;
            case 16: result = "帳號權限不存在"; break;
            case 17: result = "暱稱重覆"; break;
            case 18: result = "動作重覆"; break;
            case 19: result = "非原創者不可編輯"; break;
            case 20: result = "主題已鎖定 , 禁止回覆文章"; break;
            case 21: result = "會員永久停權"; break;
            case 22: result = "會員停權"; break;
            case 23: result = "會員永久鎖定"; break;
            case 24: result = "會員鎖定"; break;
            case 25: result = "無此新聞"; break;
            case 26: result = "無此意見反應資料"; break;
            case 27: result = "無此影片"; break;
            case 28: result = "無此行事曆"; break;
            case 29: result = "無此會員"; break;
            case 30: result = "會員識別不符"; break;
            case 31: result = "遊戲編號重複"; break;
            case 32: result = "無此遊戲編號"; break;
            case 33: result = "已有下注記錄,不可刪除或修改"; break;
            case 34: result = "無此項目名稱"; break;
            case 35: result = "無選手資料"; break;
            case 36: result = "無開盤資料"; break;
            case 37: result = "餘額不足"; break;
            case 38: result = "未開獎"; break;
            case 39: result = "無此公告"; break;
            case 40: result = "無此收藏"; break;
            case 41: result = "超過單版推文次數"; break;
            case 42: result = "文章已隱藏"; break;
            case 43: result = "超過限制"; break;
            case 44: result = "異動額錯誤"; break;
            case 45: result = "遊戲已派彩,不可異動"; break;
            case 46: result = "遊戲已開獎,不可異動"; break;
            case 47: result = "超過下注時間"; break;
            case 48: result = "門號重覆"; break;
            default:
                result = "未定義錯誤:" + errcode;
                break;

        }
        return result;
    }

}
//站台
public enum SiteType
{
    MAIN = 0,
    SCII = 1,
    lol = 2,
    stone = 3
}
