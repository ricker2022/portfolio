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
    public partial class 趣味遊戲_下注
    {
        public string 遊戲編號 { get; set; }
        public string MoloKey { get; set; }
        public long 開盤流水號 { get; set; }
        public long 下注流水號 { get; set; }
        public int 下注張數 { get; set; }
        public string 輸贏 { get; set; }
        public bool 派彩YN { get; set; }
        public Nullable<System.DateTime> 派彩時間 { get; set; }
        public int 獲得鐵幣 { get; set; }
        public System.DateTime 建立日期 { get; set; }
        public int 論壇識別 { get; set; }
    }
}
