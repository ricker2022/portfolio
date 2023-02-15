using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Wb.Models;

/// <summary>
/// Userinfo 的摘要描述
/// </summary>
[Serializable]
public class Userinfo
{
    M_Member UH = new M_Member();
    M_Team TH = new M_Team();

    public int errcode;

    public string molokey = "";
    public string cellphone = "";
    public string icon = "default.png";
    public string nickname = "";
    public string sex = "";
    public string email = "";
    public DateTime birth;
    public bool showEmail = false;
    public bool showCoin = false;
    public string signature = "";

    //public int Coin = 0;
    public int coin = 0;
    public int Lv = 0;
    public int Exp = 0;
    public int userType;

    public bool moloYN = false;//moloyn
    public int postCount = 0;//發文次數
    public int replyCount = 0;//回覆次數
    public int pushCount = 0;//推文次數
    public int readCount = 0;//文章總覽數
    public int viewedCount = 0;//文章被瀏覽數
    public int fbBabu = 0;//FB宣傳次數
    private DateTime lastPostTime;//上次發文
    private DateTime lastLoginTime;//上次登入時間
    public string lastIP = "";//上次登入IP
    private DateTime lastActiveTime;//上次活動時間
    public int loginTime = 0;//登入次數
    private DateTime regTime;//註冊時間
    public string role = "";

    public bool isButen = false;//有沒有補填資料
    public bool isMgrEnable = true;
    public bool isAgree = false;

    public string border = "";

    public bool isoriginMember = false;
    //簽到相關
    public bool signinToday = false;
    //稱號
    public string title = "";
    public string extitle = "";
    //戰隊的
    public string myteam = "";
    //不干自己事的參數
    public int totalSigninCount = 0;
    public 業餘戰隊 myteamProfile = new 業餘戰隊();

    //
    public Int64 TotoOnlineMini = 0;//全部在線時間, 以分計算
    //DateTime startLoginTime;

    //停權相關
    public DateTime nologinTime;//禁登日
    public DateTime nopostTime;//禁言日
    public bool NoLoginForever;//永久停權
    public bool NoPostForever;//永久禁言    
    public List<DeclineObj> declineList;//異常物件列表

