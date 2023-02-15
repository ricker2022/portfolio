using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Wb.Pager;
using Wb.Common;

namespace Wb.Models
{
    public class M_Article : IronDBBase
    {
        /// <summary>
        /// 取得文章列表
        /// </summary>
        /// <param name="keyword">關鍵字</param>
        /// <param name="type">屬性編號</param>
        /// <param name="forum_sn">論壇識別</param>
        /// <param name="page">目前位於第幾頁</param>
        /// <param name="page_size">每頁幾筆資料</param>
        /// <returns></returns>
        public IList<文章> GetArticleList(string keyword = "",int type=0,int forum_sn =0, int? page = null, int page_size = 10)
        {
            var query = from m in db.文章
                        where (m.標題.Contains(keyword.Trim()) || m.內容.Contains(keyword.Trim())) ||  string.IsNullOrEmpty(keyword)
                        where m.屬性編號 == type || type == 0
                        where m.論壇識別 == forum_sn || forum_sn ==0
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<文章> Article_list = new PagedList<文章>(query.ToList(), 1, page_size);
                return Article_list;
            }
            else
            {
                return query.ToList();
            }
        }


        /// <summary>
        /// 取得單筆文章資訊
        /// </summary>
        /// <param name="sn">文章流水號</param>
        /// <returns></returns>
        public 文章 GetArticleBySn(long sn)
        {
            var data = db.文章.Where(a => a.文章流水號 == sn);
            if (data.Count() > 0)
            {
                文章 item = data.First();
                return item;
            }
            else
            {
                return new 文章();
            }
        }

        /// <summary>
        /// 文章回覆列表
        /// </summary>
        /// <param name="Article_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<文章回覆> GetArticleReplyList(long article_sn = 0, int? page = null, int page_size = 10)
        {
            var query = from m in db.文章回覆
                        where m.文章流水號 == article_sn || article_sn == 0                    
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<文章回覆> reply_list = new PagedList<文章回覆>(query.ToList(), 1, page_size);
                return reply_list;
            }
            else
            {
                return query.ToList();
            }
        }

        /// <summary>
        /// 取得單筆文章回覆
        /// </summary>
        /// <param name="sn"></param>
        /// <returns></returns>
        public 文章回覆 GetReplyBySn(long sn)
        {
            var data = db.文章回覆.Where(a => a.回覆流水號 == sn);
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



        /// <summary>
        /// 文章留言列表
        /// </summary>
        /// <param name="article_sn"></param>
        /// <param name="reply_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<文章留言> GetArticleMsgList(long article_sn = 0, long reply_sn = 0, int? page = null, int page_size = 10)
        {
            var query = from m in db.文章留言
                        where m.文章流水號 == article_sn || article_sn == 0
                        where m.回覆流水號 == reply_sn || reply_sn == 0
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<文章留言> reply_list = new PagedList<文章留言>(query.ToList(), 1, page_size);
                return reply_list;
            }
            else
            {
                return query.ToList();
            }
        }

        /// <summary>
        /// 取得單筆文章留言
        /// </summary>
        /// <param name="sn"></param>
        /// <returns></returns>
        public 文章留言 GetMessageBySn(long sn)
        {
            var data = db.文章留言.Where(a => a.留言流水號 == sn);
            if (data.Count() > 0)
            {
                文章留言 item = data.First();
                return item;
            }
            else
            {
                return new 文章留言();
            }
        }


        /// <summary>
        /// 更新文章
        /// </summary>
        /// <param name="update_data"></param>
        /// <returns></returns>
        public int UpdateArticle(文章 update_data)
        {
            int affected_row = 0;
            if (update_data.文章流水號 == 0)
            {
                db.文章.Add(update_data);
            }
            else
            {
                文章 data = this.GetArticleBySn(update_data.文章流水號);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }

        /// <summary>
        /// 更新文章回覆
        /// </summary>
        /// <param name="update_data"></param>
        /// <returns></returns>
        public int UpdateReply(文章回覆 update_data)
        {
            int affected_row = 0;
            if (update_data.文章流水號 == 0)
            {
                db.文章回覆.Add(update_data);
            }
            else
            {
                文章回覆 data = this.GetReplyBySn(update_data.文章流水號);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }


        public int UpdateMessage(文章留言 update_data)
        {
            int affected_row = 0;
            if (update_data.留言流水號 == 0)
            {
                db.文章留言.Add(update_data);
            }
            else
            {
                文章留言 data = this.GetMessageBySn(update_data.留言流水號);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }

    }
}