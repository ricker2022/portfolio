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
    public partial class 會員文章訂閱
    {
        public long 訂閱流水號 { get; set; }
        public int 屬性編號 { get; set; }
        public string 發文MoloKey { get; set; }
        public string 訂閱MoloKey { get; set; }
        public long 文章流水號 { get; set; }
        public string 標題 { get; set; }
        public System.DateTime 文章發佈日 { get; set; }
        public bool 通知YN { get; set; }
        public bool 讀取YN { get; set; }
        public System.DateTime 建立日期 { get; set; }
        public int 論壇識別 { get; set; }
    }
}