    public Userinfo(){ }
    //public Userinfo(會員 member)
    //{
    //    this.molokey = member.MoloKey;
    //    this.cellphone = member.門號;
    //    this.email = member.電子信箱;
    //    this.lastIP = member.上次登入IP;
    //    this.nickname = member.暱稱;
    //    this.icon = member.Icon名稱;
    //}
    public Userinfo(string molokey, string phone)
    {
        this.molokey = molokey;
        this.cellphone = phone;
        
        //icon = myMethod.toClientUrl("~/image/content/default.png");
        //border = myMethod.toClientUrl("~/image/border/blank.png");

        CheckSignin();
    }
    //這時候順便更新
    public void CheckSignin()
    {
        DateTime d = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
        //查看簽到
        if (UH.UserSignInCount(molokey, d, d.AddDays(1)) < 1)
            signinToday = false;
        else
            signinToday = true;

        totalSigninCount = UH.UserSignInCount();
    }
    //用這個的都是別人
    public Userinfo(DataRow dr)
    {
        DrToData(dr);
    }
    //Dr轉參數, 分兩階段索取值
    private void DrToData(DataRow dr)
    {
        molokey = dr["MoloKey"].ToString().Trim();
        cellphone = dr["門號"].ToString().Trim();
        icon = dr["Icon名稱"].ToString().Trim();
        if (icon == "")
            icon = myStatic.toHttpUrl("~/image/content/default.png");
        else if (icon.IndexOf("http") == -1)
            setIcon(icon);//因應舊型的ICON路徑是在本機

        //signature = dr["簽名檔"].ToString();
        //setSignature(signature);

        border = dr["邊框Icon"].ToString();
        if (border == "")
            border = myStatic.toHttpUrl("~/image/border/blank.png");
        if (border != "" && border.IndexOf("http") == -1)
            border = myStatic.toHttpUrl("~/image/border/" + border);

        nickname = dr["暱稱"].ToString().Trim();
        sex = dr["性別"].ToString().Trim();
        DateTime.TryParse(dr["生日"].ToString(), out birth);
        email = dr["電子信箱"].ToString().Trim();
        showEmail = bool.Parse(dr["信箱公開YN"].ToString());
        Lv = int.Parse(dr["等級"].ToString());
        Exp = int.Parse(dr["經驗值"].ToString());
        coin = int.Parse(dr["鐵幣"].ToString());
        title = dr["稱號"].ToString();
        extitle = dr["特殊稱號"].ToString();
        showCoin = bool.Parse(dr["鐵幣顯示YN"].ToString());
        isAgree = bool.Parse(dr["隱私同意YN"].ToString());

        int.TryParse(dr["發文次數"].ToString(), out postCount);
        int.TryParse(dr["回覆次數"].ToString(), out replyCount);
        int.TryParse(dr["推文次數"].ToString(), out pushCount);
        int.TryParse(dr["文章總瀏覽數"].ToString(), out readCount);
        int.TryParse(dr["FB宣傳次數"].ToString(), out fbBabu);
        int.TryParse(dr["文章被瀏覽數"].ToString(), out viewedCount);
        int.TryParse(dr["登入次數"].ToString(), out loginTime);

        DateTime.TryParse(dr["上次發文時間"].ToString(), out lastPostTime);
        ////if (myStatic.SiteNow != null)
        ////    lastLoginTime = UH.GetLastLoginTime(molokey, myStatic.SiteNow.forumIdentity);
        ////else
        ////    DateTime.TryParse(dr["上次登入時間"].ToString(), out lastLoginTime);
        lastIP = dr["上次登入IP"].ToString().Trim();
        DateTime.TryParse(dr["上次活動時間"].ToString(), out lastActiveTime);
        TotoOnlineMini = Int64.Parse(dr["累計在線時間"].ToString());

        DateTime.TryParse(dr["註冊時間"].ToString(), out regTime);
        if (regTime < new DateTime(2014, 4, 28))
            isoriginMember = true;

        DateTime.TryParse(dr["註冊時間"].ToString(), out regTime);
        //role = dr["角色名稱"].ToString();
        DateTime.TryParse(dr["停權日期"].ToString(), out nologinTime);
        DateTime.TryParse(dr["鎖定日期"].ToString(), out nopostTime);
        NoLoginForever = bool.Parse(dr["永久停權YN"].ToString());
        NoPostForever = bool.Parse(dr["永久鎖定YN"].ToString());
        //if (isMgr)
        //{
        //    bool.TryParse(dr["啟用YN"].ToString(), out isMgrEnable);
        //    if (!isMgrEnable)
        //        userType = (int)Identity.會員;//沒啟用的人會被打入冷宮
        //}
        //}
    }

