using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using System.IO;
using System.Web.Routing;
using System.Text;
using Wb.Models;
using Wb.Common;

namespace Wb.Common
{
    public static class WbHelper
    {

        static Regex LineEnding = new Regex(@"(\r\n|\r|\n)+");


        //顯示錯誤訊息
        public static MvcHtmlString GetErrorMsg( Dictionary<string, string> error, string key)
        {
            if (error == null)
            {
                return new MvcHtmlString("");
            }
            else if (!error.ContainsKey(key))
            {
                return new MvcHtmlString("");
            }
            else
            {
                return new MvcHtmlString(error[key]);
            }
        }

        //顯示錯誤訊息
        public static MvcHtmlString ErrorMsg(this HtmlHelper html, string key)
        {
            Dictionary<string, string> error = (Dictionary<string, string>)html.ViewContext.TempData["error"];
            if (error == null)
            {
                return new MvcHtmlString("");
            }
            else if (!error.ContainsKey(key))
            {
                return new MvcHtmlString("");
            }
            else
            {
                return new MvcHtmlString(error[key]);
            }
        }



   
        //回傳 HTTP URL
        public static MvcHtmlString GetHttpUrl(this HtmlHelper html, string urlString)
        {
            if (urlString == null || urlString == string.Empty)
            {
                return new MvcHtmlString("");
            }
            else if (urlString.IndexOf("http://") != 0)
            {
                return new MvcHtmlString("http://" + urlString);
            }
            else
            {
                return new MvcHtmlString(urlString);
            }
        }

