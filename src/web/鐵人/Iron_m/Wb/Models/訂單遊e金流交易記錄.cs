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
    
    public partial class 訂單遊e金流交易記錄
    {
        public string 訂單編號 { get; set; }
        public int 金額 { get; set; }
        public Nullable<int> 金流錯誤代碼 { get; set; }
        public string 交易狀態 { get; set; }
        public string 金流平台交易代號 { get; set; }
        public System.DateTime 建立時間 { get; set; }
        public Nullable<System.DateTime> 更新時間 { get; set; }
        public int 信用卡3DYN { get; set; }
    }
}
