using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Caching;
using System.IO;
using System.Drawing;
using System.Drawing.Text;
using System.Drawing.Imaging;

namespace Wb.Controllers
{
    [Serializable]
    public class IVCodeController : Controller
    {
        /// <summary>
        /// 用於輸出驗證圖片的 Action。
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public ActionResult Index(Guid? key)
        {
            if (!key.HasValue)
                Response.Redirect("/", true);
            object ocode = HttpContext.Cache[ImageVerificationCodeCacheKey.IVImgKey + key];
            if (ocode == null)
                Response.Redirect("/", true);

            string code = ocode.ToString();
            HttpContext.Cache.Remove(ImageVerificationCodeCacheKey.IVImgKey + key);     //一張圖只能輸出一次，防止使用者多次取得圖片提高圖形辨識成功率
            Response.Cache.SetLastModified(DateTime.UtcNow);
            ImageVerificationCodeModel iv = new ImageVerificationCodeModel(HttpContext.Cache, Server.MapPath("/"));
            return File(iv.createImage(code), "image/png");
        }
    }

    public class ImageVerificationCodeModel
    {
        public string URL { get; set; }
        public string CacheKey { get; set; }
        public byte[] ImageData { get; set; }

        private Random rand = new Random();
        private string scriptPath;
        private string fontsPath = "\\App_Data\\Font\\";
        private Cache baseCache;
        private TimeSpan CodeLiveTime = new TimeSpan(0, 30, 0); //驗證碼存在 cache 的時間為30分鐘

        #region Construct -------------------------------------------------------------
        /// <summary>
        /// 用於裝載驗證圖片位置、驗證Key的建構子。
        /// </summary>
        public ImageVerificationCodeModel()                                                 //用於裝載驗證圖片位置、驗證Key的建構子
        {
            URL = "/IVCode/?key=";  //預設的圖片URL
        }

        /// <summary>
        /// 用於產生驗證圖片的建構子。
        /// </summary>
        /// <param name="baseCache"></param>
        /// <param name="scriptPath"></param>
        public ImageVerificationCodeModel(Cache baseCache, string scriptPath)               //用於產生驗證圖片的建構子
        {
            this.baseCache = baseCache;
            this.scriptPath = scriptPath;
            fontsPath = scriptPath + fontsPath;
        }

        /// <summary>
        /// 用於驗證使用者是否輸入正確的建構子。
        /// </summary>
        /// <param name="baseCache"></param>
        public ImageVerificationCodeModel(Cache baseCache)                                  //用於驗證使用者是否輸入正確的建構子
        {
            this.baseCache = baseCache;
        }
        #endregion --------------------------------------------------------------------


        #region Public Method ---------------------------------------------------------
        /// <summary>
        /// 產生驗證碼，有用的傳回值為URL、CacheKey。
        /// </summary>
        /// <param name="length">驗證碼長度，不輸入時為5碼。</param>
        /// <returns></returns>
        public ImageVerificationCodeModel CreateIVCode(int length = 4)                      //產生驗證碼，有用的傳回值為URL、CacheKey
        {
            ImageVerificationCodeModel retdata = new ImageVerificationCodeModel();
            string code = generateCheckCode(length);
            Guid gKey = Guid.NewGuid();
            baseCache.Insert(ImageVerificationCodeCacheKey.IVKey + gKey.ToString(), code, null, Cache.NoAbsoluteExpiration, CodeLiveTime);
            baseCache.Insert(ImageVerificationCodeCacheKey.IVImgKey + gKey.ToString(), code, null, Cache.NoAbsoluteExpiration, CodeLiveTime);

            retdata.URL += gKey.ToString();
            retdata.CacheKey = gKey.ToString();

            return retdata;
        }

        /// <summary>
        /// 檢查使用者輸入的驗證碼是否正確。
        /// </summary>
        /// <param name="Key">CreateIVCode 產生的 CacheKey</param>
        /// <param name="InputCode">使用者輸入的驗證碼</param>
        /// <returns></returns>
        public bool isVerificationCodeMatch(string Key, string InputCode, bool is_remove = true)                   //檢查使用者輸入的驗證碼是否正確
        {
            bool redata;
            string code = baseCache[ImageVerificationCodeCacheKey.IVKey + Key] as string;
            if (string.IsNullOrEmpty(code))
                return false;

            redata = InputCode.Length == code.Length && code.IndexOf(InputCode, StringComparison.OrdinalIgnoreCase) == 0;
            if (redata && is_remove)
            {
                baseCache.Remove(ImageVerificationCodeCacheKey.IVKey + Key);
            }
            return redata;
        }
        #endregion --------------------------------------------------------------------

