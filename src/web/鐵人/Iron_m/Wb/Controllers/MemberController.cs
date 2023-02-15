using Ams.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Wb.Common;
using Wb.Models;
using Wb.Pager;

namespace Wb.Controllers
{
    [Serializable]
    public class MemberController : FrontendController
    {
        public string ErrMsg = "";

        public ActionResult Index(int page = 1)
        {            
            Init();
            CheckLogin();
            return View();
        }

        public ActionResult Info(string molo)
        {
            Init();
            string moloKey = WbUtil.DecryptDES(molo);
            M_Member MH = new M_Member();
            Userinfo user = MH.getProfile(moloKey);//對方
            user.bindSentai();
            ViewBag.add_friend_btn = user.isFriend(myProfile.nickname, user.nickname);

            return View(user);
        }

        public ActionResult MyInfo()
        {
            Init();
            CheckLogin();
            
            M_Member MH = new M_Member();
            Userinfo user = MH.getProfile(myProfile.molokey);
            user.bindSentai();
            user.bindDecline();
            myProfile = user;

            return View(user);
        }

        public ActionResult PersonalRule()
        {
            return View();
        }

        public ActionResult Edit()
        {
            //Init();
            //CheckLogin();

            myProfile.isAgree = true;

            if (myProfile.isButen)//已經是會員
            {
                MH.modifyUser(myProfile.molokey, myProfile.nickname, 1);
                return Redirect(Url.RouteUrl("Default", new { controller = "home", action = "index" }));
            }

            AddJs("js/jquery_ui/js/jquery-ui-1.10.4.min.js");
            AddCss("js/jquery_ui/css/ui-lightness/jquery-ui-1.10.4.min.css");

            ViewBag.member_edit = 1;

            

            return View(myProfile);
        }

        [HttpPost]
        public ActionResult Edit(FormCollection fc)
        {
            Init();
            CheckLogin();

            string nickname = fc["nickname"];
            string email = fc["email"];
            DateTime birthday = DateTime.Parse(fc["birthday"]);
            string sex = fc["sex"];
            Dictionary<string, object> result = new Dictionary<string, object>();

            M_Member MH = new M_Member();
            MH.addUser(myProfile.molokey, nickname, sex, birthday, myProfile.cellphone,email,GetIP(), "", "", myProfile.moloYN);

            if (MH.ErrCode == 0)
            {
                //更新上次登入時間
                MH.UpdateGameUser(myProfile.molokey, DateTime.Now);
                //同意個資
                MH.modifyUser(myProfile.molokey,myProfile.nickname,1);
                myProfile.isAgree = true;

                myProfile.isButen = true;
                myProfile.Nickname = nickname;
                myProfile.sex = sex;
                myProfile.email = email;
                myProfile.birth = birthday;

                result.Add("message","註冊成功");
                result.Add("success", "ok");
                return Redirect(Url.RouteUrl("Default", new { controller = "home", action = "index" }));
            }
            else
            {

                result.Add("message", myStatic.msg(MH.ErrCode));
                result.Add("success", "ng");
                return Json(result, JsonRequestBehavior.AllowGet);
            }

        }


        public ActionResult Friends(int page = 1)
        {
            Init();
            CheckLogin();
            M_Member m_member = new M_Member();
            PagedList<好友> friend_list = (PagedList<好友>)m_member.GetFriendList(myProfile.nickname, page, 50,1);
            PagedList<好友> nfriend_list = (PagedList<好友>)m_member.GetFriendList(myProfile.nickname, page, 50,0);
            ViewBag.nfriend_list = nfriend_list;
            //page count
            ViewBag.friend_page_count = friend_list.TotalPageCount;

            return View(friend_list);
        }


        public ActionResult Usermsg(int page = 1)
        {
            
            Init();
            CheckLogin();

            M_Member MH = new M_Member();

            DataSet ds = MH.DSimsgGroup(myProfile.Nickname,1,8);
            IList<imsgObj> result = new List<imsgObj>();

            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    imsgObj obj = new imsgObj(dr,myProfile);
                    result.Add(obj);
                }
            }

            PagedList<imsgObj> friend_list = new PagedList<imsgObj>(result, page, 50);

