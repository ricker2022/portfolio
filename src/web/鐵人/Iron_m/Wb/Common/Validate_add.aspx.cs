using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;	/*使用Bitmap時,需使用*/

namespace Ams.Common
{
    public partial class Validate_add : System.Web.UI.Page
    {       
        string[] str_dynamic_code = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };	//需產生驗證的值
        string str_value = string.Empty;
        int int_total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Request["type"] != null && Request["type"] == "login")
            //Session.Timeout = 5;


            int[] int_dynamic_cnt = { 1, 2, 1, 2 };	//取得1或2位數的值

            Random my_rnd = new Random(unchecked((int)DateTime.Now.Ticks));

            int int_first_cnt = int_dynamic_cnt[my_rnd.Next(2)];
            int int_sec_cnt = 1;
            string str_left_rnd = "0", str_right_rnd = "0";

            if (int_first_cnt == 1)
            {
                int_sec_cnt = 2;
            }
            str_left_rnd = fun_get_rnd(int_first_cnt, my_rnd);
            str_right_rnd = fun_get_rnd(int_sec_cnt, my_rnd);

            str_value = str_left_rnd + " + " + str_right_rnd + " =";
            int_total = Convert.ToInt16(str_left_rnd) + Convert.ToInt16(str_right_rnd);

            Bitmap my_bitmap = new Bitmap(70, 24);	//建立實體圖檔並設定大小 
            Graphics my_gpi = Graphics.FromImage(my_bitmap);
            Font my_font = new Font("Verdana", 10, FontStyle.Bold);

            Pen my_pen = new Pen(Brushes.Red, 1);	//實體化筆刷並設定顏色、大小(畫X,Y軸用) 
            my_gpi.Clear(Color.White);	//設定背景顏色 
            my_gpi.DrawLine(my_pen, 0, my_rnd.Next(80), 90, my_rnd.Next(25));
            my_gpi.DrawString(str_value, my_font, Brushes.Black, 0, 0);

            for (int i = 0; i <= 25; i++)            //亂數產生霧點，擾亂機器人辨別 
            {
                int str_rnd_pixel_x = my_rnd.Next(0, 70);
                int str_rnd_pixel_y = my_rnd.Next(0, 14);
                my_bitmap.SetPixel(str_rnd_pixel_x, str_rnd_pixel_y, Color.Blue);
            }
            if (Session["sc_validate_code"] == null)
                Session.Add("sc_validate_code", int_total.ToString());
            else
                Session["sc_validate_code"] = int_total.ToString();        //將驗證碼存入Session以便稍後進行驗證 

            my_bitmap.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);

            my_rnd = null;
            my_bitmap = null;
            my_gpi = null;
            my_font = null;
            my_pen = null;


        }

        //取得亂數(幾位數)
        private string fun_get_rnd(int int_cnt, Random my_rnd)
        {
            str_value = "";

            for (int i = 0; i < int_cnt; i++)	//亂數產生驗證文字 
            {
                str_value += str_dynamic_code[my_rnd.Next(10)];
            }

            if (str_value.Substring(0, 1) == "0")	//若為0,則再重取亂數
            {
                fun_get_rnd(int_cnt, my_rnd);
            }
            return str_value;
        }
    }
}