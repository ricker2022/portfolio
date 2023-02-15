using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Configuration;
using Wb.Models;
using System.Web.Mvc;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Wb.Common
{
    public class WbUtil
    {


        public static string Md5Convert(string str_value)
        {
            string str_converted = "";
            byte[] data = Encoding.Default.GetBytes(str_value.Trim());
            MD5 cs_md5 = new MD5CryptoServiceProvider();
            byte[] result = cs_md5.ComputeHash(data);
            str_converted = BitConverter.ToString(result).Replace("-", "").ToLowerInvariant();
            return str_converted;
        }



        /// <summary>
        /// DES加密字符串
        /// </summary>
        /// <param name="encryptString">待加密的字符串</param>
        /// <param name="encryptKey">加密密鑰，要求為8位</param>
        /// <returns>加密成功返回加密後的字符串，失敗返回空值</returns>
        public static string EncryptDES(string encryptString, string encryptKey = "6yhn7ujm")
        {
            try
            {
                byte[] rgbKey = ASCIIEncoding.ASCII.GetBytes(encryptKey.Substring(0, 8));
                byte[] rgbIV = rgbKey;
                byte[] inputByteArray = Encoding.UTF8.GetBytes(encryptString);
                DESCryptoServiceProvider dCSP = new DESCryptoServiceProvider();
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, dCSP.CreateEncryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                StringBuilder ret = new StringBuilder();
                foreach (byte b in mStream.ToArray())
                {
                    ret.AppendFormat("{0:X2}", b);
                }
                ret.ToString();
                return ret.ToString();
            }
            catch
            {
                return "";
            }
        }
        /// <summary>
        /// DES解密字符串
        /// </summary>
        /// <param name="decryptString">待解密的字符串</param>
        /// <param name="decryptKey">解密密鑰，要求為8位，和加密密鑰相同</param>
        /// <returns>解密成功返回解密後的字符串，失敗返回空值</returns>
        public static string DecryptDES(string decryptString, string decryptKey = "6yhn7ujm")
        {
            try
            {
                byte[] rgbKey = ASCIIEncoding.ASCII.GetBytes(decryptKey);
                byte[] rgbIV = rgbKey;
                byte[] inputByteArray = new byte[decryptString.Length / 2];
                for (int x = 0; x < decryptString.Length / 2; x++)
                {
                    int i = (Convert.ToInt32(decryptString.Substring(x * 2, 2), 16));
                    inputByteArray[x] = (byte)i;
                }
                DESCryptoServiceProvider DCSP = new DESCryptoServiceProvider();
                MemoryStream mStream = new MemoryStream();
                CryptoStream cStream = new CryptoStream(mStream, DCSP.CreateDecryptor(rgbKey, rgbIV), CryptoStreamMode.Write);
                cStream.Write(inputByteArray, 0, inputByteArray.Length);
                cStream.FlushFinalBlock();
                return Encoding.UTF8.GetString(mStream.ToArray());
            }
            catch
            {
                return "";
            }
        }




        public static string GetCurrentIP()
        {
            return HttpContext.Current.Request.UserHostAddress;
        }


        /**
        * 將string 轉為 int
        * 輸入:原始字串 
        * 輸出: int
        */
        public static int TryToParseInt(string value, int default_value = 0)
        {
            int number;
            bool result = int.TryParse(value, out number);
            if (!result) number = default_value;
            return number;
        }

        public static int GetIMValue(string souceValue)
        {
            int im_value = WbUtil.TryToParseInt(souceValue);
            if (im_value > 0)
            {
                return im_value;
            }
            else
            {
                return 0;
            }
        }


        /**
         * 將string 轉為 long
         * 輸入:原始字串
         * 輸出:long
         */
        public static long TryToParseLong(string value, long default_value = 0)
        {
            long number;
            bool result = long.TryParse(value, out number);
            if (!result) number = default_value;
            return number;
        }

        /**
         * 將string 轉為 short
         * 輸入:原始字串
         * 輸出:short
         */
        public static short TryToParseShort(string value, short default_value = 0)
        {
            short number;
            bool result = short.TryParse(value, out number);
            if (!result) number = default_value;
            return number;
        }


        /**
         * 將string 轉為 byte
         * 輸入:原始字串
         * 輸出:byte
         */
        public static byte TryToParseByte(string value, byte default_value = 0)
        {
            byte number;
            bool result = byte.TryParse(value, out number);
            if (!result) number = default_value;
            return number;
        }


        /**
         *  驗證是否為數值
         */
        public static bool IsNumeric(string is_number)
        {
            Regex myRegex = new Regex("^[0-9]{1,}$");
            return myRegex.IsMatch(is_number);
        }


        public static string TryGetValue( object souceValue, object defaultValue = null, object showValue = null)
        {
            if (defaultValue == null)
            {
                defaultValue = "";
            }

            if (souceValue == null)
            {
                return defaultValue.ToString();
            }
            else if (souceValue.ToString() == string.Empty)
            {
                return defaultValue.ToString();
            }
            else
            {
                if (showValue != null)
                {
                    return showValue.ToString();                   
                }
                else
                {
                    return souceValue.ToString(); 
                }
            }
        }

        /**
         *  驗證是否為email
         */
        public static bool IsEmail(string str_Email)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(str_Email, @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }


    
        /// <summary>
        /// 驗證是否為url
        /// </summary>
        /// <param name="str_Url"></param>
        /// <returns></returns>
        public static bool IsUrl(string str_Url)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(str_Url, @"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?");
        }  
        /*
         * 去除HTML
         */
        public static string stripHTML(string html)
        {
            string split = html;
            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"<[^>]*>");
            split = regex.Replace(split, "");
            return split;
        }


        //防駭客
        public static string AntiHack(string str_value)
        {
            if (str_value == null)
            {
                return "";
            }

            string str_after_value = str_value;
            str_after_value = TrimString(str_after_value);//去前後空白
            str_after_value = SQLInjection(str_after_value);//隱碼
            return str_after_value;
        }

        //去前後空白
        public static string TrimString(string str_value)
        {
            str_value = str_value.Trim();//去前後空白

            return str_value;
        }

        //隱碼
        public static string SQLInjection(string str_value)
        {
            str_value = str_value.Replace("'", "''");//將'取代成''

            return str_value;
        }


        //取出檔案內容
        public static string GetFileToString(string sFilePath)
        {
            StringBuilder SubMenu = new StringBuilder();
            try
            {
                //string FilePath = HttpContext.Current.Request.PhysicalApplicationPath + "region\\" + region + "\\" + file_sn + ".html";
                if (System.IO.File.Exists(sFilePath) == false)
                    return "";

                using (System.IO.StreamReader sr = new System.IO.StreamReader(sFilePath))
                {
                    SubMenu.Append(sr.ReadToEnd());
                    sr.Close();
                    sr.Dispose();
                }

                return SubMenu.ToString();
            }
            catch
            {
                return "";
            }
        }


        //檢查是否為英數字或 _-
        public static bool IsEnglish_Number_UnderLine(string str)
        {
            System.Text.RegularExpressions.Regex reg1 = new System.Text.RegularExpressions.Regex(@"^[0-9a-zA-Z._-]*$");
            return reg1.IsMatch(str);
        }


        public static bool IsProduction()
        {
            string is_production = ConfigurationManager.AppSettings["is_production"];
            if (is_production == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }






        /// <summary>
        /// 輸入物件及索引值，取得物件屬性
        /// </summary>
        /// <param name="item">物件</param>
        /// <param name="field_name">屬性名稱</param>
        /// <returns>物件屬性值</returns>
        public static object GetObjectValue(object item, String field_name)
        {
            return item.GetType().GetProperty(field_name).GetValue(item, null);
        }

        public static object SetObjectValue(object item, String field_name, object value)
        {
            if (item.GetType().GetProperty(field_name) != null)
            {
                item.GetType().GetProperty(field_name).SetValue(item, value, null);
            }
            return item;
        }


        public static string DisplayPhone(string phone = "")
        {
            return phone.Replace("+886", "0");
        }

        public static string StripTagsRegex(string source)
        {
            if (string.IsNullOrEmpty(source))
            {
                return "";
            }

            source = Regex.Replace(source, "<.*?>", string.Empty);
            source = Nl2br(source);
            return source;
        }


        public static string Nl2br(string text = "")
        {
            string result_value = "";
            if (!string.IsNullOrEmpty(text))
            {
                result_value = text.Replace("\n", "<br />");
            }

            return result_value;
        }


    }
}