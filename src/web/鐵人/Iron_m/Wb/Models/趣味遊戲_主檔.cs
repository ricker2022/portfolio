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
    public partial class 趣味遊戲_主檔
    {
        public string 遊戲編號 { get; set; }
        public string 遊戲項目 { get; set; }
        public Nullable<System.DateTime> 比賽時間 { get; set; }
        public bool 比賽YN { get; set; }
        public Nullable<System.DateTime> 封盤時間 { get; set; }
        public bool 封盤YN { get; set; }
        public int 單複選 { get; set; }
        public string 比賽賽制 { get; set; }
        public string 遊戲玩法 { get; set; }
        public string 直播連結 { get; set; }
        public int 總投注 { get; set; }
        public int 狀態 { get; set; }
        public long 比賽結果 { get; set; }
        public string 備註 { get; set; }
        public int 論壇回收 { get; set; }
        public Nullable<System.DateTime> 派彩時間 { get; set; }
        public System.DateTime 上傳時間 { get; set; }
        public string 異動者 { get; set; }
        public int 論壇識別 { get; set; }
        public string 標題 { get; set; }
    }
}
