using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Wb.Common;
using Wb.Models;
using Wb.Pager;
using Microsoft.Security.Application;

namespace Wb.Controllers
{
    [Serializable]
    public class TeamController : FrontendController
    {

        public ActionResult Index(int page = 1)
        {
            return RedirectToAction("Pro");
        }

        //職業戰隊
        #region

        /// <summary>
        /// 職業戰隊
        /// </summary>
        /// <param name="page"></param>
        /// <param name="foreign"></param>
        /// <returns></returns>
        public ActionResult Pro(int page = 1, int f = 1)
        {
            Init();
            CheckLogin();
            

            ViewBag.foreign_sn = f;


            M_Team m_team = new M_Team();
            PagedList<戰隊> team_list = (PagedList<戰隊>)m_team.GetTeamList("", this.game_sn, f, page, 10);

            //page count
            ViewBag.pro_team_page_count = team_list.TotalPageCount;

            return View(team_list);
        }


        public ActionResult ProSearch(string k = "", int foreign = 1, int page = 1)
        {
            Init();
            CheckLogin();
            

            k = Sanitizer.GetSafeHtmlFragment(k);
            ViewBag.keyword = k;

            M_Team m_team = new M_Team();


            PagedList<戰隊> team_list = new PagedList<戰隊>(new List<戰隊>(), page, 50);
            if (!string.IsNullOrEmpty(k))
            {
                team_list = (PagedList<戰隊>)m_team.GetTeamList(k, this.game_sn, foreign, page, 10);
            }


            //page count
            ViewBag.search_page_count = team_list.TotalPageCount;

            return View(team_list);
        }



        public ActionResult ProDetail(int sn, int page = 1)
        {
            Init();
            CheckLogin();
            
            if (sn == 0)
            {
                Redirect2Home();
            }


            M_Team m_team = new M_Team();

            //取得此頁所有molokey
            List<string> molokey_list = new List<string>();

            m_team.proTeam = m_team.GetTeamBySn(sn);
            //ViewBag.team_info = m_team.proTeam;

            return View(m_team.proTeam);
        }

        public ActionResult ProMember(int sn)
        {
            Init();
            CheckLogin();
            
            if (sn == 0)
            {
                Redirect2Home();
            }

            M_Team m_team = new M_Team();
            if (m_team.proTeam == null)
                m_team.proTeam = m_team.GetTeamBySn(sn);

            ViewBag.team_info = m_team.proTeam;
            List<戰隊成員> member_list = (List<戰隊成員>)m_team.GetTeamMemberList(m_team.proTeam.DTfighters);

            Dictionary<long, 電競選手> player_map = m_team.GetPlayerMap(member_list);
            ViewBag.player_map = player_map;

            ViewBag.team_page_sub_title = " - 成員介紹";


            return View(member_list);
        }


        public ActionResult ProMemberDetail(int sn, long pn)
        {
            Init();
            CheckLogin();
            
            if (sn == 0 || pn == 0)
            {
                Redirect2Home();
            }


            M_Team m_team = new M_Team();
            if (m_team.proTeam == null)
                m_team.proTeam = m_team.GetTeamBySn(sn);
            ViewBag.team_info = m_team.proTeam;

            電競選手 player = m_team.GetPlayerBySn(pn);
            if (player.論壇識別 == 2)
            {
                player.BindHero();
            }

            //List<擅用英雄> hero_list = (List<擅用英雄>)m_team.GetLolHeroListByPlayerSn(player.流水號);
            //ViewBag.hero_list = hero_list;

            //Dictionary<string, 英雄列表> hero_map = m_team.GetLolHeroNameMap();
            //ViewBag.hero_map = hero_map;

            ViewBag.team_page_sub_title = " - 選手資訊";

            return View(player);
        }
        #endregion



        //業餘戰隊
        #region


