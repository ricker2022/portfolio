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
    public partial class 趣味遊戲_主客
    {
        public long 流水號 { get; set; }
        public string 遊戲編號 { get; set; }
        public int 場次 { get; set; }
        public long 選手流水號 { get; set; }
        public int 排序 { get; set; }
        public string 選手名稱 { get; set; }
        public string 位置 { get; set; }
        public string 選用角色 { get; set; }
        public string 備註 { get; set; }
        public System.DateTime 建立日期 { get; set; }
    }
}
