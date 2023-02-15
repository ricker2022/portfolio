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
    public class M_Project : IronDBBase
    {
        M_Member MH = new M_Member();

        /// <summary>
        /// 取得專欄列表
        /// </summary>
        /// <param name="keyword">關鍵字</param>
        /// <param name="type">屬性編號</param>
        /// <param name="forum_sn">論壇識別</param>
        /// <param name="page">目前位於第幾頁</param>
        /// <param name="page_size">每頁幾筆資料</param>
        /// <returns></returns>
        public IList<專欄> GetProjectList(string keyword = "",int type=0,int forum_sn =0, int? page = null, int page_size = 10)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@專欄狀態", SqlDbType.Int, 1));
            list.Add(new SqlParaObj("@開始日期", SqlDbType.NVarChar, DateTime.Now.ToString("yyyy-MM-dd HH:mm")));
            list.Add(new SqlParaObj("@日期排序", SqlDbType.Int, 2));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forum_sn));
            DataSet ds = GetDS("專欄_查詢", list);

            IList<專欄> result = new List<專欄>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 專欄(dr));
            }

            if (page.HasValue && page > 0)
            {
                PagedList<專欄> Project_list = new PagedList<專欄>(result, (int)page, page_size);
                return Project_list;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 取得專欄列表
        /// </summary>
        /// <param name="keyword">關鍵字</param>
        /// <param name="forum_sn">論壇識別</param>
        public IList<專欄> DS_Subj(string keyword, int forum_sn = 0, int? page = null, int page_size = 10)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@關鍵字", SqlDbType.NVarChar, keyword));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forum_sn));
            DataSet ds = GetDS("專欄_查詢_關鍵字", list);

            IList<專欄> result = new List<專欄>();
            foreach (DataRow dr in ds.Tables[0].Rows)
                result.Add(new 專欄(dr));

            PagedList<專欄> news_list = new PagedList<專欄>(result, (int)page, page_size);

            return news_list;
        }

        /// <summary>
        /// 取得單筆專欄資訊
        /// </summary>
        /// <param name="sn">專欄流水號</param>
        /// <returns></returns>
        public 專欄 GetProjectBySn(long sn, int forum_sn = 1)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@專欄流水號", SqlDbType.BigInt, sn));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forum_sn));
            DataSet ds = GetDS("專欄_查詢", list);

            if (ds.Tables[0].Rows.Count>0)
                return new 專欄(ds.Tables[0].Rows[0]);
            else
                return new 專欄();
        }


        /// <summary>
        /// 專欄回覆列表
        /// </summary>
        /// <param name="Project_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<專欄回覆> GetProjectReplyList(long Project_sn = 0, int forum_sn = 0, int? page = null, int page_size = 10)
        {
            if (page.HasValue && page > 0)
            {
                PagedList<專欄回覆> reply_list = new PagedList<專欄回覆>(DSSubjectReply(Project_sn,forum_sn), (int)page, page_size);
                return reply_list;
            }
            else
            {
                return null;
            }
        }

        public IList<專欄回覆> DSSubjectReply(long fno = 0, int forumid = 0, long rno = 0, int begin = 0, int end = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@專欄流水號", SqlDbType.BigInt, fno));
            if (rno != 0)
                list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rno));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            if (forumid != 0)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));

            DataSet ds = GetDS("專欄回覆_查詢", list);

            IList<專欄回覆> result = new List<專欄回覆>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 專欄回覆(dr));
            }

            return result;
        }

        public bool AddReply(Int64 fno, string molokey, string content, int forumid)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@專欄流水號", SqlDbType.BigInt, fno));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            DataSet ds = GetDS("專欄回覆_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
            {
                MH.UserCountArgs(molokey, 0, 1);
                MH.UserExpChange(molokey, UserExpChangeType.專欄回覆, 0, 0, fno, 0, fno.ToString());
                MH.UpdateLastPost();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}