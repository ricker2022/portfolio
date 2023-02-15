using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Wb.Models
{
    [Serializable]
    public class IronDBBase
    {
        protected IronEntities db;
        SqlConnection G3conn;
        public int ErrCode = 0;

        public IronDBBase()
        {
            db = new IronEntities();

            switch(myStatic.localmode){
                case 0:
                    G3conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OfficialIron"].ConnectionString);
                    break;
                case 1:
                    G3conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IronConnectionLocal"].ConnectionString);
                    break;
                case 2:
                    G3conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IronConnection"].ConnectionString);
                    break;
            }
        }

        public IQueryable<專欄回覆> GetSubject()
        {
            return db.專欄回覆;
        }


        public 論壇列表 GetGameBySn(int sn)
        {
            var data = db.論壇列表.Where(a => a.論壇識別 == sn);
            if (data.Count() > 0)
            {
                論壇列表 item = data.First();
                return item;
            }
            else
            {
                return new 論壇列表();
            }
        }

        #region 預儲的
        protected DataSet GetDS(string dtName, List<SqlParaObj> paramlist)
        {
            //spCount++;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = new SqlCommand(dtName, getConnection(dtName));
            da.SelectCommand = new SqlCommand(dtName, G3conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            foreach (SqlParaObj para in paramlist)
            {
                switch (para.type)
                {
                    case SqlDbType.BigInt:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = Int64.Parse(para.value.ToString());
                        break;
                    case SqlDbType.Int:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = (int)para.value;
                        break;
                    case SqlDbType.TinyInt:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value;
                        break;
                    case SqlDbType.SmallInt:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value;
                        break;
                    case SqlDbType.NVarChar:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value.ToString();
                        break;
                    case SqlDbType.Bit:
                        bool value;
                        if (para.value.ToString() == "0")
                            value = false;
                        else if (para.value.ToString() == "1")
                            value = true;
                        else
                            value = bool.Parse(para.value.ToString());

                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = value;
                        break;
                    case SqlDbType.DateTime:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value.ToString();
                        break;
                }
            }
            da.Fill(ds);
            return ds;
        }

        protected DataSet GetDS(string dtName, List<SqlParaObj> paramlist, string Egs, out int errcode)
        {
            //spCount++;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = new SqlCommand(dtName, getConnection(dtName));
            da.SelectCommand = new SqlCommand(dtName, G3conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            errcode = 0;
            foreach (SqlParaObj para in paramlist)
            {
                switch (para.type)
                {
                    case SqlDbType.BigInt:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = (Int64)para.value;
                        break;
                    case SqlDbType.Int:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = (int)para.value;
                        break;
                    case SqlDbType.TinyInt:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value;
                        break;
                    case SqlDbType.SmallInt:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value;
                        break;
                    case SqlDbType.NVarChar:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value.ToString();
                        break;
                    case SqlDbType.Bit:
                        bool value;
                        if (para.value.ToString() == "0")
                            value = false;
                        else if (para.value.ToString() == "1")
                            value = true;
                        else
                            value = bool.Parse(para.value.ToString());

                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = value;
                        break;
                    case SqlDbType.DateTime:
                        da.SelectCommand.Parameters.Add(para.paramName, para.type).Value = para.value.ToString();
                        break;
                }
            }
            da.SelectCommand.Parameters.Add(Egs, SqlDbType.Int).Direction = ParameterDirection.Output;
            da.Fill(ds);
            string qq = da.SelectCommand.Parameters[Egs].Value.ToString();
            if (qq != "")
                errcode = int.Parse(da.SelectCommand.Parameters[Egs].Value.ToString());
            return ds;
        }

        #endregion
    }
    public class SqlParaObj
    {
        public string paramName;
        public SqlDbType type;
        public object value;
        public int size;

        public SqlParaObj(string name, SqlDbType type, object value)
        {
            this.paramName = name;
            this.type = type;
            this.value = value;
        }

        public SqlParaObj(string name, SqlDbType type, bool ex, int size = 0)
        {
            this.paramName = name;
            this.type = type;
            this.size = size;
            this.value = ex;
        }
    }
}