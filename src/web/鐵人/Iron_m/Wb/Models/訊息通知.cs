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
    public partial class 訊息通知
    {
        public long 訊息編號 { get; set; }
        public string 訊息發送者 { get; set; }
        public string 訊息接收者 { get; set; }
        public bool 讀取YN { get; set; }
        public string 標題 { get; set; }
        public string 訊息內容 { get; set; }
        public int 傳送次數 { get; set; }
        public string 連結網址 { get; set; }
        public System.DateTime 建立日期 { get; set; }
    }
}
