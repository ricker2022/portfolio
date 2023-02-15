using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Wb.Models;


/// <summary>
/// tempAfterObj 的摘要描述
/// 會員異動_經驗值的回傳
/// </summary>
[Serializable]
public class tempAfterObj
{
    M_Member MH = new M_Member();

    public int coin;
    int type;
    public string exnote;
    public string molo;
    public string memo;
    public string errmsg = "";
    public string editor = "";

    //新增獎勵時用的
    public tempAfterObj(DataRow dr, string molo, string memo)
    {
        coin = int.Parse(dr["贈送鐵幣"].ToString());
        type = int.Parse(dr["異動識別"].ToString());
        exnote = dr["異動說明"].ToString();
        this.molo = molo;
        this.memo = memo;
    }

    //回收獎勵時用的
    public tempAfterObj(DataRow dr)
    {
        type = int.Parse(dr["異動識別"].ToString());
        exnote = dr["異動說明"].ToString();
        molo = dr["MoloKey"].ToString();
        coin = int.Parse(dr["異動額"].ToString());
        memo = dr["備註"].ToString();
        editor = dr["異動者名稱"].ToString();
    }

    public UserCoinChangeType etype
    {
        get
        {
            return (UserCoinChangeType)type;
        }
    }

    public void Excute()
    {
        MH.UserCoinCange(molo, etype, coin, exnote, memo); //備註是有才傳, 通常都傳流水號

        //if (MH.ErrCode != 0)
        //    errmsg = errHandler.msg(UH.ErrCode);
    }
}
