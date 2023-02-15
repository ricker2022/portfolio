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
    public class M_Team : IronDBBase
    {
        #region 職業戰隊

        /// <summary>
        /// 戰隊查詢
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="forum_sn"></param>
        /// <param name="foreign">1:國內, 2:國外</param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<戰隊> GetTeamList(string keyword = "", int forum_sn = 0, int foreign = 1, int? page = null, int page_size = 10)
        {
            DataSet ds;
            if(foreign==2)
                ds = DSteam(0, (int)myStatic.siteNow, "", "", "Taiwan");
            else
                ds = DSteam(0, (int)myStatic.siteNow, "","Taiwan");

            IList<戰隊> result = new List<戰隊>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 戰隊(dr));
            }

            if (page.HasValue && page > 0)
            {
                PagedList<戰隊> data_list = new PagedList<戰隊>(result, (int)page, page_size);
                return data_list;
            }
            else
            {
                return result;
            }
        }


        public 戰隊 GetTeamBySn(int sn)
        {
            DataSet ds = DSteam(sn);
            if(ds.Tables[0].Rows.Count>0){
                戰隊 team = new 戰隊(ds.Tables[0].Rows[0]);
                team.BindFighters();
                return team;
            }else
                return new 戰隊();
        }

        //戰隊的查詢
        public DataSet DSteam(int tno = 0, int forumid = 0, string teamname = "", string country = "", string exclude = "", int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (tno != 0)
                list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, tno));
            if (forumid != 0)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            if (teamname != "")
                list.Add(new SqlParaObj("@戰隊隊名", SqlDbType.NVarChar, teamname));
            if (country != "")
                list.Add(new SqlParaObj("@國名", SqlDbType.NVarChar, country));
            if (exclude != "")
                list.Add(new SqlParaObj("@國名排除", SqlDbType.NVarChar, exclude));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));

            DataSet ds = GetDS("戰隊_查詢", list);
                //refileTeamDS(ds, out ds);
            return ds;
        }

        public List<戰隊成員> GetTeamMemberList(DataTable dt)
        {
            //DataSet ds = DSteamMember(0, 0, team_sn);
            List<戰隊成員> result = new List<戰隊成員>();
            foreach (DataRow dr in dt.Rows)
                result.Add(new 戰隊成員(dr));
            return result;
        }

        //戰鬥員查詢
        public DataSet DSteamMember(long fno = 0, int forumid = 0, int teamid = 0, string member = "", long memberid = 0, int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@流水號", SqlDbType.BigInt, fno));
            if (forumid != 0)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            if (teamid != 0)
                list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, teamid));
            if (member != "")
                list.Add(new SqlParaObj("@選手名稱", SqlDbType.NVarChar, member));
            if (memberid != 0)
                list.Add(new SqlParaObj("@選手流水號", SqlDbType.BigInt, memberid));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            DataSet ds = GetDS("戰隊成員_查詢", list);
            return ds;

        }

        public 電競選手 GetPlayerBySn(long sn)
        {
            電競選手 item = DSdenki(sn);
            if(item!=null)
             return item;
            return new 電競選手();
        }
        //選手的查詢
        public 電競選手 DSdenki(long fid = 0, int forumid = -1, string player = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fid != 0)
                list.Add(new SqlParaObj("@流水號", SqlDbType.BigInt, fid));
            if (forumid != -1)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            if (player != "")
                list.Add(new SqlParaObj("@選手名稱", SqlDbType.NVarChar, player));
            DataSet ds = GetDS("電競選手_查詢", list);

            if (ds.Tables[0].Rows.Count > 0)
                return new 電競選手(ds.Tables[0].Rows[0]);
            else
                return null;
        }
        public Dictionary<long, 電競選手> GetPlayerMap(List<戰隊成員> itemList)
        {
            Dictionary<long, 電競選手> type_map = new Dictionary<long, 電競選手>();

            foreach (戰隊成員 item in itemList)
            {
                電競選手 player = DSdenki(0, item.論壇識別, item.選手名稱);
                if (player!=null)
                    type_map.Add(player.流水號,player);
            }

            return type_map;
        }

        //戰鬥員所擅長的英雄
        public DataSet DSexpertin(long memberid = 0, string member = "")
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (memberid != 0)
                list.Add(new SqlParaObj("@選手流水號", SqlDbType.BigInt, memberid));
            if (member != "")
                list.Add(new SqlParaObj("@選手名稱", SqlDbType.NVarChar, member));
            DataSet ds = GetDS("擅用英雄_查詢", list);
            return ds;
        }
       
        #endregion

        #region 業餘戰隊
        public IList<業餘戰隊> GetAmateurTeamList(int? page = null, int page_size = 10)
        {
            DataSet ds = DSsparetime(0,(int)myStatic.siteNow);
            IList<業餘戰隊> result = new List<業餘戰隊>();

            if (ds.Tables[0].Rows.Count == 0)
                return result;

            foreach (DataRow dr in ds.Tables[0].Rows)
                result.Add(new 業餘戰隊(dr));

            if (page.HasValue && page > 0)
            {
                PagedList<業餘戰隊> data_list = new PagedList<業餘戰隊>(result, (int)page, page_size);
                return data_list;
            }
            else
            {
                return result;
            }
        }


        public 業餘戰隊 GetAmateurTeamBySn(int sn)
        {
            DataSet ds = DSsparetime(sn);
            if (ds.Tables[0].Rows.Count > 0)
                return new 業餘戰隊(ds.Tables[0].Rows[0]);
            else
                return null;
        }


        public List<業餘戰隊成員> GetAmateurTeamMemberList(int sn)
        {
            DataSet ds = DSspfighters(0,sn);
            List<業餘戰隊成員> data_list = new List<業餘戰隊成員>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                data_list.Add(new 業餘戰隊成員(dr));
            }

            return data_list;
        }

        
        public List<業餘戰隊成員> GetAmateurTeamMemberListByNickName(string nickName = "")
        {
            var query = from m in db.業餘戰隊成員
                        where m.隊員名稱 == nickName
                        
                        orderby m.流水號
                        select m;

            return query.ToList();
        }



        public 業餘戰隊 GetAmateurTeamByNickName(string nickName = "", int forum_sn = 0)
        {
            var query = from m in db.業餘戰隊成員                       
                        //where m.論壇識別 == forum_sn
                        where m.隊員名稱 == nickName                        
                        select m;

            if (query.Count() > 0)
            {
                業餘戰隊成員 tmp_member = query.First();

                var query2 = from m in db.業餘戰隊                        
                            where m.戰隊編號 == tmp_member.戰隊編號                            
                            select m;
                if (query2.Count() > 0)
                {
                    return query2.First();
                }
                else
                {
                    return new 業餘戰隊();
                }                
            }
            else
            {
                return new 業餘戰隊();
            }

        }


        public Dictionary<string, 會員> GetMemberMapByAmateur(List<業餘戰隊成員> amateur_member_list)
        {
            M_Member MH = new M_Member();
            Dictionary<string, 會員> member_map = new Dictionary<string, 會員>();

            foreach (業餘戰隊成員 Obj in amateur_member_list)
            {
                會員 member = MH.GetMember(Obj.MoloKey);
                if (member != null)
                {
                    if (!member_map.ContainsKey(member.暱稱))
                        member_map.Add(member.暱稱,member);
                }
            }

            return member_map;
        }
        
        #endregion

        #region 業餘戰隊討論區

        public IList<業餘戰隊_文章> GetArticleList(string keyword = "", int category_sn = 0, int forum_sn = 0,int team_sn=0, int? page = null, int page_size = 20)
        {
            DataSet ds = DSspTeamArticle(team_sn);
            IList<業餘戰隊_文章> data_list = new List<業餘戰隊_文章>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                data_list.Add(new 業餘戰隊_文章(dr));
            }
            if (page.HasValue && page > 0)
            {
                PagedList<業餘戰隊_文章> news_list = new PagedList<業餘戰隊_文章>(data_list, (int)page, page_size);
                return news_list;
            }
            else
            {
                return null;
            }
        }


        /// <summary>
        /// 取得單筆業餘戰隊_文章資訊
        /// </summary>
        /// <param name="sn">業餘戰隊_文章流水號</param>
        /// <returns></returns>
        public 業餘戰隊_文章 GetArticleBySn(long sn, int game_sn)
        {
            DataSet ds = DSspTeamArticle(0, 0, "", sn);
            if (ds.Tables[0].Rows.Count > 0)
                return new 業餘戰隊_文章(ds.Tables[0].Rows[0]);
            else
                return null;
        }



        public Dictionary<int, string> GetArticleCategoryMap(int forum_sn = 1,int team_sn = 0)
        {
            DataSet ds = DSspforumCag(team_sn);
            Dictionary<int, string> cat_map = new Dictionary<int, String>();

            foreach (DataRow item in ds.Tables[0].Rows)
            {
                cat_map.Add(int.Parse(item["屬性編號"].ToString()),item["屬性名稱"].ToString());
            }

            return cat_map;
        }


        /// <summary>
        /// 業餘戰隊_文章回覆列表
        /// </summary>
        /// <param name="news_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<業餘戰隊_文章回覆> GetArticleReplyList(long article_sn = 0, int? page = null, int page_size = 20)
        {
            var query = from m in db.業餘戰隊_文章回覆
                        where m.文章流水號 == article_sn || article_sn == 0
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<業餘戰隊_文章回覆> reply_list = new PagedList<業餘戰隊_文章回覆>(query.ToList(), (int)page, page_size);
                return reply_list;
            }
            else
            {
                return query.ToList();
            }
        }

        public 業餘戰隊_文章回覆 GetArticleReplyBySn(long sn, int game_sn)
        {
            var data = db.業餘戰隊_文章回覆.Where(a => a.回覆流水號 == sn && a.論壇識別 == game_sn);
            if (data.Count() > 0)
            {
                業餘戰隊_文章回覆 item = data.First();
                return item;
            }
            else
            {
                return new 業餘戰隊_文章回覆();
            }
        }




        //public int AddArticle(業餘戰隊_文章 update_data)
        //{
        //    int affected_row = 0;
        //    db.業餘戰隊_文章.Add(update_data);
        //    affected_row += db.SaveChanges();
        //    return affected_row;
        //}


        public int AddReply(業餘戰隊_文章回覆 update_data)
        {
            int affected_row = 0;
            db.業餘戰隊_文章回覆.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }



        /// <summary>
        /// 更新業餘戰隊_文章
        /// </summary>
        /// <param name="update_data"></param>
        /// <returns></returns>
        public int UpdateArticle(業餘戰隊_文章 update_data)
        {
            int affected_row = 0;
            if (update_data.文章流水號 == 0)
            {
                db.業餘戰隊_文章.Add(update_data);
            }
            else
            {
                業餘戰隊_文章 data = this.GetArticleBySn(update_data.文章流水號, update_data.論壇識別);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }

        /// <summary>
        /// 更新業餘戰隊_文章
        /// </summary>
        /// <param name="update_data"></param>
        /// <returns></returns>
        public int UpdateArticleReply(業餘戰隊_文章回覆 update_data)
        {
            int affected_row = 0;
            if (update_data.文章流水號 == 0)
            {
                db.業餘戰隊_文章回覆.Add(update_data);
            }
            else
            {
                業餘戰隊_文章回覆 data = this.GetArticleReplyBySn(update_data.回覆流水號, update_data.論壇識別);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }




        public List<業餘戰隊_文章屬性> GetArticleCategoryList(int forum_sn = 0,int team_sn = 0 , int status = 0)
        {
            var query = from m in db.業餘戰隊_文章屬性
                        //where m.論壇識別 == forum_sn || forum_sn == 0
                        where m.戰隊編號 == team_sn 
                        where m.隱藏YN == false
                        where m.屬性狀態 == status || status == 0
                        orderby m.屬性編號 descending
                        select m;
            return query.ToList();
        }



        public IList<業餘戰隊_文章留言> GetArticleMessageList(long article_sn = 0, long reply_sn = 0, int? page = null, int page_size = 10)
        {
            var query = from m in db.業餘戰隊_文章留言
                        where m.文章流水號 == article_sn || article_sn == 0
                        where m.回覆流水號 == reply_sn || reply_sn == 0
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<業餘戰隊_文章留言> reply_list = new PagedList<業餘戰隊_文章留言>(query.ToList(), 1, page_size);
                return reply_list;
            }
            else
            {
                return query.ToList();
            }
        }


        public int AddMessage(業餘戰隊_文章留言 update_data)
        {
            int affected_row = 0;
            db.業餘戰隊_文章留言.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }






        public 業餘戰隊_推文 GetArticlePushBySn(int cat_sn, int article_sn, string molokey, int game_sn)
        {
            var data = db.業餘戰隊_推文.Where(a => a.屬性編號 == cat_sn && a.文章流水號 == article_sn && a.推文MoloKey == molokey && a.論壇識別 == game_sn);
            if (data.Count() > 0)
            {
                業餘戰隊_推文 item = data.First();
                return item;
            }
            else
            {
                return new 業餘戰隊_推文();
            }
        }


        public string PushArticle(int cat_sn, int article_sn, string molokey, int game_sn)
        {
            bool isPush = PushspAricle(cat_sn, article_sn, molokey);

            if (isPush)
                return "感謝推文!";
            else if (ErrCode == 41)
                return "推文錯誤:超過單版推文次數!";
            else
                return "推文錯誤";

        }

        public int AddPushArticle(業餘戰隊_推文 update_data)
        {
            int affected_row = 0;
            db.業餘戰隊_推文.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }



        public 業餘戰隊回覆推文 GetReplyPushBySn(int cat_sn, int reply_sn, string molokey, int game_sn)
        {
            var data = db.業餘戰隊回覆推文.Where(a => a.屬性編號 == cat_sn && a.文章回覆流水號 == reply_sn && a.推文MoloKey == molokey && a.論壇識別 == game_sn);
            if (data.Count() > 0)
            {
                業餘戰隊回覆推文 item = data.First();
                return item;
            }
            else
            {
                return new 業餘戰隊回覆推文();
            }
        }


        public string PushReply(int cat_sn, long reply_sn, string molokey)
        {
            bool isPush = PushspAricleReply(cat_sn, reply_sn, molokey);
            
            if (isPush)
                return "感謝推文!";
            else if(ErrCode==41)
                return "推文錯誤:超過單版推文次數!";
            else
                return "推文錯誤";

        }


        public int AddPushReply(業餘戰隊回覆推文 update_data)
        {
            int affected_row = 0;
            db.業餘戰隊回覆推文.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }



        public 業餘戰隊加入區 GetApplyForJoinTeam(int team_sn, string molokey)
        {
            var data = db.業餘戰隊加入區.Where(a => a.戰隊編號 == team_sn && a.MoloKey == molokey);
            if (data.Count() > 0)
            {
                業餘戰隊加入區 item = data.First();
                return item;
            }
            else
            {
                return new 業餘戰隊加入區();
            }
        }


        public string ApplyForJoinTeam(int team_sn, string molokey,string nickname)
        {

            //需增加是否已加入戰隊
            List<業餘戰隊成員> tmp_list = GetAmateurTeamMemberListByNickName(nickname);
            if (tmp_list.Count > 0)
            {
                return "已加入過戰隊!!";
            }

            業餘戰隊加入區 item = GetApplyForJoinTeam(team_sn, molokey);
            int affected_row = 0;
            if (item.流水號 == 0)
            {
                item.戰隊編號 = team_sn;
                item.MoloKey = molokey;
                item.暱稱 = nickname;
                item.核准YN = "";
                item.建立日期 = DateTime.Now;
                affected_row = AddApplyForJoinTeam(item);
              

                if (affected_row > 0)
                {
                    return "申請成功, 等候回應成功!";
                }
                else
                {
                    return "系統忙碌，請稍後再試!";
                }

            }
            else if (string.IsNullOrEmpty(item.核准YN.Trim()))
            {
                return "已申請, 等候回應";
            }
            else
            {
                return "系統忙碌，請稍後再試!";
            }

        }


        public int AddApplyForJoinTeam(業餘戰隊加入區 update_data)
        {
            int affected_row = 0;
            db.業餘戰隊加入區.Add(update_data);
            affected_row += db.SaveChanges();
            return affected_row;
        }

        #endregion

        #region 業餘
        
        //業餘戰隊
        public DataSet DSsparetime(int tno = 0, int forumid = 0, string teamname = "", int begin = 0, int end = 0, int isclose = 2)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (tno != 0)
                list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, tno));
            if (forumid != 0)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            if (teamname != "")
                list.Add(new SqlParaObj("@戰隊隊名", SqlDbType.NVarChar, teamname));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            if (isclose != 2)
                list.Add(new SqlParaObj("@關閉YN", SqlDbType.Bit, isclose));
            else
                list.Add(new SqlParaObj("@關閉YN", SqlDbType.Bit, 0));
            DataSet ds = GetDS("業餘戰隊_查詢", list);
            return ds;
        }
        
        //業餘戰鬥員相關
        public DataSet DSspfighters(long fno = 0, int tno = 0, string name = "", int isleader = 2, int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@流水號", SqlDbType.BigInt, fno));
            if (tno != 0)
                list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, tno));
            if (name != "")
                list.Add(new SqlParaObj("@隊員名稱", SqlDbType.NVarChar, name));
            if (isleader != 2)
                list.Add(new SqlParaObj("@隊員YN", SqlDbType.Bit, isleader));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            DataSet ds = GetDS("業餘戰隊成員_查詢", list);
            return ds;
        }

        //新增一筆待審戰鬥員
        public bool addJoinConfirm(int teamid, string molo)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, teamid));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            DataSet ds = GetDS("業餘戰隊加入區_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
            {
                return false;
            }
        }
        #endregion

        #region 業餘討論區

        //業餘討論區文章屬性
        public DataSet DSspforumCag(int tno = 0, int attrid = 0, int status = 9, int ishide = 2)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (tno != 0)
                list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, tno));
            if (attrid != 0)
                list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, attrid));
            if (status != 9)
                list.Add(new SqlParaObj("@屬性狀態", SqlDbType.Int, status));
            if (ishide != 2)
                list.Add(new SqlParaObj("@隱藏YN", SqlDbType.Bit, ishide));
            DataSet ds = GetDS("業餘戰隊_文章屬性_查詢", list);
            return ds;
        }
        
        //業餘的文章查詢
        public DataSet DSspTeamArticle(int tno = 0, int attrid = 0, string molo = "", long ano = 0, int status = 9, int begin = 0, int end = 0, int sort = 2, int forumid = 0, int isdel = 2)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (tno != 0)
                list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, tno));
            if (attrid != 0)
                list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, attrid));
            if (molo != "")
                list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            if (ano != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, ano));
            if (status != 9)
                list.Add(new SqlParaObj("@文章狀態", SqlDbType.Int, status));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            list.Add(new SqlParaObj("@日期排序", SqlDbType.Int, sort));
            if (isdel != 2)
                list.Add(new SqlParaObj("@前台刪除YN", SqlDbType.Bit, isdel));
            if (forumid != 0)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            DataSet ds = GetDS("業餘戰隊_文章_查詢", list);
            return ds;
        }

        //業餘文章人氣增加
        public bool AddspAricleViews(long fno)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            DataSet ds = GetDS("業餘戰隊_文章_瀏覽", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //業餘文章推文
        public bool PushspAricle(int cag, long fno, string molokey)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, cag));
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            list.Add(new SqlParaObj("@推文MoloKey", SqlDbType.NVarChar, molokey));
            DataSet ds = GetDS("業餘戰隊推文", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //業餘文章回覆推文
        public bool PushspAricleReply(int cag, long rno, string molokey)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, cag));
            list.Add(new SqlParaObj("@文章回覆流水號", SqlDbType.BigInt, rno));
            list.Add(new SqlParaObj("@推文MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, 0));
            DataSet ds = GetDS("業餘戰隊_回覆推文", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        

        //新增業餘戰隊文章
        public bool AddspArticle(int tno, int attrid, string molo, string title, string content)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@戰隊編號", SqlDbType.Int, tno));
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, attrid));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            list.Add(new SqlParaObj("@標題", SqlDbType.NVarChar, title));
            list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            DataSet ds = GetDS("業餘戰隊_文章_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //修改業餘文章
        public bool EditspArticle(long ano, int status = 9, int ispush = 2, int isdel = 2)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, ano));
            if (status != 9)
                list.Add(new SqlParaObj("@文章狀態", SqlDbType.Int, status));
            if (ispush != 2)
                list.Add(new SqlParaObj("@置頂YN", SqlDbType.Bit, ispush));
            if (isdel != 2)
                list.Add(new SqlParaObj("@前台刪除YN", SqlDbType.Bit, isdel));
            DataSet ds = GetDS("業餘戰隊_文章_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }

        //查詢業餘回覆
        public DataSet DSspTeamArticleReply(long ano = 0, long rno = 0, int isdel = 2, int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (ano != 0)
                list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, ano));
            if (rno != 0)
                list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rno));
            if (isdel != 2)
                list.Add(new SqlParaObj("@前台刪除YN", SqlDbType.Bit, isdel));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            DataSet ds = GetDS("業餘戰隊_文章回覆_查詢", list);
            return ds;
        }
        //新增業餘戰隊回覆
        public bool AddspArticleReply(long fno, string molo, string content)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@文章流水號", SqlDbType.BigInt, fno));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            DataSet ds = GetDS("業餘戰隊_文章回覆_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }
        //修改業餘戰隊回覆
        public bool EditspArticleReply(long rno, string molo, string content = "", int isdel = 2)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rno));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molo));
            if (content != "")
                list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            if (isdel != 2)
                list.Add(new SqlParaObj("@前台刪除YN", SqlDbType.Bit, isdel));
            DataSet ds = GetDS("業餘戰隊_文章回覆_修改", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
                return true;
            else
                return false;
        }

        #endregion

        #region 個人檔案
        //個人檔案
        public 戰隊 proTeam
        {
            get
            {
                if (HttpContext.Current.Session["proTeam"] == null)
                {
                    return null;
                }
                else
                {
                    return HttpContext.Current.Session["proTeam"] as 戰隊;
                }
            }
            set
            {
                HttpContext.Current.Session["proTeam"] = value;
            }
        }

        #endregion
    }
}