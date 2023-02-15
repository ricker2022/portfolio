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
    public class NewsController : FrontendController
    {
        
        public ActionResult Index(int page = 1)
        {
            Init();           

            M_News m_news = new M_News();
            PagedList<新聞> news_list = (PagedList<新聞>)m_news.GetNewsList("", 0, (int)myStatic.siteNow, page, 50);

            Dictionary<string,string> type_map = m_news.GetNewsTypeMap(this.game_sn);
            ViewBag.type_map = type_map;

            //page count
            ViewBag.page_count = news_list.TotalPageCount;

            return View(news_list);
        }

        public ActionResult Search(string k = "", int page = 1)
        {
            Init();

            k = Sanitizer.GetSafeHtmlFragment(k);
            ViewBag.keyword = k;

            M_News m_news = new M_News();


            PagedList<新聞> news_list = new PagedList<新聞>(new List<新聞>(), page, 50);
            if (!string.IsNullOrEmpty(k))
            {
                news_list = (PagedList<新聞>)m_news.DS_News(k, (int)myStatic.siteNow, page, 50);
            }

            Dictionary<string, string> type_map = m_news.GetNewsTypeMap(this.game_sn);
            ViewBag.type_map = type_map;

            //page count
            ViewBag.search_page_count = news_list.TotalPageCount;

            return View(news_list);
        }

        public ActionResult Detail(int sn,int forumid,int rpage = 1)
        {
            Init();
            if (sn == 0)
            {
                Redirect2Home();
            }


            M_News m_news = new M_News();
            M_Member m_member = new M_Member();

            //取得此頁所有molokey
            List<string> molokey_list = new List<string>();

            新聞 news_info = m_news.GetNewsBySn(sn);
            ViewBag.poster =  m_member.GetMember("",news_info.異動者);
            //molokey_list.Add(news_info.MoloKey);


            //reply list 
            PagedList<新聞回覆> reply_list = (PagedList<新聞回覆>)m_news.GetNewsReplyList(sn,forumid, rpage, 30);
            ViewBag.reply_list = reply_list;

            //page count
            ViewBag.reply_page_count = reply_list.TotalPageCount == 0 ? 1 : reply_list.TotalPageCount;
            ViewBag.rpage = rpage;


            foreach (新聞回覆 item in reply_list)
            {
                molokey_list.Add(item.MoloKey);
            }

            //molokey & nickname map
            Dictionary<string, 會員> member_map = m_member.GetMemberMapByMoloKey(molokey_list);
            ViewBag.member_map = member_map;



            //增加點擊率
            //---------------------------------------------------
            //news_info.點擊率 += 1;
            //m_news.UpdateNews(news_info);
            //---------------------------------------------------

            return View(news_info);
        }

        public ActionResult Reply(long sn,int forumid)
        {
            Init();
            CheckLogin();
            ViewBag.sn = sn;
            ViewBag.forumid = forumid;
            return View();
        }

        [HttpPost]
        public ActionResult Reply(FormCollection fc)
        {
            Init();
            CheckLogin();
            Int64 sn = WbUtil.TryToParseLong(fc["sn"]);
            int forumid = WbUtil.TryToParseInt(fc["forumid"]);
            string reply_message = fc["reply_message"];

            M_News m_news = new M_News();
            m_news.AddReply(sn, myProfile.molokey, reply_message, forumid);

            return fUrl("Detail");
        }



    }
}