        public static MvcHtmlString StripTags(this HtmlHelper html, string source)
        {
            char[] array = new char[source.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < source.Length; i++)
            {
                char let = source[i]; if (let == '<') { inside = true; continue; } if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new MvcHtmlString(new string(array, 0, arrayIndex));
        }

        public static string FilterScript(this HtmlHelper html, string source)
        {
            return source.Replace("<script", "");
        }


       
        //nl2br
        public static MvcHtmlString Nl2br(this HtmlHelper html, string text, bool isXhtml = true)
        {
            if (text == null) 
            {
                text = "";
            }
            return MvcHtmlString.Create(Nl2br(text, isXhtml));
        }

        //nl2br
        public static string Nl2br( string text, bool isXhtml = true)
        {
            if (text == null)
            {
                return "";
            }
            var encodedText = HttpUtility.HtmlEncode(text);
            var replacement = isXhtml ? "<br />" : "<br>";
            return LineEnding.Replace(encodedText, replacement);
        }

        public static MvcHtmlString Nl2li(this HtmlHelper html, string text = "", string prefix = "‧")
        {
            string result_value = "";
            if (!string.IsNullOrEmpty(text))
            {
                string[] li_list = text.Split('\n');
                foreach (string li_value in li_list)
                {
                    if ( ! string.IsNullOrEmpty(li_value))
                    {
                        result_value += "<li> " + prefix + li_value + "</li>";
                    }
                }
            }

            return MvcHtmlString.Create(result_value);
        }



        //ajax enable button        
        public static MvcHtmlString AjaxEnableButton(this HtmlHelper html, string actionUrl,byte launch =1, string sn = "0", string id = "launch")
        {

            string img_button = GetEnableImage(launch);
            string enableButton = "<a data-ajax=\"true\" data-ajax-mode=\"replace\" data-ajax-update=\"#" + id + "_" + sn + "\" href=\"" + actionUrl + "\"><div id=\"" + id + "_" + sn + "\">" + img_button + "</div></a>";
            
            return MvcHtmlString.Create(enableButton);
        }

        //ajax enable button        
        public static MvcHtmlString AjaxEnableButton2(this HtmlHelper html, string actionUrl, byte launch = 1, string sn = "0", string id = "launch")
        {

            string img_button = GetEnableImage2(launch);
            string enableButton = "<a data-ajax=\"true\" data-ajax-mode=\"replace\" data-ajax-update=\"#" + id + "_" + sn + "\" href=\"" + actionUrl + "\"><div id=\"" + id + "_" + sn + "\">" + img_button + "</div></a>";

            return MvcHtmlString.Create(enableButton);
        }


        //取得enable button image
        public static string GetEnableImage(byte launch =1)
        {
            string img_button = launch == 1 ? "<img src=\"/Areas/administrator/assets/img/img_switch_on.png\" width=\"60px\" />" : "<img src=\"/Areas/administrator/assets/img/img_switch_off.png\" width=\"60px\" />";
            return img_button;
        }

        public static string GetEnableImage2(byte launch = 1)
        {
            string img_button = launch == 1 ? "<img src=\"/Areas/administrator/assets/img/img_switch_on2.png\" width=\"60px\" />" : "<img src=\"/Areas/administrator/assets/img/img_switch_off.png\" width=\"60px\" />";
            return img_button;
        }

        public static MvcHtmlString TryGetValue(this HtmlHelper html, object souceValue, object defaultValue,object showValue = null)
        {
            if (defaultValue == null)
            {
                defaultValue = "";
            }

            if (souceValue == null)
            {
                return MvcHtmlString.Create(defaultValue.ToString());
            }
            else if (souceValue.ToString() == string.Empty)
            {
                return MvcHtmlString.Create(defaultValue.ToString());
            }
            else
            {
                if (showValue != null)
                {
                    return MvcHtmlString.Create(showValue.ToString());
                }
                else
                {
                    return MvcHtmlString.Create(souceValue.ToString());
                }
            }
        }

        public static MvcHtmlString GetFileSize(this HtmlHelper html, string file_path)
        {
            string file_size = "";
            if (!File.Exists(file_path))
            {
                file_size = "";
            }
            else
            {
                FileInfo fInfo = new FileInfo(file_path);

                long filesize = fInfo.Length;

                if (filesize >= 1024 * 1024 * 1024)
                {
                    file_size = string.Format("{0:0.0} GB", (double)filesize / (1024 * 1024 * 1024));
                }
                else if (filesize >= 1024 * 1024)
                {
                    file_size = string.Format("{0:0.0} MB", (double)filesize / (1024 * 1024));
                }
                else if (filesize >= 1024)
                {
                    file_size = string.Format("{0:0.0} KB", (double)filesize / 1024);
                }
                else
                {
                    file_size = string.Format("{0:0.0} bytes", filesize);
                }
            }

            return MvcHtmlString.Create(file_size); 
        }



        /**
         * 將page參數轉成 permalink
         * ex:
         * http://localhost:4191/backend/zh-tw/ProductContent/product_content/ProductEdit/123?page=2
         * http://localhost:4191/backend/zh-tw/ProductContent/product_content/product/2
         */
        public static MvcHtmlString FUrl(this HtmlHelper html, string actionName = "", string controllerName = "", object addValues = null, string ignoreValues = "")
        {
            UrlHelper url = new UrlHelper(html.ViewContext.RequestContext);

            RouteValueDictionary routevalue = new RouteValueDictionary(html.ViewContext.RouteData.Values);


            foreach (string key in html.ViewContext.HttpContext.Request.QueryString.Keys)
            {
                routevalue[key] = html.ViewContext.HttpContext.Request.QueryString[key].ToString();
            }

            
            if (addValues != null)
            {
                RouteValueDictionary r = new RouteValueDictionary(addValues);
                foreach (var item in r)
                {
                    routevalue[item.Key] = item.Value;
                }
            }         


            if (!string.IsNullOrEmpty(controllerName))
            {
                routevalue["controller"] = controllerName;
            }

            if (!string.IsNullOrEmpty(actionName))
            {
                routevalue["action"] = actionName;
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

            return MvcHtmlString.Create(url.RouteUrl("Default", routevalue)); 
        }



        public static MvcHtmlString IconUrl(this HtmlHelper helper,Dictionary<string, 會員> member_map , string molokey = "",int size = 64)
        {
            if (member_map.ContainsKey(molokey))
            {
                string path = member_map[molokey].Icon名稱;
                
                if (string.IsNullOrEmpty(path))
                {
                    return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png' style='width:" + size + "px;height:" + size + "px'  />");
                }
                else
                {
                    //return MvcHtmlString.Create("<img src='" + path + "' style='width:" + size + "px;height:" + size + "px' onerror=\"this.src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"'\"  />");
                    return MvcHtmlString.Create("<img src='" + path + "' style='width:" + size + "px;height:" + size + "px' onerror=\"this.src='http://w2.ironforum.com.tw/icon/default.png'\"  />");
                }
                
            }
            else
            {
                return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png' style='width:" + size + "px;height:" + size + "px'  />");
                //return MvcHtmlString.Create("<img src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"' style='width:" + size + "px;height:" + size + "px' />");
            }
        }

        public static string GetNickNameByMolokey(this HtmlHelper html, Dictionary<string, 會員> member_map, string molokey = "")
        {
            if (member_map.ContainsKey(molokey))
            {

                return member_map[molokey].暱稱;
            }
            else
            {
                return "";
            }

        }


        public static MvcHtmlString FriendIcon(this HtmlHelper helper, 會員 member)
        {
            if (!string.IsNullOrEmpty(member.Icon名稱))
            {
                return MvcHtmlString.Create("<img src='" + member.Icon名稱 + "'  onerror=\"this.src='http://w2.ironforum.com.tw/icon/default.png'\" />");                
            }
            else
            {
                return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png'  />");
            }
        }
       
        public static MvcHtmlString MemberIcon(this HtmlHelper helper,Userinfo user)
        {
            if (!string.IsNullOrEmpty(user.icon))
            {
                //string header_img_path = member.Icon名稱;
                string html = "<img src='" + user.icon + "' onerror=\"this.src='" + VirtualPathUtility.ToAbsolute("~/upload/website/default.png") + "'\"  />";
                if (!string.IsNullOrEmpty(user.border))
                {

                    html += "<img src='" + user.border + "' id='img_border_style'  />";
                }
                return MvcHtmlString.Create(html);
            }
            else
            {
                //return MvcHtmlString.Create("<img src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"'  />");
                return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png'  />");
            }
        }

        public static MvcHtmlString IconUrl(this HtmlHelper helper, string filename = "", int size = 0)
        {
            if (!string.IsNullOrEmpty(filename))
            {
               
                string path = filename;
                if (size == 0)
                {                    
                    return MvcHtmlString.Create("<img src='" + path + "'  onerror=\"this.src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"'\"  />");
                }
                else
                {
                    return MvcHtmlString.Create("<img src='" + path + "' style='width:" + size + "px;height:" + size + "px' onerror=\"this.src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"'\"  />");
                }
                
            }
            else
            {
                if (size == 0)
                {
                    //return MvcHtmlString.Create("<img src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"'  />");
                    return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png'  />");
                }
                else
                {
                    return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png' style='width:" + size + "px;height:" + size + "px' />");
                    //return MvcHtmlString.Create("<img src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"' style='width:" + size + "px;height:" + size + "px' />");
                }
                
            }
        }

        public static MvcHtmlString IconUrlByNickName(this HtmlHelper helper, Dictionary<string, 會員> member_map, string nickname = "", int size = 64)
        {
            if (member_map.ContainsKey(nickname))
            {
                string path =  member_map[nickname].Icon名稱;
                return MvcHtmlString.Create("<img src='" + path + "' style='width:" + size + "px;height:" + size + "px' onerror=\"this.src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"'\"  />");
            }
            else
            {
                return MvcHtmlString.Create("<img src='http://w2.ironforum.com.tw/icon/default.png' style='width:" + size + "px;height:" + size + "px' />");
                //return MvcHtmlString.Create("<img src='"+VirtualPathUtility.ToAbsolute("~/upload/website/default.png")+"' style='width:" + size + "px;height:" + size + "px' />");
            }
        }


        public static MvcHtmlString AddBtn(this HtmlHelper helper, string btnName, string actionName, string controllerName = null, object addValues = null, string ignoreValues = "")
        {
            return backendButton(helper, btnName, actionName, controllerName, addValues, ignoreValues, "btn btn-info", "glyphicon glyphicon-pencil");
        }

        public static MvcHtmlString EditBtn(this HtmlHelper helper, string btnName, string actionName, string controllerName = null, object addValues = null, string ignoreValues = "")
        {
            return backendButton(helper, btnName, actionName, controllerName, addValues, ignoreValues, "btn btn-warning", "glyphicon glyphicon-edit");
        }


        public static MvcHtmlString backendButton(this HtmlHelper helper, string btnName, string actionName, string controllerName = null, object addValues = null, string ignoreValues = "", string btn_style = "btn btn-info", string img_style = "glyphicon glyphicon-edit")
        {
            RouteValueDictionary routevalue = new RouteValueDictionary(helper.ViewContext.RouteData.Values);

            foreach (string key in helper.ViewContext.HttpContext.Request.QueryString.Keys)
            {
                routevalue[key] = helper.ViewContext.HttpContext.Request.QueryString[key].ToString();
            }

            if (addValues != null)
            {
                RouteValueDictionary r = new RouteValueDictionary(addValues);
                foreach (var item in r)
                {
                    routevalue[item.Key] = item.Value;
                }
            }


            if (!string.IsNullOrEmpty(controllerName))
            {
                routevalue["controller"] = controllerName;
            }

            if (actionName != "")
            {
                routevalue["action"] = actionName;
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

            Dictionary<string, object> htmlAttr = new Dictionary<string, object>();
            htmlAttr["class"] = "btn btn-info";

            UrlHelper urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
            string url = urlHelper.RouteUrl("admin_menu", routevalue);

            return MvcHtmlString.Create("<a class=\"" + btn_style + "\" href=\"" + url + "\"><i class=\"" + img_style + "\"></i> " + btnName + "</a>");           
        }

      
        public static MvcHtmlString GetMore(this HtmlHelper html, string souceValue, int moreLength = 400, string moreString = "...", string url = "", string target = "_self")
        {
            if (System.Text.Encoding.Default.GetBytes(souceValue).Length >= moreLength)
            {
                string returnString = SubByteString(souceValue, 0, moreLength) + moreString;
                if (url != string.Empty)
                {
                    returnString = "<a href=" + url + " target=" + target + " >" + returnString + "</a>";
                }

                return MvcHtmlString.Create(returnString);
            }

            
            return MvcHtmlString.Create(souceValue);
        }


        public static string SubByteString(string a_SrcStr, int a_StartIndex, int a_Cnt)
        {
            Encoding l_Encoding = Encoding.GetEncoding("utf-8", new EncoderExceptionFallback(), new DecoderReplacementFallback(""));
            byte[] l_byte = l_Encoding.GetBytes(a_SrcStr);
            if (a_Cnt <= 0)
                return "";
            //例若長度10
            //若a_StartIndex傳入9 -> ok, 10 ->不行
            if (a_StartIndex + 1 > l_byte.Length)
                return "";
            else
            {
                //若a_StartIndex傳入9 , a_Cnt 傳入2 -> 不行 -> 改成 9,1
                if (a_StartIndex + a_Cnt > l_byte.Length)
                    a_Cnt = l_byte.Length - a_StartIndex;
            }
            return l_Encoding.GetString(l_byte, a_StartIndex, a_Cnt);
        }


        public static MvcHtmlString GetDownloadFileName(this HtmlHelper html, string filename = "")
        {
            if (filename.LastIndexOf(@"\") > 0)
            {
                string tmp_filename = filename.Substring(filename.LastIndexOf(@"\") + 1, filename.Length - (filename.LastIndexOf(@"\") + 1));
                return MvcHtmlString.Create(tmp_filename);
            }
            else
            {
                return MvcHtmlString.Create(filename);
            }
        }

        public static bool CheckFileType(this HtmlHelper html, string filename, string filetype)
        {
            if (filename.ToLower().IndexOf("." + filetype) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }




        public static MvcHtmlString GetNickName(this HtmlHelper html, string nickname = "", string phone = "")
        {
            if (string.IsNullOrEmpty(nickname))
            {
                return new MvcHtmlString(WbUtil.DisplayPhone(phone).Substring(0, 4) + "******");
            }
            else
            {
                return new MvcHtmlString(nickname);
            }

        }


        public static 電競選手 TryGetPlayer(this HtmlHelper html, Dictionary<long, 電競選手> player_map, long key)
        {
            if (!player_map.ContainsKey(key))
            {
                return new 電競選手();
            }
            else
            {
                return player_map[key];
            }
        }


        public static 英雄列表 TryGetLolHero(this HtmlHelper html, Dictionary<string, 英雄列表> hero_map, string key)
        {
            if (!hero_map.ContainsKey(key))
            {
                return new 英雄列表();
            }
            else
            {
                return hero_map[key];
            }
        }


    }
}