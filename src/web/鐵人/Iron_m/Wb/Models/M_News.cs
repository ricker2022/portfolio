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
    public class M_News : IronDBBase
    {
        M_Member MH = new M_Member();

        /// <summary>
        /// 取得新聞列表
        /// </summary>
        /// <param name="keyword">關鍵字</param>
        /// <param name="type">屬性編號</param>
        /// <param name="forum_sn">論壇識別</param>
        /// <param name="page">目前位於第幾頁</param>
        /// <param name="page_size">每頁幾筆資料</param>
        /// <returns></returns>
        public IList<新聞> GetNewsList(string keyword = "", int type = 0, int forum_sn = 0, int? page = null, int page_size = 10)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@新聞狀態", SqlDbType.Int, 1));
            list.Add(new SqlParaObj("@日期排序", SqlDbType.Int, 2));
            list.Add(new SqlParaObj("@屬性編號", SqlDbType.Int, type));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forum_sn));
            DataSet ds = GetDS("新聞_查詢", list);

            IList<新聞> result = new List<新聞>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 新聞(dr));
            }

            if (page.HasValue && page > 0)
            {
                //PagedList<新聞> news_list = new PagedList<新聞>(query.ToList(), (int)page, page_size);
                PagedList<新聞> news_list = new PagedList<新聞>(result, (int)page, page_size);
                return news_list;
            }
            else
            {
                //return news_list;
                return null;
            }
        }
        /// <summary>
        /// 取得新聞列表
        /// </summary>
        /// <param name="keyword">關鍵字</param>
        /// <param name="forum_sn">論壇識別</param>
        public IList<新聞> DS_News(string keyword, int forum_sn = 0,int? page = null, int page_size = 10)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@關鍵字", SqlDbType.NVarChar, keyword));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forum_sn));
            DataSet ds = GetDS("新聞_查詢_關鍵字", list);

            IList<新聞> result = new List<新聞>();
            foreach (DataRow dr in ds.Tables[0].Rows)
                result.Add(new 新聞(dr));

            PagedList<新聞> news_list = new PagedList<新聞>(result,(int)page, page_size);

            return news_list;
        }

        /// <summary>
        /// 取得單筆新聞資訊
        /// </summary>
        /// <param name="sn">新聞流水號</param>
        /// <returns></returns>
        public 新聞 GetNewsBySn(long sn)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@新聞流水號", SqlDbType.BigInt,sn));
            DataSet ds = GetDS("新聞_查詢", list);
            
            if (ds.Tables[0].Rows.Count ==1)
                return new 新聞(ds.Tables[0].Rows[0]);
            else
                return new 新聞();
        }



        public Dictionary<string, string> GetNewsTypeMap(int forum_sn = 1)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            //list.Add(new SqlParaObj("@屬性狀態", SqlDbType.Int, status));
            DataSet ds = GetDS("新聞屬性_查詢", list);
            Dictionary<string, string> type_map = new Dictionary<string, string>();

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string key = dr["屬性編號"].ToString() + "-" + dr["論壇識別"].ToString();
                type_map.Add(key, dr["屬性名稱"].ToString());
                //type_map.Add(int.Parse(dr["屬性編號"].ToString()),dr["屬性名稱"].ToString());
            }
            //foreach (新聞屬性 item in type_list)
            //{
            //    type_map.Add(item.屬性編號, item.屬性名稱);
            //}

            return type_map;
        }


        /// <summary>
        /// 新聞回覆列表
        /// </summary>
        /// <param name="news_sn"></param>
        /// <param name="page"></param>
        /// <param name="page_size"></param>
        /// <returns></returns>
        public IList<新聞回覆> GetNewsReplyList(long news_sn = 0, int forum_sn = 0, int? page = null, int page_size = 10)
        {
            if (page.HasValue && page > 0)
            {
                PagedList<新聞回覆> reply_list = new PagedList<新聞回覆>(DSnewsReply(news_sn, 0, 0, 0, forum_sn), (int)page, page_size);
                return reply_list;
            }
            else
            {
                return null;
            }
        }


        /// <summary>
        /// 更新新聞
        /// </summary>
        /// <param name="update_data"></param>
        /// <returns></returns>
        public int UpdateNews(新聞 update_data)
        {
            int affected_row = 0;
            if (update_data.新聞流水號 == 0)
            {
                db.新聞.Add(update_data);
            }
            else
            {
                新聞 data = this.GetNewsBySn(update_data.新聞流水號);
                data = update_data;
            }
            affected_row += db.SaveChanges();
            return affected_row;
        }

        //新聞回覆
        public bool AddReply(Int64 fno, string molokey, string content, int forumid)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            list.Add(new SqlParaObj("@新聞流水號", SqlDbType.BigInt, fno));
            list.Add(new SqlParaObj("@MoloKey", SqlDbType.NVarChar, molokey));
            list.Add(new SqlParaObj("@內容", SqlDbType.NVarChar, content));
            list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));
            DataSet ds = GetDS("新聞回覆_新增", list, "@錯誤代碼", out ErrCode);
            if (ErrCode == 0)
            {
                MH.UserCountArgs(molokey, 0, 1);
                MH.UserExpChange(molokey, UserExpChangeType.新聞回覆, 0, 0, fno, 0, fno.ToString());
                MH.UpdateLastPost();
                return true;
            }
            else
            {
                return false;
            }
        }
        public IList<新聞回覆> DSnewsReply(long fno = 0, long rno = 0, int begin = 0, int end = 0, int forumid = 0)
        {
            List<SqlParaObj> list = new List<SqlParaObj>();
            if (fno != 0)
                list.Add(new SqlParaObj("@新聞流水號", SqlDbType.BigInt, fno));
            if (rno != 0)
                list.Add(new SqlParaObj("@回覆流水號", SqlDbType.BigInt, rno));
            if (begin != 0)
                list.Add(new SqlParaObj("@起始行", SqlDbType.Int, begin));
            if (end != 0)
                list.Add(new SqlParaObj("@結束行", SqlDbType.Int, end));
            if (forumid != 0)
                list.Add(new SqlParaObj("@論壇識別", SqlDbType.Int, forumid));

            DataSet ds = GetDS("新聞回覆_查詢", list);

            IList<新聞回覆> result = new List<新聞回覆>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                result.Add(new 新聞回覆(dr));
            }

            return result;
        }
    }


}
public class newAttr
{
    int attr { get; set; }
    int forumid { get; set; }
    public newAttr(int _attr, int _forumid)
    {
        attr = _attr;
        forumid = _forumid;
    }
    //public override string GetHashCode()
    //{
    //    return attr + "-" + forumid;r
    //}
}