        public ActionResult Sparetime(int page = 1)
        {
            Init();
            CheckLogin();

            M_Team m_team = new M_Team();
            PagedList<業餘戰隊> team_list = (PagedList<業餘戰隊>)m_team.GetAmateurTeamList(page, 10);

            ViewBag.sparetime_team_page_count = team_list.TotalPageCount;

            return View(team_list);
        }


        public ActionResult Article(int c = 0,int t = 0, int page = 1)
        {           

            if (t == 0)
            {
                Redirect2Home();
            }

            Init();
            CheckLogin();

            M_Team m_team = new M_Team();
            ViewBag.cat_sn = c;

            業餘戰隊 amateur_team = m_team.GetAmateurTeamBySn(t);
            ViewBag.team_info = amateur_team;


            PagedList<業餘戰隊_文章> article_list = (PagedList<業餘戰隊_文章>)m_team.GetArticleList("", c, this.game_sn,t, page, 50);
            List<業餘戰隊_文章屬性> category_list = (List<業餘戰隊_文章屬性>)m_team.GetArticleCategoryList(this.game_sn);
            ViewBag.category_list = category_list;

            Dictionary<int, string> cat_map = m_team.GetArticleCategoryMap(this.game_sn,t);
            ViewBag.cat_map = cat_map;

            //page count
            ViewBag.page_count = article_list.TotalPageCount;

            return View(article_list);
        }


        public ActionResult MyPost(int csn = 0, int t = 0)
        {
            return Post(csn,t);
        }


        public ActionResult Post(int csn = 0,int t = 0)
        {
            if (t == 0)
            {
                Redirect2Home();
            }
            Init();
            CheckLogin();
            

            ViewBag.team_sn = t;
            
            M_Team m_team = new M_Team();
            ViewBag.csn = csn;
            

            論壇列表 game = m_team.GetGameBySn(this.game_sn);

            ViewBag.game_name = game.論壇名稱;


            List<業餘戰隊_文章屬性> category_list = m_team.GetArticleCategoryList(this.game_sn,t, 1);
            ViewBag.category_list = category_list;

            return View();
        }


        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Post(FormCollection fc)
        {
            Init();
            CheckLogin();
            M_Team MT = new M_Team();
           
            string post_title = WbUtil.StripTagsRegex(fc["post_title"]);
            string post_message = WbUtil.StripTagsRegex(fc["post_message"]);
            int csn = WbUtil.TryToParseInt(fc["csn"]);
            int team_sn = WbUtil.TryToParseInt(fc["team_sn"]);

            
            if (csn == 0 || team_sn == 0 || string.IsNullOrEmpty(post_title) || string.IsNullOrEmpty(post_message))
            {
                if (fc["r_post"] != null)
                {
                    return fUrl(fc["r_post"]);
                }
                return fUrl("Post");
            }

            MT.AddspArticle(team_sn, csn, myProfile.molokey, post_title, post_message);
            

            if (fc["r_page"] != null)
            {
                return RedirectToAction(fc["r_page"], new { t = team_sn });
            }
            else
            {
                return RedirectToAction("Article", new { t = team_sn });
            }            
        }

        public ActionResult MyDetail(int asn, int rpage = 1)
        {
            return Detail(asn,rpage);
        }

