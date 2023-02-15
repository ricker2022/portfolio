using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Wb.Models
{
    [Serializable]
    public class Friend
    {
        public 會員 member { get; set; }
        //public 即時訊息 rmsg { get; set; }
        public bool hasMessage { get; set; }
        public string LastMessage { get; set; }
        public System.DateTime LastTime { get; set; }

        public Friend()
        {
            hasMessage = false;
        }


    }
}