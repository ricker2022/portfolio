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
    public partial class 影片回覆
    {
        public long 影片流水號 { get; set; }
        public long 回覆流水號 { get; set; }
        public string MoloKey { get; set; }
        public string 內容 { get; set; }
        public int 回覆狀態 { get; set; }
        public bool 置頂YN { get; set; }
        public System.DateTime 置頂時間 { get; set; }
        public bool 隱藏YN { get; set; }
        public System.DateTime 建立日期 { get; set; }
        public int 論壇識別 { get; set; }
        public int 推文數 { get; set; }
    }
}
