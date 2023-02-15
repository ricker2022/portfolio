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
    public class M_Forum : IronDBBase
    {
        M_Member MH = new M_Member();

        /// <summary>
        /// 取得文章列表
        /// </summary>
        /// <param name="type">屬性編號</param>
        /// <param name="forum_sn">論壇識別</param>
        /// <param name="page">目前位於第幾頁</param>
        /// <param name="page_size">每頁幾筆資料</param>
        /// <returns></returns>
        public IList<文章> GetArticleList(int category_sn=0,int forum_sn =0, int? page = null, int page_size = 20)
        {
            DataSet ds = cureArticle(category_sn,forum_sn);
            IList<文章> result = new List<文章>();
            foreach (DataRow dr in ds.Tables[0].Rows)
                result.Add(new 文章(dr));

            if (page.HasValue && page > 0)
            {
                PagedList<文章> news_list = new PagedList<文章>(result, (int)page, page_size);
                return news_list;
            }
            else
            {
                return null;
            }
        }

        public DataSet cureArticle(int category_sn = 0, int forum_sn = 0,SortType stype = SortType.日期, SortMethod smethod = SortMethod.遞減, string urlcag = "1", string urlact = "none", string molokey = "", Int64 fno = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@排序", SqlDbType.Int, (int)stype * 10 + (int)smethod));
            if (category_sn != 0)
                list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, category_sn));
            if (fno != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Int, 0));
            list.Add(new SqlParaObj("@水桶YN", SqlDbType.Int, 0));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forum_sn));
            //list.Add(new SqlParaObj("@排序", SqlDbType.Int, 62));
            list.Add(new SqlParaObj("@排除開獎區YN", SqlDbType.Bit, 1));
            DataSet ds = GetDS("文章_查詢_前台用", list);

            return ds;
        }

        /// <summary>
        /// 取得單筆文章資訊
        /// </summary>
        /// <param name="sn">文章流水號</param>
        /// <returns></returns>
        public 文章 GetArticleBySn(long sn,int game_sn)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, sn));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, game_sn));
            DataSet ds = GetDS("文章_查詢_前台用", list);
            if (ds.Tables[0].Rows.Count > 0)
                return new 文章(ds.Tables[0].Rows[0]);
            else
                return null;

        }

        public Dictionary<int, string> GetArticleCategoryMap(int forum_sn = 1)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Int, 0));
            list.Add(new SqlParaObj("@排序YN", SqlDbType.Int, 0));//預設
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));

            DataSet ds = GetDS("文章屬性_查詢", list);
            Dictionary<int, string> type_map = new Dictionary<int, string>();
            foreach (DataRow dr in ds.Tables[0].Rows)
                type_map.Add(int.Parse(dr["屬性編號"].ToString()), dr["屬性名稱"].ToString());

            return type_map;

        }


        /// <summary>
        /// 文章回覆列表
        /// </summary>
        /// <param name="news_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<文章回覆> GetArticleReplyList(long article_sn = 0, int? page = null, int page_size = 20)
        {
            if (page.HasValue && page > 0)
            {
                PagedList<文章回覆> reply_list = new PagedList<文章回覆>(getReplyList(article_sn), (int)page, page_size);
                return reply_list;
            }
            else
            {
                return null;
            }
        }

        public 文章回覆 GetArticleReplyBySn(long sn, int game_sn)
        {
            var data = db.文章回覆.Where(a => a.回覆流水號 == sn && a.論壇識別 == game_sn);
            if (data.Count() > 0)
            {
                文章回覆 item = data.First();
                return item;
            }
            else
            {
                return new 文章回覆();
            }
        }

        #region 查文
        //純-取得本文物件
        public 文章 getthisArticle(long fno, bool searchall = false)
        {
            int sn = (int)myStatic.siteNow;
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            if (!searchall)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, sn));
            DataSet ds = GetDS("文章_查詢_前台用", list);
            if (ds.Tables[0].Rows.Count > 0)
                return new 文章(ds.Tables[0].Rows[0]);
            else
                return null;
        }
        //純-取得本回覆物件
        public 文章回覆 getthisReply(long rno)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rno));
            DataSet ds = GetDS("文章回覆_查詢", list);
            if (ds.Tables[0].Rows.Count > 0)
                return new 文章回覆(ds.Tables[0].Rows[0]);
            else
                return null;
        }
        //回文的查詢
        public IList<文章回覆> getReplyList(Int64 fno = 0, Int64 rno = 0, string pushedmolo = "")
        {
            DataSet ds = DSreply(fno);
            IList<文章回覆> result = new List<文章回覆>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 文章回覆(dr));
            }

            return result;
        }
        public DataSet DSreply(Int64 fno = 0, Int64 rno = 0, string pushedmolo = "")
        {
            int errcode = 0;
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            if (rno != 0)
                list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rno));
            list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Bit, false));
            list.Add(new SqlParaObj("@水桶YN", SqlDbType.Bit, false));
            list.Add(new SqlParaObj("@前台刪除YN", SqlDbType.Bit, false));
            if (pushedmolo != "")
                list.Add(new SqlParaObj("@推文MoloKey", SqlDbType.NVarChar, pushedmolo));

            DataSet ds = GetDS("文章回覆_查詢", list);

            return ds;
        }
        #endregion
        //文章回覆的發表
        public bool replyPost(Int64 fno, string molokey,string content = "")
        {
            long rno = 0;
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            if (molokey != "")
                list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            if (content != "")
                list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            list.Add(new SqlParaObj("@回覆狀態", SqlDbType.Int, 1));
            list.Add(new SqlParaObj("@置頂YN", SqlDbType.Bit, false));
            list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Bit, false));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));
            DataSet ds = GetDS("文章回覆_新增", list, "@錯誤代碼", out ErrCode);

            if (ErrCode == 0)
            {
                string memo = ds.Tables[0].Rows[0][0].ToString();
                rno = long.Parse(memo);
                MH.UserCountArgs(molokey, 0, 1);
                MH.UserExpChange(molokey, UserExpChangeType.回覆, 0, fno, 0, 0, memo);
                MH.UpdateLastPost();

                文章 aobj = getthisArticle(fno);
                //加到自己的通知
                MH.addActiveMsg(myStatic.officialName, M_Member.myProfile.molokey, aobj.標題, "在 " + aobj.屬性名稱 + " 回覆 " + aobj.標題 + " 一文", aobj.link);
                //加到作者對方, 非本人
                if (aobj.暱稱 != M_Member.myProfile.Nickname)
                {
                    MH.addActiveMsg(M_Member.myProfile.molokey, aobj.MoloKey, aobj.標題, M_Member.myProfile.Nickname + "在 " + aobj.屬性名稱 + " 回覆 " + aobj.標題 + " 一文", aobj.link);
                }
                //加到本文有回覆的所有人, 非本人
                DataSet dsrep = DSreply(fno);
                List<string> buffer = new List<string>();
                foreach (DataRow dr in dsrep.Tables[0].Rows)
                {
                    文章回覆 robj = new 文章回覆(dr);
                    if (myStatic.isrepeatVar(ref buffer, robj.MoloKey) == false)
                    {
                        if (robj.MoloKey != M_Member.myProfile.molokey)
                        {
                            MH.addActiveMsg(M_Member.myProfile.molokey, robj.MoloKey, aobj.標題, M_Member.myProfile.Nickname + "在 " + aobj.屬性名稱 + " 回覆 " + aobj.標題 + " 一文", aobj.link);
                        }
                    }
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        #region 小留言
        //文章留言動作
        public bool addSmalltalk(out string stno, string molokey, string nick, string content, Int64 rid, Int64 aid = 0, int status = 1, int top = 0, int hide = 0)
        {
            stno = "";
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (aid != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, aid));
            list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rid));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@暱稱", SqlDbType.NVarChar, nick));
            list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            if (status != 1)
                list.Add(new SqlParaObj("@留言狀態", SqlDbType.Int, status));
            if (top != 0)
                list.Add(new SqlParaObj("@置頂YN", SqlDbType.Bit, top));
            if (hide != 0)
                list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Bit, hide));

            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));
            DataSet ds = GetDS("文章留言_新增", list, "@錯誤代碼", out ErrCode);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                stno = ds.Tables[0].Rows[0]["留言流水號"].ToString();
            }
            if (ErrCode == 0)
            {
                MH.UserCountArgs(molokey, 0, 0, 0, 1);
                MH.UserExpChange(molokey, UserExpChangeType.留言);
                DataSet dsSMrelative = new DataSet();
                //通知那個回覆者或本文者
                if (aid != 0)
                {
                    文章 aobj = getthisArticle(aid);
                    if (aobj.MoloKey != M_Member.myProfile.molokey)
                        MH.addActiveMsg(M_Member.myProfile.molokey, aobj.MoloKey, aobj.標題, M_Member.myProfile.Nickname + " 於您在 " + aobj.屬性名稱 + " 發表 " + aobj.標題 + " 一文中留言", aobj.link);
                    dsSMrelative = DSsmalltalk(aid);
                }
                else
                {
                    文章回覆 robj = getthisReply(rid);
                    robj.bindArticle();
                    if (robj.MoloKey != M_Member.myProfile.molokey)
                        MH.addActiveMsg(M_Member.myProfile.molokey, robj.MoloKey, robj.aobj.標題, M_Member.myProfile.Nickname + " 於您在 " + robj.aobj.屬性名稱 + " 回覆 " + robj.aobj.標題 + " 一文中留言", robj.aobj.link);
                    dsSMrelative = DSsmalltalk(0, rid);
                }
                //通知那些曾經在上面留言的人, 不含自己
                List<string> buffer = new List<string>();
                foreach (DataRow dr in dsSMrelative.Tables[0].Rows)
                {
                    文章留言 sobj = new 文章留言(dr);
                    if (!myStatic.isrepeatVar(ref buffer, sobj.MoloKey) && sobj.MoloKey != M_Member.myProfile.molokey)
                    {
                        sobj.bindArticle();
                        MH.addActiveMsg(M_Member.myProfile.molokey, sobj.MoloKey, "本文", M_Member.myProfile.Nickname + " 於您在 " + sobj.aobj.標題 + " 回覆中發言", sobj.aobj.link);
                    }
                }

                return true;
            }
            else
            {
                return false;
            }
        }
        //查詢文章的小留言
        public DataSet DSsmalltalk(long aid = 0, long rid = 0, string molokey = "", int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (aid != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, aid));
            if (rid != 0)
                list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rid));
            if (molokey != "")
                list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Bit, 0));
            DataSet ds = GetDS("文章留言_查詢", list);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Userinfo info = MH.getProfile(dr["MoloKey"].ToString());
                dr["暱稱"] = info.Nickname;
            }

            return ds;
        }
        #endregion
        public int AddArticle(文章 update_data)
        {
            int affected_row = 0;
            db.文章.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }


        public int AddReply(文章回覆 update_data)
        {
            int affected_row = 0;
            db.文章回覆.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;          
        }

        //文章人氣增加
        public void addArticleHot(Int64 fno)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));
            DataSet ds = GetDS("文章_瀏覽", list, "@錯誤代碼", out ErrCode);
        }

        public List<文章屬性> GetArticleCategoryList()
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Int, 0));
            list.Add(new SqlParaObj("@排序YN", SqlDbType.Int, 0));//預設
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));

            DataSet ds = GetDS("文章屬性_查詢", list);

            List<文章屬性> ArticleCag = new List<文章屬性>();
            foreach (DataRow dr in ds.Tables[0].Rows)
                ArticleCag.Add(new 文章屬性(dr));


            return ArticleCag;
        }

        public string GetArticleCategoryName(int cag)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, cag));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));

            DataSet ds = GetDS("文章屬性_查詢", list);

            if (ds.Tables[0].Rows.Count > 0)
                return ds.Tables[0].Rows[0]["屬性名稱"].ToString();

            return "";
        }

        public IList<文章留言> GetArticleMessageList(long article_sn = 0,long reply_sn = 0, int? page = null, int page_size = 10)
        {
            DataSet ds = DSsmalltalk(article_sn,reply_sn);

            IList<文章留言> result= new List<文章留言>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 文章留言(dr));
            }

            if (page.HasValue && page > 0)
            {
                PagedList<文章留言> reply_list = new PagedList<文章留言>(result, 1, page_size);
                return reply_list;
            }
            else
            {
                return result;
            }
        }

        //簡單發文
        public bool simplePost(int cag, string molokey, string title, string content, out long fno)
        {
            int errcode = 0;
            fno = 0;
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, cag));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@標題", SqlDbType.NVarChar, title));
            list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            list.Add(new SqlParaObj("@發佈開始日", SqlDbType.DateTime, DateTime.Now));
            list.Add(new SqlParaObj("@異動者", SqlDbType.NVarChar,M_Member.myProfile.nickname));//首發異動者為自分
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, (int)myStatic.siteNow));
            DataSet ds = GetDS("文章_新增", list, "@錯誤代碼", out errcode);

            if (errcode == 0)
            {
                //M_Member MH = new M_Member();
                fno = long.Parse(ds.Tables[0].Rows[0][0].ToString());
                MH.ErrCode = 0;
                //發文的後續動作
                MH.UserCountArgs(molokey, 1);
                MH.UserExpChange(molokey, UserExpChangeType.發文, 0, 0, 0, 0, fno.ToString());
                //UH.UserCoinCange(molokey, UserCoinChangeType.發文獎勵,10,"",title);
                MH.UpdateLastPost();
                //加到訊息通知去

                string attrname = GetArticleCategoryName(cag);
                MH.addActiveMsg(myStatic.officialName, M_Member.myProfile.molokey, title, "在 " + attrname + " 發表 " + title + " 一文", myStatic.genLink(cag.ToString(), fno.ToString()));

                if (MH.ErrCode != 0)
                {
                    ErrCode = MH.ErrCode;
                    return false;
                }
                return true;
            }
            else
            {
                ErrCode = errcode;
                return false;
            }

        }
        
        //推樓主
        public string PushArticle(int cat_sn, int article_sn, string molokey,string pushedMolokey, int pushedCount)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, cat_sn));
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, Convert.ToInt64(article_sn)));
            list.Add(new SqlParaObj("@推文MoloKey", SqlDbType.NVarChar, molokey));
            //list.Add(new SqlParaObj("@原等級", SqlDbType.Int, Unicorn.myProfile.Lv));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int,(int)myStatic.siteNow));
            DataSet ds = GetDS("會員_推文", list, "@錯誤代碼", out ErrCode);

            if (ErrCode == 0)
            {
                MH.UserCountArgs(molokey,(int)myStatic.siteNow,0, 0,1);

                MH.UserExpChange(pushedMolokey, UserExpChangeType.被推文,pushedCount, 0, 0, 0, article_sn.ToString());
                if (pushedCount > 16)
                {
                    MH.UserCoinCange(pushedMolokey, UserCoinChangeType.被推文獎勵, 10, "", article_sn.ToString());
                }
                return "感謝推文!";
            }
            else if (ErrCode == 41)
                return "推文錯誤:超過單版推文次數!";
            else
                return "推文錯誤";

        }

        public string PushReply(int cat_sn, int reply_sn, string molokey)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, cat_sn));
            list.Add(new SqlParaObj("@文章回覆流水號", SqlDbType.BigInt,Convert.ToInt64(reply_sn)));
            list.Add(new SqlParaObj("@推文MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int,(int)myStatic.siteNow));
            DataSet ds = GetDS("會員_回覆推文", list, "@錯誤代碼", out ErrCode);

            if (ErrCode == 0)
                return "感謝推文!";
            else if (ErrCode == 41)
                return "推文錯誤:超過單版推文次數!";
            else
                return "推文錯誤";

        }

    }
}
public enum SortType
{
    日期 = 1,
    人氣 = 2,
    推文 = 3,
    回覆 = 4,
    回覆時間 = 6
}

public enum SortMethod
{
    遞增 = 1,
    遞減 = 2
}