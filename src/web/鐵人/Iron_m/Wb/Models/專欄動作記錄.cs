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

    [Serializable]
    public partial class 專欄動作記錄
    {
        public long 動作記錄編號 { get; set; }
        public long 專欄流水號 { get; set; }
        public int 動作識別 { get; set; }
        public string 執行動作 { get; set; }
        public string 備註 { get; set; }
        public string 異動者 { get; set; }
        public System.DateTime 建立日期 { get; set; }
        public int 論壇識別 { get; set; }
    }
}
