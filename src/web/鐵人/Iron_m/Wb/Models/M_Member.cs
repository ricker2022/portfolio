using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Wb.Pager;
using Wb.Common;
using System.Data;

namespace Wb.Models
{
    [Serializable]
    public class M_Member : IronDBBase
    {
        public int ErrCode;
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
            set
            {
                HttpContext.Current.Session["mobile_userinfo"] = value;
            }
        }
        //更新個人檔案
        public void UpdateProfile()
        {
            if (myProfile != null && myProfile.isButen)
            {
                myProfile = getProfile(myProfile.molokey);
                if (myProfile != null)
                    myProfile.CheckSignin();
            }
        }
        
        #region 會員相關
        /// <summary>
        /// 取得會員列表
        /// </summary>
        /// <param name="forum_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public List<會員> GetMemberList(int forum_sn = 0, int? page = null, int page_size = 10)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            DataSet ds = GetDS("會員_查詢", list);

            IList<會員> result = new List<會員>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 會員(dr));
            }

            if (page.HasValue && page > 0)
            {
                PagedList<會員> news_list = new PagedList<會員>(result, (int)page, page_size);
                return news_list;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 使用molo key取得單筆會員資訊
        /// </summary>
        /// <param name="key"></param>
        /// <param name="nickname"></param>
        /// <returns></returns>
        public 會員 GetMember(string key = "", string nickname = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (nickname != "")
                list.Add(new SqlParaObj("@暱稱", SqlDbType.NVarChar, nickname));
            if (key != "")
                list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, key));
            DataSet ds = GetDS("會員_查詢", list);

            if (ds.Tables[0].Rows.Count > 0)
                return new 會員(ds.Tables[0].Rows[0]);
            else
                return null;
        }

        public Dictionary<string, 會員> GetMemberMapByMoloKey(List<string> moloKeys)
        {
            Dictionary<string, 會員> member_map = new Dictionary<string, 會員>();
            會員 member_info = null;
            foreach (string key in moloKeys)
            {
                member_info = this.GetMember(key);
                if (!member_map.ContainsKey(member_info.MoloKey))
                {
                    member_map.Add(member_info.MoloKey, member_info);
                }
            }
            return member_map;
        }

        public Dictionary<string, 會員> GetMemberMapByArticle(List<文章> article_list)
        {
            Dictionary<string, 會員> member_map = new Dictionary<string, 會員>();
            會員 member_info = null;
            foreach (文章 article in article_list)
            {
                member_info = this.GetMember(article.MoloKey);
                if (!member_map.ContainsKey(member_info.MoloKey))
                {
                    member_map.Add(member_info.MoloKey, member_info);
                }
            }
            return member_map;
        }

        public Dictionary<string, 會員> GetMemberMap(List<好友> friend_list)
        {
            List<會員> member_list = new List<會員>();
            //foreach (好友 Obj in friend_list)
            //{
            //    會員 member = GetMember("", Obj.訊息發送者);
            //    if (member != null)
            //        member_list.Add(member);
            //}
            member_list = member_list.Where(a => friend_list.Select(b => b.名稱1).Contains(a.暱稱) || friend_list.Select(b => b.名稱2).Contains(a.暱稱)).ToList();

            Dictionary<string, 會員> member_map = new Dictionary<string, 會員>();

            foreach (會員 item in member_list)
            {
                member_map.Add(item.暱稱, item);
            }

            return member_map;
        }

        public Dictionary<string, 會員> GetMemberMap(List<即時訊息> friend_list)
        {
            List<會員> member_list = new List<會員>();
            //member_list = member_list.Where(a => friend_list.Select(b => b.訊息發送者).Contains(a.暱稱) || friend_list.Select(b => b.訊息接收者).Contains(a.暱稱)).ToList();
            foreach (即時訊息 msgObj in friend_list)
            {
                會員 member = GetMember("", msgObj.訊息發送者);
                if (member != null)
                    member_list.Add(member);
            }

            Dictionary<string, 會員> member_map = new Dictionary<string, 會員>();

            foreach (會員 item in member_list)
            {
                if (!member_map.ContainsKey(item.暱稱))
                    member_map.Add(item.暱稱, item);
            }

            return member_map;
        }

        public void UserCountArgs(string molokey, int game_sn, int Post = 0, int reply = 0, int push = 0, int sm = 0, int myVisits = 0, int myVisited = 0, int fb = 0, int givecount = 0)
        {
            if (Post != 0)
                userSitePostCount(molokey, game_sn);
            if (reply != 0)
                userArgsCount(molokey, ArgsCountType.回覆);
            if (push != 0)
                userArgsCount(molokey, ArgsCountType.推文);
            if (sm != 0)
                userArgsCount(molokey, ArgsCountType.留言);
            if (myVisits != 0)
                userArgsCount(molokey, ArgsCountType.文章總瀏覽);
            if (myVisited != 0)
                userArgsCount(molokey, ArgsCountType.文章被瀏覽);
            if (fb != 0)
                userArgsCount(molokey, ArgsCountType.FB宣傳);
            if (givecount != 0)
                userArgsCount(molokey, ArgsCountType.累計贈送次數);

        }

        public void userSitePostCount(string molo, int sitetype)
        {
            switch (sitetype)
            {
                case 1:
                    userArgsCount(molo, ArgsCountType.星海發文次數);
                    break;
                case 2:
                    userArgsCount(molo, ArgsCountType.英雄發文次數);
                    break;
                case 3:
                    userArgsCount(molo, ArgsCountType.爐石發文次數);
                    break;
            }
        }
        //次數相關

        public void userArgsCount(string molo, ArgsCountType type, int count = 1)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            list.Add(new SqlParaObj("@" + type.ToString(), SqlDbType.Int, count));
            DataSet ds = GetDS("會員_計數", list, "@錯誤代碼", out ErrCode);
        }

        //會員查詢, 萬能型
        public DataSet dsUser(out int count, string nickname = "", string molo = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (nickname != "")
                list.Add(new SqlParaObj("@暱稱", SqlDbType.NVarChar, nickname));
            if (molo != "")
                list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            DataSet ds = GetDS("會員_查詢", list);
            count = ds.Tables[0].Rows.Count;
            return ds;
        }

        #endregion

        #region 好友相關
        //好友列
        public DataSet DSfriend(string name,int isconfirm=-1, int begin = 0, int end = 0, string invited = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@名稱", SqlDbType.NVarChar, name));
            if (isconfirm!=-1)
             list.Add(new SqlParaObj("@確認2", SqlDbType.Bit,isconfirm));
            if (invited != "")
                list.Add(new SqlParaObj("@名稱2", SqlDbType.NVarChar, invited));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            DataSet ds = GetDS("好友_清單查詢", list);
            return ds;
        }
        //確認好友
        public bool Confirmfriend(string from, string to)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@名稱1", SqlDbType.NVarChar, from));
            list.Add(new SqlParaObj("@名稱2", SqlDbType.NVarChar, to));
            DataSet ds = GetDS("好友_同意加入", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //送邀請
        public bool sendfriendConfirm(string from, string to, string msg = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@名稱1", SqlDbType.NVarChar, from));
            list.Add(new SqlParaObj("@名稱2", SqlDbType.NVarChar, to));
            list.Add(new SqlParaObj("@問候訊息", SqlDbType.NVarChar, msg));
            DataSet ds = GetDS("好友_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }

        public IList<好友> GetFriendList(string nickname = "", int? page = null, int page_size = 10, int isconfirm = -1)
        {
            DataSet ds = DSfriend(nickname, isconfirm);

            IList<好友> result = new List<好友>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                好友 obj = new 好友(dr, myProfile);
                obj.bindprofile();
                result.Add(obj);
            }

            if (page.HasValue && page > 0)
            {
                PagedList<好友> f_list = new PagedList<好友>(result, (int)page, page_size);
                return f_list;
            }
            else
            {
                return null;
            }
        }

        public bool HasFriendRequest()
        {
            DataSet ds = DSfriend(myProfile.nickname, 0, 0, 0, myProfile.Nickname);
            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
        #endregion

        #region 即時訊息

        public DataSet DSimessage(long fno = 0, string sender = "", string receiver = "", bool oryn = false, int begin = 0, int end = 0, int isread = -1)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@流水號", SqlDbType.BigInt, fno));
            if (sender != "")
                list.Add(new SqlParaObj("@訊息發送者", SqlDbType.NVarChar, sender));
            if (receiver != "")
                list.Add(new SqlParaObj("@訊息接收者", SqlDbType.NVarChar, receiver));
            if (oryn != false)
                list.Add(new SqlParaObj("@OR_YN", SqlDbType.Bit, oryn));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            if (isread != -1)
                list.Add(new SqlParaObj("@讀取YN", SqlDbType.Int, isread));
            DataSet ds = GetDS("即時訊息_查詢", list);
            return ds;
        }
        public bool editMessage(long fno = 0, string sender = "", string receiver = "", int isread = 2)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@流水號", SqlDbType.BigInt, fno));
            if (sender != "")
                list.Add(new SqlParaObj("@訊息發送者", SqlDbType.NVarChar, sender));
            if (receiver != "")
                list.Add(new SqlParaObj("@訊息接收者", SqlDbType.NVarChar, receiver));
            if (isread != 2)
                list.Add(new SqlParaObj("@讀取YN", SqlDbType.Bit, isread));
            DataSet ds = GetDS("即時訊息_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
            {
                return true;
            }
            else
                return false;
        }
        public DataSet DSimsgGroup(string sender, int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@訊息發送者", SqlDbType.NVarChar, sender));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            DataSet ds = GetDS("即時訊息_查詢_最近對話群組", list);
            return ds;
        }

        public bool HasNoReadMessage()
        {
            DataSet ds = DSimessage(0, "", myProfile.nickname, false, 0, 0, 0);

            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }

        public List<即時訊息> GetPreMessage(string nickname1 = "", string nickname2 = "", string msg_date = "2014-10-10", int row_count = 10)
        {
            DateTime date_msg = Convert.ToDateTime(msg_date);
            var query = from m in db.即時訊息
                        where (m.訊息發送者 == nickname1 && m.訊息接收者 == nickname2) || (m.訊息發送者 == nickname2 && m.訊息接收者 == nickname1)
                        where m.建立日期 < date_msg
                        orderby m.建立日期 descending
                        select m;
            return query.Take(row_count).OrderBy(a => a.建立日期).ToList();
        }
        #endregion

        public int AddRealTimeMessage(即時訊息 update_data)
        {
            int affected_row = 0;

            db.即時訊息.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }

        //public int UpdateRealTimeMessage(即時訊息 update_data)
        //{
        //    int affected_row = 0;
        //    即時訊息 data = this.GetRealTimeMessageBySn(update_data.流水號);
        //    data = update_data;

        //    affected_row += db.SaveChanges();
        //    return affected_row;
        //}

        //計數相關, 這是舊式, 基本上改了, 也不會在此式多加新功能了
        
        #region 賽In
        //玩家賽In
        public bool UserSignIn(string molokey)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, 0));
            DataSet ds = GetDS("會員_簽到", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //查看賽in
        public int UserSignInCount(string molokey, DateTime df, DateTime dt)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@開始日期", SqlDbType.DateTime, df));
            list.Add(new SqlParaObj("@結束日期", SqlDbType.DateTime, dt));
            DataSet ds = GetDS("會員_簽到查詢", list);
            return ds.Tables[0].Rows.Count;
        }
        //查全部簽到人員數
        public int UserSignInCount()
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            DataSet ds = GetDS("會員_簽到查詢", list);
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }

        #endregion

        #region 玩家登入或查詢
        public Userinfo getProfile(string molokey)
        {
            int i;
            DataSet ds = userLogin(molokey, out i);
            if (i == 0)
                return null;
            else
            {
                Userinfo info = new Userinfo(ds.Tables[0].Rows[0]);
                info.isButen = true;
                return info;
            }
        }
        public Userinfo getProfileByNickname(string nickname)
        {
            int i;
            DataSet ds = dsUser(out i, nickname);
            if (i == 0)
                return null;
            else
            {
                Userinfo info = new Userinfo(ds.Tables[0].Rows[0]);
                info.isButen = true;
                return info;
            }
        }
        //使用者登入, 順便回傳查詢到的筆數
        public DataSet userLogin(string molokey, out int count)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            DataSet ds = GetDS("會員_查詢", list);
            count = ds.Tables[0].Rows.Count;
            return ds;
        }
        //登入後, 要修改使用者的上次登入時間
        public bool afterLogin(string molokey, string phone, string ip)
        {
            int errcode = 0;
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@門號", SqlDbType.NVarChar, phone));
            list.Add(new SqlParaObj("@IP", SqlDbType.NVarChar, ip));
            //if(myStatic.SiteNow!=null)
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, 0));
            DataSet ds = GetDS("會員_登入成功", list, "@錯誤代碼", out errcode);
            if (errcode == 0)
                return true;
            else
            {
                ErrCode = errcode;
                return false;
            }
        }

        #endregion

        #region 玩家數值相關
        //活動時間, 在主庫
        public bool UpdateActiveTime()
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, myProfile.molokey));
            list.Add(new SqlParaObj("@上次活動時間", SqlDbType.DateTime, DateTime.Now));
            list.Add(new SqlParaObj("@異動者", SqlDbType.NVarChar, myProfile.molokey));
            DataSet ds = GetDS("會員_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //最後發文時間, 在主庫
        public bool UpdateLastPost()
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, myProfile.molokey));
            list.Add(new SqlParaObj("@上次發文時間", SqlDbType.DateTime, DateTime.Now));
            list.Add(new SqlParaObj("@異動者", SqlDbType.NVarChar, myProfile.molokey));
            DataSet ds = GetDS("會員_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //更新遊戲使用者上次登入時間
        public bool UpdateGameUser(string molo, DateTime lastlogin)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            list.Add(new SqlParaObj("@上次登入時間", SqlDbType.DateTime, lastlogin));
            list.Add(new SqlParaObj("@異動者", SqlDbType.NVarChar,myProfile.molokey));
            DataSet ds = GetDS("會員_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //更新使用者等級經驗值
        public bool UpdateUserLvExp(string molo, int lv, int exp, string editor)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            list.Add(new SqlParaObj("@等級", SqlDbType.Int, lv));
            list.Add(new SqlParaObj("@經驗值", SqlDbType.Int, exp));
            list.Add(new SqlParaObj("@異動者", SqlDbType.NVarChar, editor));
            DataSet ds = GetDS("會員_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }

        #endregion

        #region 異常狀態類
        //異常查詢
        public DataSet DSdecline(DateTime end, Int64 eid = 0, int type = 0, string molokey = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (eid != 0)
                list.Add(new SqlParaObj("@異動編號", SqlDbType.BigInt, (Int64)eid));
            if (type != 0)
                list.Add(new SqlParaObj("@識別", SqlDbType.Int, type));
            if (molokey != "")
                list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            //list.Add(new SqlParaObj("@開始日", SqlDbType.DateTime, begin));
            //list.Add(new SqlParaObj("@結束日", SqlDbType.DateTime, end));
            DataSet ds = GetDS("會員停權鎖定_查詢", list);
            return ds;
        }
        #endregion

        #region 後續異動修改
        //會員異動, 多了文章流水號
        public void UserExpChange(string molokey, UserExpChangeType type, int pushed = 0, Int64 fno = 0, Int64 nno = 0, Int64 sno = 0, string memo = "")
        {
            Userinfo info = getProfile(molokey);

            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@異動項目", SqlDbType.NVarChar, type.ToString()));
            if (pushed != 0)
                list.Add(new SqlParaObj("@被推文次數", SqlDbType.Int, pushed));
            if (fno != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            if (nno != 0)
                list.Add(new SqlParaObj("@新聞流水號", SqlDbType.BigInt, nno));
            if (sno != 0)
                list.Add(new SqlParaObj("@專欄流水號", SqlDbType.BigInt, sno));
            //多了會員原等級原經驗
            list.Add(new SqlParaObj("@原等級", SqlDbType.Int, info.Lv));
            list.Add(new SqlParaObj("@原經驗值", SqlDbType.Int, info.Exp));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int,(int)myStatic.siteNow));

            DataSet ds = GetDS("會員_異動_經驗值", list, "@錯誤代碼", out ErrCode);

            //檢查是否要變動的錢錢
            //贈送鐵幣,異動識別,異動說明,錯誤代碼
            if (ErrCode == 0)
            {
                DataTable dtlvexp = ds.Tables[1];
                DataRow drlvexp = dtlvexp.Rows[0];
                bool result = UpdateUserLvExp(molokey, int.Parse(drlvexp["等級"].ToString()), int.Parse(drlvexp["經驗值"].ToString()), myProfile.nickname);

                List<tempAfterObj> templist = new List<tempAfterObj>();
                DataTable dtcoin = ds.Tables[2];
                if (dtcoin.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtcoin.Rows)
                    {
                        templist.Add(new tempAfterObj(dr, molokey, memo));
                    }
                }
                foreach (tempAfterObj to in templist)
                {
                    to.Excute();//都交給它處理
                }
                UpdateProfile();
            }
        }

        //玩家鐵幣異動
        public void UserCoinCange(string molokey, UserCoinChangeType type, int value, string why = "", string memo = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@異動識別", SqlDbType.Int, (int)type));
            list.Add(new SqlParaObj("@異動額", SqlDbType.Int, value));
            if (why == "")
                why = type.ToString();
            list.Add(new SqlParaObj("@異動說明", SqlDbType.NVarChar, why));
            if (memo != "")
                list.Add(new SqlParaObj("@備註", SqlDbType.NVarChar, memo));

            DataSet ds = GetDS("會員_異動_鐵幣", list, "@錯誤代碼", out ErrCode);

            UpdateProfile();

        }
        #endregion

        #region 動態消息

        public DataSet DSactiveMsg(long fno = 0, string sendermolo = "", string receivermolo = "", int isread = 2, bool oryn = false, int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@訊息編號", SqlDbType.BigInt, fno));
            if (sendermolo != "")
                list.Add(new SqlParaObj("@訊息發送者", SqlDbType.NVarChar, sendermolo));
            if (receivermolo != "")
                list.Add(new SqlParaObj("@訊息接收者", SqlDbType.NVarChar, receivermolo));
            if (isread != 2)
                list.Add(new SqlParaObj("@讀取YN", SqlDbType.Bit, isread));
            if (oryn != false)
                list.Add(new SqlParaObj("@OR_YN", SqlDbType.Bit, oryn));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));

            list.Add(new SqlParaObj("@日期排序", SqlDbType.Int, 2));

            DataSet ds = GetDS("訊息通知_查詢", list);
            return ds;
        }

        public bool addActiveMsg(string sender = "", string receiver = "", string title = "", string msg = "", string link = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@訊息發送者", SqlDbType.NVarChar, sender));
            list.Add(new SqlParaObj("@訊息接收者", SqlDbType.NVarChar, receiver));
            list.Add(new SqlParaObj("@標題", SqlDbType.NVarChar, title));
            list.Add(new SqlParaObj("@訊息內容", SqlDbType.NVarChar, msg));
            list.Add(new SqlParaObj("@連結網址", SqlDbType.NVarChar, link));

            DataSet ds = GetDS("訊息通知_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
            {
                return true;
            }
            else
                return false;
        }

        #endregion

        #region
        //新增使用者
        public bool addUser(string molokey, string nickname, string sex, DateTime birth, string phone, string email, string ip, string icon = "", string type = "", bool moloYN = true, int source = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@暱稱", SqlDbType.NVarChar, nickname));
            list.Add(new SqlParaObj("@性別", SqlDbType.NVarChar, sex));
            list.Add(new SqlParaObj("@生日", SqlDbType.NVarChar, birth.ToString("yyyy-MM-dd")));
            list.Add(new SqlParaObj("@門號", SqlDbType.NVarChar, phone));
            list.Add(new SqlParaObj("@電子信箱", SqlDbType.NVarChar, email));
            list.Add(new SqlParaObj("@IP位置", SqlDbType.NVarChar, ip));
            list.Add(new SqlParaObj("@MoloYN", SqlDbType.Bit, moloYN));
            list.Add(new SqlParaObj("@註冊來源", SqlDbType.Int, source));
            DataSet ds = GetDS("會員_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //用戶修改, 只有會員識別在分庫, 但因為從不會改到, 故作罷
        public bool modifyUser(string molokey, string editor, int agree = 2,string note = "會員自行修改")
        {
            int errcode = 0;
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            if (agree != 2)
                list.Add(new SqlParaObj("@隱私同意YN", SqlDbType.Bit, agree));

            if (editor == "")
                editor = molokey;
            list.Add(new SqlParaObj("@異動者", SqlDbType.NVarChar, editor));
            list.Add(new SqlParaObj("@備註", SqlDbType.NVarChar, note));

            DataSet ds = GetDS("會員_修改", list, "@錯誤代碼", out errcode);
            if (errcode == 0)
                return true;
            else
            {
                ErrCode = errcode;
                return false;
            }
        }
        #endregion
    }
}
public enum ArgsCountType
{
    星海發文次數,
    英雄發文次數,
    英雄攻略次數,
    爐石發文次數,
    回覆,
    推文,
    留言,
    文章總瀏覽,
    文章被瀏覽,
    FB宣傳,
    累計贈送次數,
    下載RP次數,
    刪文次數,
    約戰次數,
    戰隊編號,
    被收藏次數,
    下注次數,
    錯誤代碼
}
public enum UserExpChangeType
{
    發文,
    回覆,
    被推文,
    留言,
    新聞回覆,
    專欄回覆,
    業餘戰隊發文,
    業餘戰隊回覆,
    業餘戰隊被推文,
    業餘戰隊留言
}
//參數一百以上是減的哦
public enum UserCoinChangeType
{
    系統贈送 = 1,
    趣味遊戲獲得 = 2,
    升等獎勵 = 3,
    系統調整加項 = 4,
    會員轉幣加項 = 5,
    發文獎勵 = 6,
    回覆獎勵 = 7,
    推文獎勵 = 8,
    被推文獎勵 = 9,
    趣味遊戲退回 = 10,
    留言獎勵 = 11,
    新聞回覆獎勵 = 12,
    專欄回覆獎勵 = 13,

    業餘戰隊發文獎勵 = 15,
    業餘戰隊回覆獎勵 = 16,
    業餘戰隊推文獎勵 = 17,
    業餘戰隊被推文獎勵 = 18,
    業餘戰隊留言獎勵 = 19,

    系統收回 = 101,
    趣味遊戲下注 = 102,
    趣味遊戲手續費 = 103,
    系統調整減項 = 104,
    會員轉幣減項 = 105,
    會員轉幣手續費 = 106,
    升等獎勵收回 = 107,
    發文獎勵收回 = 108,
    回覆獎勵收回 = 109,
    被推文獎勵收回 = 110,
    留言獎勵收回 = 111,
    新聞回覆獎勵收回 = 112,
    專欄回覆獎勵收回 = 113,

    業餘戰隊發文獎勵收回 = 115,
    業餘戰隊回覆獎勵收回 = 116,
    業餘戰隊被推文獎勵收回 = 118,
    業餘戰隊留言獎勵收回 = 119
}