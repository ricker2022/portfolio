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
    
    public partial class 廠商
    {
        public int 廠商編號 { get; set; }
        public string 廠商名稱 { get; set; }
        public string 廠商圖示 { get; set; }
        public bool 啟用YN { get; set; }
        public bool 唯讀YN { get; set; }
        public string 異動者 { get; set; }
        public System.DateTime 建立日期 { get; set; }
    }
}
