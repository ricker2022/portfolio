using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Wb.Models;
using Wb.Pager;
using Wb.Common;
using Microsoft.Security.Application;

namespace Wb.Controllers
{
    [Serializable]
    public class ForumController : FrontendController
    {

        public ActionResult Index(int c = 0 , int page = 1)
        {
            Init();
            M_Forum m_forum = new M_Forum();

            ViewBag.cat_sn = c;

            PagedList<文章> article_list = (PagedList<文章>)m_forum.GetArticleList(c,(int)myStatic.siteNow, page, 50);
            List<文章屬性> category_list = (List<文章屬性>)m_forum.GetArticleCategoryList();
            ViewBag.category_list = category_list;


            Dictionary<int, string> cat_map = m_forum.GetArticleCategoryMap(this.game_sn);
            ViewBag.cat_map = cat_map;

            //molokey & nickname map
            M_Member m_member = new M_Member();
            Dictionary<string, 會員> member_map = m_member.GetMemberMapByArticle(article_list);
            ViewBag.member_map = member_map;


            //page count
            ViewBag.page_count = article_list.TotalPageCount;

            return View(article_list);
        }

        public ActionResult Search(string k = "", int c = 0, int page = 1)
        {
            Init();
            M_Forum m_forum = new M_Forum();

            k = Sanitizer.GetSafeHtmlFragment(k);
            ViewBag.cat_sn = c;
            ViewBag.keyword = k;

            PagedList<文章> article_list = new PagedList<文章>(new List<文章>(),page,50);
            
            if (!string.IsNullOrEmpty(k))
            {
                article_list = (PagedList<文章>)m_forum.GetArticleList(c, this.game_sn, page, 50);
            }

            //List<文章屬性> category_list = (List<文章屬性>)m_forum.GetArticleCategoryList(this.game_sn);
            Dictionary<int, string> category_list = m_forum.GetArticleCategoryMap();
            ViewBag.category_list = category_list;


            Dictionary<int, string> cat_map = m_forum.GetArticleCategoryMap(this.game_sn);
            ViewBag.cat_map = cat_map;


            //molokey & nickname map
            M_Member m_member = new M_Member();
            Dictionary<string, 會員> member_map = m_member.GetMemberMapByArticle(article_list);
            ViewBag.member_map = member_map;

            //page count
            ViewBag.search_page_count = article_list.TotalPageCount;

            return View(article_list);
        }

        public ActionResult Post(int csn = 0)
        {
            Init();
            CheckLogin();
            
            M_Forum m_forum = new M_Forum();
            ViewBag.csn = csn;


            論壇列表 game =  m_forum.GetGameBySn(this.game_sn);

            ViewBag.game_name = game.論壇名稱;


            List<文章屬性> category_list = (List<文章屬性>)m_forum.GetArticleCategoryList();
            ViewBag.category_list = category_list;

            return View();
        }


        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Post(FormCollection fc)
        {
            Init();
            CheckLogin();
            
            string post_title = WbUtil.StripTagsRegex(fc["post_title"]);
            string post_message = WbUtil.StripTagsRegex(fc["post_message"]);
            int csn = WbUtil.TryToParseInt(fc["csn"]);

            M_Forum m_forum = new M_Forum();
            long fno = 0;
            m_forum.simplePost(csn,myProfile.molokey, post_title, post_message,out fno);
            return RedirectToAction("index", new { c = csn });
            //fUrl("index", "", new { csn = csn });
        }

        public string Sanitize(string html)
        {
            string newlinemarker = Guid.NewGuid().ToString();

            //Change newlines to marker strings
            string escapedHtml = html.Replace(Environment.NewLine, newlinemarker);
            string sanitized = Sanitizer.GetSafeHtmlFragment(escapedHtml);
            //Text should not contain newlines so if the sanitizer has added any they can be removed
            sanitized = sanitized.Replace(Environment.NewLine, "<br>");
            //Put newline back
            sanitized = sanitized.Replace(newlinemarker, Environment.NewLine);
            return sanitized;
        }

