using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Wb.Common;
using Wb.Models;
using System.Collections;
using System.Web.Caching;
using Newtonsoft.Json;
using System.Net;
using System.Text;
using System.IO;
using System.Web.Routing;
using System.Net.Http;
using System.Web.Security;
using System.Data;

namespace Wb.Controllers
{
    /*
        前端核心程式
    */
    [Serializable]
    public class FrontendController : Controller
    {
        
        protected string template_id = "default"; //使用template

        public String media_bank_path = "/upload/media/";  //媒體庫路徑 
        public String website_path = "/upload/website/";  //Banner路徑
        public String index_path = "/upload/index/";  //首頁檔案路徑
        public String download_path = "/upload/download/";  //首頁檔案路徑(如要改為程式讀入，可寫在建構子)
        public string game_id = "SCII";
        public int game_sn = 1;

        protected bool is_login = false; //用來判斷會員是否已登入
        public M_Member MH = new M_Member();


        public FrontendController()
        {
            ViewBag.PageTitle = "";

            //取得實體路徑&虛擬路徑
            //---------------------------------------------------------------------------------------
            ViewBag.website_path = website_path;
            ViewBag.media_bank_path = media_bank_path;
            ViewBag.index_path = index_path;
            ViewBag.download_path = download_path;
            ViewBag.website_virtual_path = website_path;
            //---------------------------------------------------------------------------------------

            //是否顯示sub title
            ViewBag.is_show_subtitle = true;

        }

        public void Init()
        {
            //myProfile = null;
            CheckCookieData();
            if (myProfile != null && myProfile.nologinDisplay != "")
            {
                RedirectUser();
            }

            //目前遊戲
            string game_id = RouteData.Values["game"].ToString();
            this.game_id = game_id;

            switch (game_id)
            {
                case "SCII" :
                    this.game_sn = 1;
                    break;

                case "lol":
                    this.game_sn = 2;
                    break;

                case "stone":
                    this.game_sn = 3;
                    break;

            }
            SiteType nowtype = (SiteType)Enum.Parse(typeof(SiteType), game_id);
            myStatic.siteNow = nowtype;

            ViewBag.game_id = game_id;

            ViewBag.cur_controller = HttpContext.Request.RequestContext.RouteData.Values["controller"].ToString().ToLower();
            ViewBag.cur_action = HttpContext.Request.RequestContext.RouteData.Values["action"].ToString().ToLower();
            ViewBag.signYN = false;

            if (myProfile != null)
            {
                //M_Team m_team = new M_Team();
                //業餘戰隊 amateur_team = m_team.GetAmateurTeamByNickName(myProfile.nickname, this.game_sn);
                ViewBag.amateur_team = myProfile.myteamProfile;
                ViewBag.signYN = myProfile.signinToday;

                M_Member m_member = new M_Member();
                //即時訊息
                if (m_member.HasNoReadMessage())
                    ViewBag.hasReadMsg = 1;
                //好友
                if (m_member.HasFriendRequest())
                    ViewBag.hasFriendRequest = 1;
                
            }


        }

        public void Redirect2Home()
        {
            Response.Redirect(Url.RouteUrl("Default", new { controller = "home", action = "index" }));
        }

        public void Redirect2Login()
        {
            Response.Redirect(Url.RouteUrl("Default", new { action = "Login" }));
            return;
        }
        public void RedirectUser()
        {
            string url = userDecline(1);
            if (url!="")
                Response.Redirect(url);
            return;
        }
        public ActionResult Login()
        {
            // 登入時清空所有 Session 資料
            Session.RemoveAll();
            return LoginRedirect();
            
        }
        public ActionResult testLoginRedirect(string user="")
        {
            if (Request["user"] == "阿森")
                myProfile = new Userinfo("3005AC88261E4899", "+886952204141");//阿森
            else if (Request["user"] == "wei2")
                myProfile = new Userinfo("00007", "+886955486806");
            else if (Request["user"] == "Irisviel")
                myProfile = new Userinfo("00004","+886900141245");
            else
                myProfile = new Userinfo("394CDF0C710C48F4", "+886928092939");
            

            if (!userProcess())//第一次登入
            {
                return Redirect(Url.RouteUrl("Default", new { controller = "Member", action = "Edit" }));
            }
            //return Redirect(Url.RouteUrl("Default", new { controller = "home", action = "index" }));
            return Redirect(userDecline());

        }
        public ActionResult LoginRedirect()
        {
            string nowTime = string.Format("{0:yyyy-MM-d hh:mm:ss}", DateTime.Now);
            return Redirect("https://m1.moLo.gs/login.html?Language=TW&Region=886&Category=login&ServiceName=293&Time=" + nowTime + "&ReturnURL=" + moloLoginUrl());

        }
        