        public ActionResult Detail(int asn, int rpage = 1)
        {
            if (asn == 0)
            {
                Redirect2Home();
            }
            Init();
            CheckLogin();
           

            M_Team m_team = new M_Team();
            M_Member m_member = new M_Member();
            List<業餘戰隊_文章留言> tmp_message_list;
            Dictionary<long, List<業餘戰隊_文章留言>> message_map = new Dictionary<long, List<業餘戰隊_文章留言>>();
            List<string> molokey_list = new List<string>();


            //主文
            //----------------------------------------------------------------------
            //主文內容
            業餘戰隊_文章 article_info = m_team.GetArticleBySn(asn, this.game_sn);
            molokey_list.Add(article_info.MoloKey);

            //主文留言
            tmp_message_list = (List<業餘戰隊_文章留言>)m_team.GetArticleMessageList(asn, -1);
            foreach (業餘戰隊_文章留言 item in tmp_message_list)
            {
                molokey_list.Add(item.MoloKey);
            }

            message_map.Add(0, tmp_message_list);
            //----------------------------------------------------------------------

            //reply list 
            PagedList<業餘戰隊_文章回覆> reply_list = (PagedList<業餘戰隊_文章回覆>)m_team.GetArticleReplyList(article_info.文章流水號, rpage, 20);
            ViewBag.reply_list = reply_list;
            //page count
            ViewBag.reply_page_count = reply_list.TotalPageCount;
            ViewBag.rpage = rpage;


            //1.取出member molokey & nickname map
            //-------------------------------------------------          
            for (int i = 0; i < reply_list.Count; i++)
            {
                //主文留言
                tmp_message_list = (List<業餘戰隊_文章留言>)m_team.GetArticleMessageList(asn, reply_list[i].回覆流水號);
                foreach (業餘戰隊_文章留言 item in tmp_message_list)
                {
                    molokey_list.Add(item.MoloKey);
                }

                molokey_list.Add(reply_list[i].MoloKey);

                message_map.Add(reply_list[i].回覆流水號, tmp_message_list);

            }

            //message map
            ViewBag.message_map = message_map;


            //molokey & nickname map
            Dictionary<string, 會員> member_map = m_member.GetMemberMapByMoloKey(molokey_list);
            ViewBag.member_map = member_map;
            //-------------------------------------------------



            //page count
            ViewBag.reply_page_count = reply_list.TotalPageCount;
            ViewBag.asn = asn;
            ViewBag.csn = article_info.屬性編號;
            return View(article_info);
        }


        public ActionResult AjaxPushArticle(int csn, int sn)
        {

            Init();

            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Team m_team = new M_Team();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                string message = m_team.PushArticle(csn, sn, myProfile.molokey, this.game_sn);
                result.Add("message", message);
                result.Add("success", "ok");
            }

            return Json(result, JsonRequestBehavior.AllowGet);

        }


