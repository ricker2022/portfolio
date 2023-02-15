using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
using System.Collections;
using System.Text;

namespace Ams.common
{
    public class Db_ctrl
    {

        private string GetDatabaseConnStr(string conn_name)
        {
            return ConfigurationManager.AppSettings[conn_name];
        }

        /*
         * 將例如錯誤記錄於根目錄下之 log 資料夾中, 檔案名稱以錯誤發生當日命名.
         * 若寫檔發生錯誤, 則記錄於系統的"事件檢視器"
         */
        public void ExceptionLog(Exception ex)
        {

            StringBuilder log_path = new StringBuilder(System.Web.HttpContext.Current.Request.PhysicalApplicationPath + "log\\");

            if (System.IO.Directory.Exists(log_path.ToString()) == false)
                System.IO.Directory.CreateDirectory(log_path.ToString());

            try
            {
                using (System.IO.StreamWriter sw = new System.IO.StreamWriter(log_path.Append(DateTime.Now.ToString("yyyy-MM-dd-HH")).ToString(), true))
                {
                    string line = "************************************************************";
                    sw.WriteLine(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
                    sw.WriteLine(line);
                    sw.WriteLine(ex.ToString());
                    sw.WriteLine(line);
                    sw.Close();
                    sw.Dispose();
                }
            }
            catch
            {


            }
        }

        /*
         * 傳入已設定好參數之 SqlCommand, 
         * 專則建立與 MS SQL 的連線, 並呼叫 SqlCommand 指定對資料表格進行 "SELECT" 的 Stored Procedure.
         * 執行成功, 回傳有資料的 DataTable 
         * 執行失敗, 回傳空的 DataTable
         */
        public DataTable SelectData(SqlCommand obj_cmd, string dt_name)
        {
            SqlConnection obj_conn = new SqlConnection(GetDatabaseConnStr("APP_DB_CONN_0"));
            obj_cmd.Connection = obj_conn;
            SqlDataAdapter obj_adapter = new SqlDataAdapter();
            DataTable obj_dt = new DataTable(dt_name);

            try
            {
                obj_conn.Open();
                obj_adapter.SelectCommand = obj_cmd;
                obj_adapter.Fill(obj_dt);
            }
            catch (Exception ex)
            {
                //ak.util.AkUtil.dLog("------------Exception 1--------------");
                //ak.util.AkUtil.dLog(obj_cmd.CommandText);
                //ak.util.AkUtil.dLog(ex.Message);
                //ak.util.AkUtil.dLog("-------------------------------------");

                ExceptionLog(ex);
            }
            finally
            {
                obj_adapter.Dispose();
                obj_cmd.Dispose();
                obj_conn.Close();
                obj_conn.Dispose();
            }
            return obj_dt;
        }

        /*
         * 傳入已設定好參數之 SqlCommand, 
         * 專則建立與 MS SQL 的連線, 並呼叫 SqlCommand 指定對資料表格進行 "SELECT" 的 Stored Procedure.
         * 執行成功, 回傳 SqlDataReader 
         * 執行失敗, 回傳 SqlDataReader=NULL
         */
        public SqlDataReader SelectData(SqlCommand obj_cmd, SqlConnection obj_conn)
        {
            obj_conn.ConnectionString = GetDatabaseConnStr("APP_DB_CONN_0");
            obj_cmd.Connection = obj_conn;
            SqlDataReader obj_rd = null;
            try
            {
                obj_conn.Open();
                obj_rd = obj_cmd.ExecuteReader();
            }
            catch (Exception ex)
            {
                //ak.util.AkUtil.dLog("------------Exception 2--------------");
                //ak.util.AkUtil.dLog(obj_cmd.CommandText);
                //ak.util.AkUtil.dLog(ex.Message);
                //ak.util.AkUtil.dLog("-------------------------------------");
                ExceptionLog(ex);//發生例外事件,回傳-2
            }
            return obj_rd;
        }

        /*
         * 傳入已設定好參數之 SqlCommand, 
         * 專則建立與 MS SQL 的連線, 並呼叫 SqlCommand 指定對資料表格進行 "INSERT" 的 Stored Procedure.
         * 
         * Stored Procedure Ex:
         *      INSERT INTO [dbo].[Category] (Name) VALUES (@Name)
         *      SELECT SCOPE_IDENTITY()
         * 
         * 執行成功, 回傳新增資料的 ID 值(Last Inserted ID) 
         * 執行失敗, 回傳 -2
         */
        public int InsertData(SqlCommand obj_cmd)
        {
            SqlConnection obj_conn = new SqlConnection(GetDatabaseConnStr("APP_DB_CONN_0"));
            obj_cmd.Connection = obj_conn;
            int new_record_sn = -2;
            try
            {
                obj_conn.Open();
                new_record_sn = Convert.ToInt32(obj_cmd.ExecuteScalar()); //如果沒有影響到任何一筆資料,將會回傳-1
            }
            catch (Exception ex)
            {
                ExceptionLog(ex);//發生例外事件,回傳-2
            }
            finally
            {
                obj_cmd.Dispose();
                obj_conn.Close();
                obj_conn.Dispose();
            }
            return new_record_sn;
        }

        /*
         *  傳入已設定好參數之 SqlCommand, 
         *  專則建立與 MS SQL 的連線, 並呼叫 SqlCommand 指定對資料表格進行 "UPDATE"、"DELETE" 的 Stored Procedure.
         *  執行成功, 回傳所影響的資料筆數
         *  執行失敗, 回傳 -2
         */
        public int EditData(SqlCommand obj_cmd) //EditData include "UPDATE"、"DELETE"
        {
            SqlConnection obj_conn = new SqlConnection(GetDatabaseConnStr("APP_DB_CONN_0"));
            obj_cmd.Connection = obj_conn;
            int effected_records = -2;
            try
            {
                obj_conn.Open();
                effected_records = obj_cmd.ExecuteNonQuery(); //如果沒有影響到任何一筆資料,將會回傳-1
            }
            catch (Exception ex)
            {
                ExceptionLog(ex);//發生例外事件,回傳-2
            }
            finally
            {
                obj_cmd.Dispose();
                obj_conn.Close();
                obj_conn.Dispose();
            }
            return effected_records;
        }

        /*
         *  傳入已設定好field/value pair之 SortedList,          
         *  回傳"Insert"用的欄位字串，如:"Field_1 , Field_2 , ...... "
         */
        public string GetInsertFieldList(SortedList list_key_value_pair)
        {
            StringBuilder str_field = new StringBuilder();

            for (int i = 0; i < list_key_value_pair.Keys.Count; i++)
            {
                if (i > 0)
                    str_field.Append(" , ");

                str_field.Append(list_key_value_pair.GetKey(i).ToString());
            }

            return str_field.ToString();
        }

        /*
         *  傳入已設定好field/value pair之 SortedList,          
         *  回傳"Insert"用的內容字串，如:"Value_1 , Value_2 , ...... "
         */
        public string GetInsertValueList(SortedList list_key_value_pair)
        {
            StringBuilder str_value = new StringBuilder();

            for (int i = 0; i < list_key_value_pair.Values.Count; i++)
            {
                if (i > 0)
                    str_value.Append(" , ");

                if (list_key_value_pair.GetByIndex(i) != null && list_key_value_pair.GetByIndex(i).ToString() != "")
                    str_value.Append("N'" + list_key_value_pair.GetByIndex(i).ToString() + "'");
                else
                    str_value.Append("NULL");
            }

            return str_value.ToString();
        }

        /*
         *  傳入已設定好field/value pair之 SortedList,          
         *  回傳"Update"用的內容字串，如:"Field_1 = Value_1 , Field_2 = Value_2 , ...... "
         */
        public string GetUpdateValueList(SortedList list_key_value_pair)
        {
            StringBuilder str_key_value = new StringBuilder();

            for (int i = 0; i < list_key_value_pair.Values.Count; i++)
            {
                if (i > 0)
                    str_key_value.Append(" , ");

                if (list_key_value_pair.GetByIndex(i) != null && list_key_value_pair.GetByIndex(i).ToString() != "")
                    str_key_value.Append(list_key_value_pair.GetKey(i).ToString() + " = N'" + list_key_value_pair.GetByIndex(i).ToString() + "' ");
                else
                    str_key_value.Append(list_key_value_pair.GetKey(i).ToString() + " = NULL ");
            }

            return str_key_value.ToString();
        }

        /*
         *  傳入已設定好field/value pair之 SortedList,          
         *  回傳"Where"用的內容字串，如:"Field_1 = Value_1 OR Field_2 = Value_2 OR ...... "
         */
        public string GetKeywordLikeList(SortedList list_key_value_pair)
        {
            StringBuilder str_key_value = new StringBuilder();

            for (int i = 0; i < list_key_value_pair.Values.Count; i++)
            {
                if (i > 0)
                    str_key_value.Append(" OR ");

                if (list_key_value_pair.GetByIndex(i) != null && list_key_value_pair.GetByIndex(i).ToString() != "")
                    str_key_value.Append(list_key_value_pair.GetKey(i).ToString() + " like '%" + list_key_value_pair.GetByIndex(i).ToString() + "%' ");
            }

            return str_key_value.ToString();
        }

        /*
         *  傳入已設定好field/value pair之 SortedList,          
         *  回傳"Where"用的內容字串，如:"Field_1 = Value_1 OR Field_2 = Value_2 OR ...... "
         */
        public string GetKeywordEqualList(SortedList list_key_value_pair)
        {
            StringBuilder str_key_value = new StringBuilder();

            for (int i = 0; i < list_key_value_pair.Values.Count; i++)
            {
                if (i > 0)
                    str_key_value.Append(" OR ");

                if (list_key_value_pair.GetByIndex(i) != null && list_key_value_pair.GetByIndex(i).ToString() != "")
                    str_key_value.Append(list_key_value_pair.GetKey(i).ToString() + " = '" + list_key_value_pair.GetByIndex(i).ToString() + "' ");
            }

            return str_key_value.ToString();
        }
    }
}