        public ActionResult Detail(long asn,int rpage = 1)
        {
            if (asn == 0)
            {
                Redirect2Home();
            }

            Init();

            M_Forum m_forum = new M_Forum();
            M_Member m_member = new M_Member();
            List<文章留言> tmp_message_list;
            Dictionary<long, List<文章留言>> message_map = new Dictionary<long, List<文章留言>>();
            List<string> molokey_list = new List<string>();

            //人氣數
            m_forum.addArticleHot(asn);
            //主文
            //----------------------------------------------------------------------
            //主文內容
            文章 article_info = m_forum.GetArticleBySn(asn,this.game_sn);                  

            molokey_list.Add(article_info.MoloKey);

            //主文留言
            tmp_message_list = (List<文章留言>)m_forum.GetArticleMessageList(asn,-1);
            foreach (文章留言 item in tmp_message_list)
            {
                molokey_list.Add(item.MoloKey);
            }

            message_map.Add(0, tmp_message_list);
            //----------------------------------------------------------------------

            //reply list 
            PagedList<文章回覆> reply_list = (PagedList<文章回覆>)m_forum.GetArticleReplyList(article_info.文章流水號, rpage, 30);
            ViewBag.reply_list = reply_list;
            //page count
            ViewBag.reply_page_count = reply_list.TotalPageCount == 0 ? 1 : reply_list.TotalPageCount;
            ViewBag.rpage = rpage;


            //1.取出member molokey & nickname map
            //-------------------------------------------------          
            for(int i=0;i<reply_list.Count;i++)
            {
                //主文留言
                tmp_message_list = (List<文章留言>)m_forum.GetArticleMessageList(asn,reply_list[i].回覆流水號);
                foreach (文章留言 item in tmp_message_list)
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


            //molokey & nickname map            
            //Dictionary<string, 會員> member_map = m_member.GetMemberMapByArticle(article_list);
            //ViewBag.member_map = member_map;



            //增加人氣數
            //---------------------------------------------------
            //article_info.人氣數 += 1;
            //m_forum.UpdateArticle(article_info);
            //---------------------------------------------------

           

            //page count            
            ViewBag.reply_page_count = reply_list.TotalPageCount == 0 ? 1 : reply_list.TotalPageCount;
            ViewBag.asn = asn;
            ViewBag.csn = article_info.屬性編號;
            //ViewBag.rno = article_info.
            return View(article_info);
        }

        public ActionResult alertMsg(string txt = "")
        {
            Dictionary<string, object> result = new Dictionary<string, object>();

            result.Add("message", txt);
            result.Add("success", "ng");


            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AjaxPushArticle(int csn, int sn, string pushedMolokey,int pushedCount)
        {

            Init();

            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Forum m_forum = new M_Forum();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                string message = m_forum.PushArticle(csn, sn, myProfile.molokey, pushedMolokey,pushedCount);
                result.Add("message", message);
                result.Add("success", "ok");
            }

            return Json(result, JsonRequestBehavior.AllowGet);

        }

        public ActionResult AjaxPushReply(int csn, int sn)
        {

            Init();
            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Forum m_forum = new M_Forum();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                string message = m_forum.PushReply(csn, sn, myProfile.molokey);
                result.Add("message", message);
                result.Add("success", "ok");
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Reply(long asn)
        {
            Init();
            CheckLogin();
            ViewBag.asn = asn;
            return View();
        }


        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Reply(FormCollection fc)
        {
            Init();
            CheckLogin();
            M_Forum m_forum = new M_Forum();
            long asn = WbUtil.TryToParseLong(fc["asn"]);
            string reply_message = WbUtil.StripTagsRegex(fc["reply_message"]);
            m_forum.replyPost(asn, M_Member.myProfile.molokey, reply_message);

            return fUrl("Detail");
        }

        public ActionResult Message(long asn, long rsn=-1)
        {
            Init();
            CheckLogin();

            ViewBag.asn = asn;
            ViewBag.rsn = rsn;
            return View();
        }


        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Message(FormCollection fc)
        {
            Init();
            CheckLogin();

            long asn = WbUtil.TryToParseLong(fc["asn"]);
            long rsn = WbUtil.TryToParseLong(fc["rsn"],-1);
            //string reply_message = Sanitizer.GetSafeHtmlFragment(fc["reply_message"]);
            string reply_message = WbUtil.StripTagsRegex(fc["reply_message"]);

            if (reply_message.Length > 140)
            {
                reply_message = reply_message.Substring(0, 140);
            }

            M_Forum m_forum = new M_Forum();
            string stno = "";
            m_forum.addSmalltalk(out stno, myProfile.molokey, myProfile.nickname, reply_message, rsn, asn);
            
            return fUrl("Detail");
        }


    }
}
