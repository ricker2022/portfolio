using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Userinfo 的摘要描述
/// </summary>
[Serializable]
public class AdminInfo
{
   
    public int sn;
    public string id;
    public string email = "";
    public byte is_default = 0;
    public DateTime loginTime;
    public long[] auth_web_menu_list ;   

}