        #region Private Function ------------------------------------------------------
        /// <summary>
        /// 驗證碼繪圖函數，傳回 png 格式二進制資料。
        /// </summary>
        /// <param name="validateCode">驗證碼文字內容</param>
        /// <returns></returns>
        public byte[] createImage(string validateCode)
        {
            int imageWidth = (validateCode.Length * 32);
            Bitmap bitmap = new Bitmap(imageWidth, 45);
            Graphics graphics = Graphics.FromImage(bitmap);
            PrivateFontCollection colFont;
            Font theFont;
            Brush newBrush;
            Point thePos;
            int intPosX, intPosY;
            bool[] fontSelect = new bool[validateCode.Length];

            //初始化繪圖區
            graphics.Clear(Color.AntiqueWhite);

            //初始化字型選擇
            int randFontLog = 0;
            while (randFontLog < 1)
            {
                for (var fontsIndex = 0; fontsIndex < validateCode.Length; fontsIndex++)
                {
                    if (rand.Next(1, 200) % 2 == 0)
                        fontSelect[fontsIndex] = false;
                    else
                    {
                        fontSelect[fontsIndex] = true;
                        randFontLog++;
                    }
                }
                if (validateCode.Length < 3)
                    break;
            }

            //初始化字型
            object font = baseCache[ImageVerificationCodeCacheKey.Font];
            if (font == null)
            {       //快取無紀錄重新取得字型
                colFont = new PrivateFontCollection();
                colFont.AddFontFile(fontsPath + "0.ttf");
                colFont.AddFontFile(fontsPath + "1.ttf");
                baseCache[ImageVerificationCodeCacheKey.Font] = colFont;
            }
            else
            {       //從快取中取得字型
                colFont = (PrivateFontCollection)font;
            }

            //開始繪圖
            for (int loopIndex = 0; loopIndex < validateCode.Length; loopIndex++)
            {
                if (fontSelect[loopIndex])
                    theFont = new Font(colFont.Families[0], 32, FontStyle.Bold);
                else
                    theFont = new Font(colFont.Families[1], 32, FontStyle.Bold);

                intPosX = loopIndex * 28;
                newBrush = new SolidBrush(getRandomColor());
                intPosY = rand.Next(0, 2) * 2;
                thePos = new Point(intPosX, intPosY);
                graphics.DrawString(validateCode.Substring(loopIndex, 1), theFont, newBrush, thePos);
            }

            //製作完的圖片存入記憶體
            MemoryStream objMemoryStream = new MemoryStream();
            bitmap.Save(objMemoryStream, ImageFormat.Png);
            byte[] retdata = objMemoryStream.ToArray();
            graphics.Dispose();
            bitmap.Dispose();
            return retdata;
        }

        /// <summary>
        /// 取得亂數產生的顏色。
        /// </summary>
        /// <returns></returns>
        private Color getRandomColor()
        {
            int intRed = rand.Next(0, 200);
            int intGreen = rand.Next(0, 200);
            int intBlue = (intRed + intGreen) % 255;

            return Color.FromArgb(intRed, intGreen, intBlue);
        }

        /// <summary>
        /// 產生驗證碼。
        /// </summary>
        /// <param name="arg_CodeLength">驗證碼長度</param>
        /// <returns></returns>
        private string generateCheckCode(int codeLength)
        {
            int intNumber, intIndex = 0;
            string Code = "";
            bool blnIsHaveNumber = false, blnIsHaveString = false;

            while (codeLength > intIndex)
            {
                intNumber = rand.Next();
                if (intNumber % 2 == 0)
                {
                    Code += (char)('1' + (char)(intNumber % 9));
                    blnIsHaveNumber = true;
                }
                else
                {
                    Code += (char)('1' + (char)(intNumber % 9));
                    //Code += (char)('A' + (char)(intNumber % 26));
                    blnIsHaveString = true;
                }
                //檢查驗證碼中是否含有文數字
                if ((intIndex + 1) == codeLength)
                {
                    if (!(blnIsHaveNumber && blnIsHaveString))
                    {
                        //若只含數字或文字重取一次
                        intIndex = -1;
                        Code = "";
                    }
                }
                intIndex++;
            }
            Code = Code.Replace('O', 'C');
            return Code;
        }
        #endregion --------------------------------------------------------------------
    }

    internal static class ImageVerificationCodeCacheKey
    {
        public const string IVKey = "IVCode";
        public const string IVImgKey = "IVImgCode";
        public const string Font = "IVCodeF";
    }
}