            return View(friend_list);

        }


        public ActionResult MsgBox(string name = "")
        {
            Init();
            CheckLogin();
            
            
            ViewBag.user_nickname = myProfile.nickname;
            ViewBag.user_icon = myProfile.icon;

            M_Member MH = new M_Member();

            DataSet ds = MH.DSimessage(0, myProfile.Nickname, name,true, 1, 10);
            List<imsgObj> result = new List<imsgObj>();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = ds.Tables[0].Rows.Count - 1; i >= 0; i--)
                {
                    imsgObj obj = new imsgObj(ds.Tables[0].Rows[i],myProfile);
                    result.Add(obj);
                }
                
            }
            //設為已讀
            if (name != "")
            {
                MH.editMessage(0,name,myProfile.Nickname, 1);
            }
            ViewBag.friend_nickname = name;

            return View(result);
        }


        public ActionResult AjaxShowPreMessage(string f_molo_key, string first_date)
        {
            Init();
            
            Dictionary<string, object> result = new Dictionary<string, object>();


            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                M_Member m_member = new M_Member();
                會員 f_member = m_member.GetMember(WbUtil.DecryptDES(f_molo_key));

                List<即時訊息> msg_list = m_member.GetPreMessage(myProfile.nickname, f_member.暱稱, first_date, 10);

                JsonNetResult jsonNetResult = new JsonNetResult();
                jsonNetResult.Formatting = Newtonsoft.Json.Formatting.None;
                jsonNetResult.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore;


                Dictionary<string, Object> jo;
                Dictionary<string, Object>[] jsonAry = new Dictionary<string, Object>[msg_list.Count()];

                for (int i = 0; i < msg_list.Count(); i++)
                {

                    jo = new Dictionary<string, Object>();
                    jo.Add("poster", msg_list[i].訊息發送者);
                    jo.Add("receiver", msg_list[i].訊息發送者);
                    jo.Add("message", msg_list[i].訊息內容);
                    jo.Add("org_post_date", string.Format("{0:yyyy-MM-d HH:mm:ss}", msg_list[i].建立日期));
                    if (string.Format("{0:yyyy/MM/d}", msg_list[i].建立日期) == string.Format("{0:yyyy/MM/d}", DateTime.Now))
                    {
                        jo.Add("post_date", string.Format("{0:hh:mm}", msg_list[i].建立日期));
                    }
                    else
                    {
                        jo.Add("post_date", string.Format("{0:MM/d hh:mm}", msg_list[i].建立日期));
                    }
                    
                    jsonAry[i] = jo;
                }

                jsonNetResult.Data = jsonAry;
                return jsonNetResult;
              
                //result.Add("message", message);
                //result.Add("success", "ok");
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public ActionResult AjaxAddToFriend(string name)
        {
            Init();

            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Member MH = new M_Member();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                if (MH.sendfriendConfirm(myProfile.Nickname, name))
                {
                    result.Add("message", "成功送出好友邀請");
                    result.Add("success", "ng");
                }
                else if (MH.ErrCode == 18)
                {
                    result.Add("message", "動作重覆");
                    result.Add("success", "ng");
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public ActionResult AjaxAgreeFriend(string name)
        {
            Init();
            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Member m_member = new M_Member();

            if (myProfile == null)
            {
                result.Add("message", "請先登入");
                result.Add("success", "ng");
            }
            else
            {
                bool isok = false;
                if (name != "")
                    isok = m_member.Confirmfriend(name, myProfile.Nickname);

                if (isok)
                {
                    result.Add("message", "加入好友成功");
                    result.Add("success", "ok");
                }
                else
                {
                    result.Add("message", "操作失敗");
                    result.Add("success", "ng");
                }

            }

            return Json(result, JsonRequestBehavior.AllowGet);

        }

        public ActionResult AjaxSign()
        {
            Init();
            Dictionary<string, object> result = new Dictionary<string, object>();
            M_Member m_member = new M_Member();

            myProfile.CheckSignin();
            if (myProfile.signinToday)
            {
                result.Add("message", "今日已簽到!");
                result.Add("success", "ng");
            }
            else
            {
                string Msg = moloFreeCharge(myProfile.molokey);
                if (Msg == "")
                {
                    myProfile.SignIn();
                    Msg = "<p style='line-height:30px;margin:0'>" + DateTime.Now.ToString("yyyy年M月d日") + "</p><p style='line-height:30px;margin:0'>恭喜您簽到成功</p><p style='line-height:30px;margin:0'>今日moLo紅利 2</p>";
                }
                else {
                    Msg = "操作失敗" + Msg;
                }
                result.Add("message",  Msg);
                result.Add("success", "ok");
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public string moloFreeCharge(string molo, int method = 3, string desc = "鉄人論壇")
        {
            ErrMsg = "";
            desc += "-" + myStatic.siteNow;
            string value = HttpPostQ(myStatic.molofreechargeUrl, "mid=" + molo + "&method=" + method + "&desc=" + desc);
            if (value != "1")
            {
                ErrMsg = value;
            }
            return ErrMsg;
        }
        public string HttpPostQ(string uri, string parameters)
        {
            WebRequest webRequest = WebRequest.Create(uri);
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.Method = "POST";

            byte[] bytes = Encoding.UTF8.GetBytes(parameters);

            Stream os = null;

            try
            { // send the Post
                webRequest.ContentLength = bytes.Length;   //Count bytes to send
                os = webRequest.GetRequestStream();
                os.Write(bytes, 0, bytes.Length);         //Send it
            }
            catch (WebException ex)
            {
                ErrMsg = "HttpPost: Request error" + ex.Message;
            }
            finally
            {
                if (os != null)
                {
                    os.Close();
                }
            }

            try
            {
                WebResponse webResponse = webRequest.GetResponse();

                if (webResponse == null)
                { return null; }
                StreamReader sr = new StreamReader(webResponse.GetResponseStream());
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                ErrMsg = "HttpPost: Response error" + ex.Message;
            }
            return null;
        } // end HttpPost

        public ActionResult alertMsg(string txt="")
        {
            Dictionary<string, object> result = new Dictionary<string, object>();

            result.Add("message", txt);
            result.Add("success", "ok");
            
            
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult txtMsg(string msg = "")
        {

            ViewBag.msg = msg;

            return View();
        }
    }
}