        /// <summary>
        /// 與molo 登入服務串接
        /// </summary>
        /// <param name="fc"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult MoloLogin(FormCollection fc)
        {
            string MoLoCode = fc["MoLoCode"];

            WebRequest request = WebRequest.Create("https://m1.moLo.gs/moLocodeCheck");
            request.Method = "POST";
            string postData = "moLoCode=" + MoLoCode;
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = byteArray.Length;
            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();
            WebResponse response = request.GetResponse();
            Console.WriteLine(((HttpWebResponse)response).StatusDescription);
            dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();         
            reader.Close();
            dataStream.Close();
            response.Close();


            string[] result = responseFromServer.Split('\t');
            if (result[0] == "1")
            {
                //WriteLog("OK");
                string moloKey = result[1];
                string phone = result[2];
                string ip = result[3];
                string email = result[4];

                //WriteLog("OK" + result[1] + "--" + result[2] + "--" + result[3] + "--" + result[4]);

                myProfile = new Userinfo(moloKey, phone);
                

                if (!userProcess())//第一次登入
                {
                    return Redirect(Url.RouteUrl("Default", new { controller = "Member", action = "PersonalRule" }));
                }
                //WriteLog("userDecline = " + userDecline());
                return Redirect(userDecline());

            }
            else
            {
                return Redirect(Url.RouteUrl("Default", new { controller = "home", action = "index" }));
            }
        }

        public void CheckCookieData()
        {
            if (myProfile == null && Request.Cookies["IronUserSettings"] != null)
            {
                string moloKey = ""; string phone = "";
                if (Request.Cookies["IronUserSettings"][WbUtil.EncryptDES("mkey")] != null && Request.Cookies["IronUserSettings"][WbUtil.EncryptDES("phone")] != null)
                {
                    moloKey = WbUtil.DecryptDES(Request.Cookies["IronUserSettings"][WbUtil.EncryptDES("mkey")].ToString());
                    phone = WbUtil.DecryptDES(Request.Cookies["IronUserSettings"][WbUtil.EncryptDES("phone")].ToString());
                    if (phone == "" && moloKey != "")
                        phone = MH.GetMember(moloKey).門號;
                    if (phone != "" && moloKey != "")
                    {
                        myProfile = new Userinfo(moloKey, phone);
                        userProcess();
                    }
                }
                
            }
        }

        public void SetCookieData()
        {
            if (myProfile == null)
                return;
            HttpCookie myCookie = new HttpCookie("IronUserSettings");
            myCookie[WbUtil.EncryptDES("mkey")] = WbUtil.EncryptDES(myProfile.molokey);
            myCookie[WbUtil.EncryptDES("ip")] = WbUtil.EncryptDES(myProfile.lastIP);
            myCookie[WbUtil.EncryptDES("phone")] = WbUtil.EncryptDES(myProfile.cellphone);
            myCookie["data"] = DateTime.Now.ToString();
            myCookie.Expires = DateTime.Now.AddMonths(3);          
            Response.Cookies.Add(myCookie);
        }

        protected string GetIP()
        {
            string myIP = "";
            myIP = Request.ServerVariables["REMOTE_ADDR"];
            return myIP;
        }
        protected string moloLoginUrl()
        {
            Uri uri = Request.Url;
            string moloLoginUrl = "";
            string host = uri.Scheme + Uri.SchemeDelimiter + uri.Host + ":" + uri.Port;

            if (myStatic.localmode == 0)
                moloLoginUrl = host + Url.RouteUrl("default", new { action = "MoloLogin" });
                //moloLoginUrl = "http://www.ironforum.com.tw/mobile/SCII/News/MoloLogin";
            else if (uri.Host == "125.227.81.67")
                moloLoginUrl = "http://125.227.81.67:82/mobile/SCII/News/MoloLogin";
            else
                moloLoginUrl = host + Url.RouteUrl("default", new { action = "MoloLogin" });
            

            return moloLoginUrl;
        }
        public string GetLanIPAddress()
        {
            //Get the Host Name
            string stringHostName = Dns.GetHostName();
            //Get The Ip Host Entry
            IPHostEntry ipHostEntries = Dns.GetHostEntry(stringHostName);
            //Get The Ip Address From The Ip Host Entry Address List
            System.Net.IPAddress[] arrIpAddress = ipHostEntries.AddressList;
            return arrIpAddress[arrIpAddress.Length - 1].ToString();
        }


        public void CheckLogin()
        {
            if (myProfile == null)
            {
                Redirect2Login();
                //return Redirect(Url.RouteUrl("Default", new { controller = "home", action = "index" }));
            }
            else if (string.IsNullOrEmpty(myProfile.molokey))
            {
                Redirect2Login();
            }            
        }

