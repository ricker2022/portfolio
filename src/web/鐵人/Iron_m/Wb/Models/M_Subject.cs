using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Wb.Pager;
using Wb.Common;

namespace Wb.Models
{
    public class M_Subject : IronDBBase
    {
        /// <summary>
        /// 取得專欄列表
        /// </summary>
        /// <param name="keyword">關鍵字</param>
        /// <param name="forum_sn">論壇識別</param>
        /// <param name="page">目前位於第幾頁</param>
        /// <param name="page_size">每頁幾筆資料</param>
        /// <returns></returns>
        public IList<專欄> GetSubjectList(string keyword = "",int forum_sn =0, int? page = null, int page_size = 10)
        {
            var query = from m in db.專欄 
                        where (m.標題.Contains(keyword.Trim()) || m.內容.Contains(keyword.Trim())) || string.IsNullOrEmpty(keyword)
                        where m.論壇識別 == forum_sn || forum_sn ==0
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<專欄> subj_list = new PagedList<專欄>(query.ToList(), 1, page_size);
                return subj_list;
            }
            else
            {
                return query.ToList();
            }
        }


        /// <summary>
        /// 取得單筆專欄資訊
        /// </summary>
        /// <param name="sn">專欄流水號</param>
        /// <returns></returns>
        public 專欄 GetSubjectBySn(long sn)
        {
            var data = db.專欄.Where(a => a.專欄流水號 == sn);
            if (data.Count() > 0)
            {
                專欄 item = data.First();
                return item;
            }
            else
            {
                return new 專欄();
            }
        }


        public IList<專欄回覆> GetSubjectReplyList(long subject_sn = 0, int? page = null, int page_size = 10)
        {
            var query = from m in GetSubject()
                        where m.專欄流水號 == subject_sn || subject_sn == 0
                        orderby m.建立日期 descending
                        select m;
            if (page.HasValue && page > 0)
            {
                PagedList<專欄回覆> reply_list = new PagedList<專欄回覆>(query.ToList(), 1, page_size);
                return reply_list;
            }
            else
            {
                return query.ToList();
            }
        }





        /// <summary>
        /// 更新專欄
        /// </summary>
        /// <param name="update_data"></param>
        /// <returns></returns>
        public int UpdateSubject(專欄 update_data)
        {
            int affected_row = 0;
            if (update_data.專欄流水號 == 0)
            {
                db.專欄.Add(update_data);
            }
            else
            {
                專欄 data = this.GetSubjectBySn(update_data.專欄流水號);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }

    }
}