        public ActionResult AjaxPushReply(int csn, int sn)
        {

            Init();

            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Team m_team = new M_Team();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                string message = m_team.PushReply(csn, sn, myProfile.molokey);
                result.Add("message", message);
                result.Add("success", "ok");
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public ActionResult AjaxApplyForJoinTeam(int sn)
        {
            Init();

            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Team m_team = new M_Team();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                if (m_team.addJoinConfirm(sn,myProfile.molokey))
                {
                    result.Add("message", "申請成功, 等候回應成功!");
                    result.Add("success", "ok");
                }
                else if (m_team.ErrCode == 18)
                {
                    result.Add("message", "動作重複!");
                    result.Add("success", "ng");
                }else
                {
                    result.Add("message", "系統忙碌，請稍後再試!");
                    result.Add("success", "ng");
                }
                
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult MyReply(long asn, int t = 0)
        {
            return Reply(asn,t);
        }

        public ActionResult Reply(long asn,int t = 0)
        {
            if (asn == 0 || t == 0)
            {
                Redirect2Home();
            }

            Init();
            CheckLogin();
            
            ViewBag.asn = asn;
            ViewBag.team_sn = t;
            return View();
        }


        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Reply(FormCollection fc)
        {
            Init();
            CheckLogin();
            
            long asn = WbUtil.TryToParseLong(fc["asn"]);
            //string reply_message =  Sanitizer.GetSafeHtmlFragment(fc["reply_message"]);
            string reply_message = WbUtil.StripTagsRegex(fc["reply_message"]);


            if (asn == 0 || string.IsNullOrEmpty(reply_message))
            {
                if (!string.IsNullOrEmpty(fc["r_reply"]))
                {
                    return fUrl(fc["r_reply"]);
                }
                return fUrl("Reply");
            }


            M_Team m_team = new M_Team();
            m_team.AddspArticleReply(asn, myProfile.molokey, reply_message);

            if (!string.IsNullOrEmpty(fc["r_page"]))
            {
                return fUrl(fc["r_page"]);
            }
            else
            {
                return fUrl("Detail");
            }
            
        }


        public ActionResult MyMessage(long asn, long rsn = -1)
        {
            return Message(asn, rsn);
        }

        public ActionResult Message(long asn, long rsn = -1)
        {
            Init();
            CheckLogin();
            
            ViewBag.asn = asn;
            ViewBag.rsn = rsn;
            return View();
        }


        [HttpPost]
        public ActionResult Message(FormCollection fc)
        {
            Init();
            CheckLogin();
            
            long asn = WbUtil.TryToParseLong(fc["asn"]);
            long rsn = WbUtil.TryToParseLong(fc["rsn"], -1);
            //string reply_message = Sanitizer.GetSafeHtmlFragment(fc["reply_message"]);
            string reply_message = WbUtil.StripTagsRegex(fc["reply_message"]);

            if (asn == 0 || string.IsNullOrEmpty(reply_message))
            {
                Redirect2Home();
            }


            if (reply_message.Length > 140)
            {
                reply_message = reply_message.Substring(0, 140);
            }


            M_Team m_team = new M_Team();


            業餘戰隊_文章留言 update_date = new 業餘戰隊_文章留言();

            update_date.文章流水號 = asn;
            update_date.回覆流水號 = rsn;
            update_date.MoloKey = myProfile.molokey;
            update_date.暱稱 = myProfile.nickname;
            update_date.內容 = reply_message;

            update_date.留言狀態 = 1;
            update_date.置頂YN = false;

            update_date.置頂時間 = DateTime.Now;
            update_date.隱藏YN = false;
            update_date.水桶YN = false;
            update_date.建立日期 = DateTime.Now;
            update_date.論壇識別 = this.game_sn;


            m_team.AddMessage(update_date);

            if (string.IsNullOrEmpty(fc["rpage"]))
            {
                return fUrl("Detail");
            }
            else
            {
                return fUrl(fc["rpage"]);
            }
        }

        public ActionResult MySparetimeDetail(int t, int page = 1)
        {
            return SparetimeDetail(t, page);
        }

        public ActionResult SparetimeDetail(int t, int page = 1)
        {
            Init();
            CheckLogin();
            
            if (t == 0)
            {
                Redirect2Home();
            }

            M_Team m_team = new M_Team();

            //取得此頁所有molokey
            //List<string> molokey_list = new List<string>();

            業餘戰隊 team_info = m_team.GetAmateurTeamBySn(t);
            ViewBag.team_info = team_info;


            List<業餘戰隊成員> member_list = (List<業餘戰隊成員>)m_team.GetAmateurTeamMemberList(t);
            ViewBag.member_list = member_list;

            Dictionary<string, 會員> member_map = m_team.GetMemberMapByAmateur(member_list);
            ViewBag.member_map = member_map;


            return View("SparetimeDetail",team_info);
        }
        

        public ActionResult My(int c = 0, int t = 0, int page = 1)
        {
            Init();
            CheckLogin();

            if (t == 0)
            {
                return View("MyNoJoin");
            }

            M_Team m_team = new M_Team();
            ViewBag.cat_sn = c;

            業餘戰隊 amateur_team = m_team.GetAmateurTeamBySn(t);
            ViewBag.team_info = amateur_team;


            PagedList<業餘戰隊_文章> article_list = (PagedList<業餘戰隊_文章>)m_team.GetArticleList("", c, this.game_sn, t, page, 50);

            Dictionary<int, string> cat_map = m_team.GetArticleCategoryMap(this.game_sn, t);
            ViewBag.cat_map = cat_map;

            //page count
            ViewBag.page_count = article_list.TotalPageCount;

            return View(article_list);
        }





        #endregion




    }
}