        public RedirectToRouteResult Logout()
        {
            try
            {
                myProfile = null;

                if (Request.Cookies["IronUserSettings"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("IronUserSettings");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }
            }
            catch
            {
            }
            return  RedirectToAction("Index", "Home");

        }

        public object GetCacheData(string cacheKey)
        {
            var cache = HttpContext.Cache;
            var content = cache.Get(cacheKey);
            return content;
        }

        public void SetCacheData(string cacheKey, object data, int seconds = 60)
        {
            var cache = HttpContext.Cache;
            cache.Insert(cacheKey, data, null, DateTime.Now.AddSeconds(seconds), Cache.NoSlidingExpiration);
        }

        /**
         * 移除cache
         */
        public void RemoveCacheData(string cacheKey)
        {
            var cache = HttpContext.Cache;
            cache.Remove(cacheKey);

        }

        /**
        * 移除 all cache
        */
        public void RemoveAllCache()
        {
            foreach (DictionaryEntry dEntry in HttpContext.Cache)
            {
                HttpContext.Cache.Remove(dEntry.Key.ToString());
            }
        }

        public void AddJs(string js_path = "")
        {
            ViewBag.js += "<script type=\"text/javascript\" src=\"" + Url.Content("~/templates/" + template_id + "/" + js_path) + "\"></script>\r";
        }

        public void AddCss(string css_path = "")
        {
            ViewBag.css += "<link href=\"" + Url.Content("~/templates/" + template_id + "/" + css_path) + "\" rel=\"stylesheet\" type=\"text/css\" />\r";
        }



        public RedirectToRouteResult fUrl(string action, string controllerName = "", object addValues = null, string ignoreValues = "")
        {
            RouteValueDictionary routevalue = new RouteValueDictionary(RouteData.Values);

            foreach (string key in Request.QueryString.Keys)
            {
                routevalue[key] = Request.QueryString[key].ToString();
            }


            if (addValues != null)
            {
                RouteValueDictionary r = new RouteValueDictionary(addValues);
                foreach (var item in r)
                {
                    routevalue[item.Key] = item.Value;
                }
            }


            if (controllerName != "")
            {
                routevalue["controller"] = controllerName;
            }

            if (!string.IsNullOrEmpty(action))
            {
                routevalue["action"] = action;
            }
            



            //移除忽略的參數
            if (ignoreValues != null && ignoreValues != "")
            {
                string[] ignoreAry = ignoreValues.Split(',');

                RouteValueDictionary r = new RouteValueDictionary(ignoreValues);
                foreach (string key in ignoreAry)
                {
                    routevalue.Remove(key);
                }
            }

            return RedirectToRoute("Default", routevalue);
            //return Redirect(Url.RouteUrl("Default",routevalue);
            //return RedirectToAction(action, routevalue);
        }




        public ActionResult ReUrl()
        {
            return View();
        }

        public bool userProcess()
        {
            M_Member MH = new M_Member();
            int count = 0;
            //判斷有無會員
            DataSet ds = MH.userLogin(myProfile.molokey, out count);
            MH.afterLogin(myProfile.molokey, myProfile.cellphone, GetIP());
            if (count == 0)
                return false;
            else
            {
                myProfile.BuData(ds);
                myProfile.bindDecline();
                myProfile.isButen = true;
                myProfile.bindSentai();

                //更新上次登入時間
                MH.UpdateGameUser(myProfile.molokey, DateTime.Now);
                //判斷合法, 並導引
                //userDecline();
                //設定cookie
                SetCookieData();
                return true;
            }
        }

        string userDecline(int args = 0)
        {
            string msgTxt = "";
            if (myProfile.nologinDisplay != "")
            {
                msgTxt = "停權中"; //myProfile = null;
                return Url.RouteUrl("Default", new { controller = "Member", action = "txtMsg", msg = msgTxt });
            }
            else if (myProfile.nopostDisplay != "")
            {
                msgTxt = "禁言中";
                return Url.RouteUrl("Default", new { controller = "Member", action = "txtMsg", msg = msgTxt });
            }
            else if (args == 0)
                return Url.RouteUrl("Default", new { controller = "home", action = "index" });
            else
                return "";
        }

        public Userinfo myProfile
        {
            get
            {
                if (Session["mobile_userinfo"] == null)
                {
                    return null;
                }
                else
                {
                    return Session["mobile_userinfo"] as Userinfo;
                }
            }
            set
            {
                M_Member.myProfile = value;
            }
        }

        protected void WriteLog(string LogMessage)
        {
            FileStream Logfile = new FileStream("c:\\LOG\\LogMessage_c" + System.DateTime.Now.ToString("yyyy-MM-dd-HH") + ".txt", FileMode.Append, FileAccess.Write, FileShare.None);
            StreamWriter writer = new System.IO.StreamWriter(Logfile, System.Text.Encoding.GetEncoding("utf-8"));

            writer.WriteLine("-----------------------------------------------------");
            writer.WriteLine(System.DateTime.Now.ToString());
            writer.WriteLine("值↓");
            writer.WriteLine(LogMessage);
            writer.WriteLine("-----------------------------------------------------\n\n");
            writer.Close();
        }
    }


}
