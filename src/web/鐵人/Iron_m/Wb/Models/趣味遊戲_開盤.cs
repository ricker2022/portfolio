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
    public partial class 趣味遊戲_開盤
    {
        public string 遊戲編號 { get; set; }
        public long 開盤流水號 { get; set; }
        public string A選手 { get; set; }
        public string B選手 { get; set; }
        public int 累積張數 { get; set; }
        public System.DateTime 建立日期 { get; set; }
        public int 論壇識別 { get; set; }
    }
}
