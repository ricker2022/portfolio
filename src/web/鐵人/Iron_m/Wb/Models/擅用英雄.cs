//------------------------------------------------------------------------------
// <auto-generated>
//    這個程式碼是由範本產生。
//
//    對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//    如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Wb.Models
{
    using System;
    using System.Collections.Generic;
    using System.Data;

    [Serializable]
    public partial class 擅用英雄
    {
        public long 流水號 { get; set; }
        public int 論壇識別 { get; set; }
        public long 選手流水號 { get; set; }
        public string 選手名稱 { get; set; }
        public string 英雄名稱 { get; set; }

        public string 圖片路徑 = "";


        public 擅用英雄() { }
        public 擅用英雄(DataRow dr)
        {
            流水號 = long.Parse(dr["流水號"].ToString());
            論壇識別 = int.Parse(dr["論壇識別"].ToString());
            選手流水號 = long.Parse(dr["選手流水號"].ToString());
            選手名稱 = dr["選手名稱"].ToString();
            英雄名稱 = dr["英雄名稱"].ToString();
            圖片路徑 = dr["圖片路徑"].ToString();
        }
    }
}