    //把DB的個人檔案補完
    public void BuData(DataSet ds)
    {
        DataTable dt = ds.Tables[0];
        DataRow dr = dt.Rows[0];
        DrToData(dr);
    }
    //查異常狀態, 從現在時間開始查
    public void bindDecline(){
        DataSet ds = UH.DSdecline(DateTime.Now, 0, 0, molokey);
        declineList = new List<DeclineObj>();
        if (ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                declineList.Add(new DeclineObj(dr));
            }
        }
    }
    public void SignIn()
    {
        bool result = UH.UserSignIn(molokey);
        if (result)
        {
            //CheckSignin();
            signinToday = true;
        }
    }
    public string DisplayPhone
    {
        get
        {
            return cellphone.Replace("+886", "0");
        }
    }
    public string Nickname
    {
        get
        {
            if (nickname == "")
            {
                return DisplayPhone.Substring(0, 4) + "******";
            }
            else
                return nickname;
        }

        set
        {
            nickname = value;
        }
    }
    public void setIcon(string original)
    {
        if (original.IndexOf("http") == -1)
            icon = myStatic.toHttpUrl("~/img/icon/" + original);
        else
            icon = original;
    }
    public string CoinOnlyMe
    {
        get
        {
            return coin.ToString("N0");
        }
    }
    public string RegTime
    {
        get
        {
            if (regTime.Year == 1)
                return "";
            else
                return regTime.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
    //profile的位置
    public string IconLink
    {
        get
        {
            return myStatic.toHttpUrl(url.user) + "/" + molokey;
        }
    }
    //用來呈現的稱號
    public string titleDisplay
    {
        get
        {
            if (extitle != "")
                return extitle;
            else
                return title;
        }
    }
    #region 戰隊相關

    //綁定自己戰隊成員資訊
    public void bindSentai()
    {
        M_Team MT = new M_Team();
        DataSet ds = MT.DSspfighters(0, 0,nickname);

        if (ds.Tables[0].Rows.Count > 0)
        {
            DataSet ds2 = TH.DSsparetime(int.Parse(ds.Tables[0].Rows[0]["戰隊編號"].ToString()));
            if (ds2.Tables[0].Rows.Count > 0)
            {
                myteamProfile = new 業餘戰隊(ds2.Tables[0].Rows[0]);
                myteam = myteamProfile.戰隊隊名;
            }
        }
    }
    public int isFriend(string nickname, string friend_nickname)
    {
        DataSet ds = UH.DSfriend(nickname);
        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            string name1 = dr["名稱1"].ToString();
            string name2 = dr["名稱2"].ToString();
            if (friend_nickname == name1 || friend_nickname == name2)
                return 0;
        }

        return 1;
    }
    
    //停權文字
    public string nologinDisplay
    {
        get
        {
            if (declineList == null)
                bindDecline();
            DeclineObj dl = declineList.Find(delegate(DeclineObj o) { return o.eType == userForbitAction.停權; });
            string result = "";
            if (NoLoginForever)
                result = "永久停權";
            else if (dl != null)
                result = "停權中(" + dl.end.ToString("yyyy/MM/dd") + ")";
            return result;
        }
        set
        {
            nologinDisplay = "";
        }
    }
    //禁言文字
    public string nopostDisplay
    {
        get
        {
            if (declineList == null)
                bindDecline();
                //return "";
            DeclineObj dl = declineList.Find(delegate(DeclineObj o) { return o.eType == userForbitAction.禁言; });
            string result = "";
            if (NoPostForever)
                result = "永久禁言";
            else if (dl != null)
                result = "禁言中(" + dl.end.ToString("yyyy/MM/dd") + ")";
            return result;
        }
    }
    #endregion

    //個人檔案
    public static Userinfo myProfile
    {
        get
        {
            if (HttpContext.Current.Session["mobile_userinfo"] == null)
            {
                return null;
            }
            else
            {
                return HttpContext.Current.Session["mobile_userinfo"] as Userinfo;
            }
        }
    }
}

//異常物件
[Serializable]
public class DeclineObj
{
    public Int64 eid;
    public int type;
    public string molo;
    public int day;
    public DateTime begin;
    public DateTime end;
    public DateTime uptime;

    public DeclineObj(DataRow dr)
    {
        eid = Int64.Parse(dr["異動編號"].ToString());
        type = int.Parse(dr["識別"].ToString());
        molo = dr["MoloKey"].ToString();
        int.TryParse(dr["天數"].ToString(),out day);
        DateTime.TryParse(dr["開始日"].ToString(), out begin);
        DateTime.TryParse(dr["結束日"].ToString(), out end);
        uptime = DateTime.Parse(dr["建立日期"].ToString());
    }
    public userForbitAction eType
    {
        get
        {
            return (userForbitAction)type;
        }
    }
}
public enum userForbitAction
{
    停權 = 1,
    禁言 = 2
}