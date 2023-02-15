using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Wb.Common
{
    public class Validator
    {
        //驗證最小長度
        public static bool CheckStringLength( object value , int min_length )
        {
            StringValidator sv = new StringValidator(min_length);

            try
            {
                sv.Validate(value);
                return true;
            }
            catch
            {
                return false;
            }
        }

        //驗證最小長度及最大長度
        public static bool CheckStringLength(object value, int min_length, int max_length)
        {
            StringValidator sv = new StringValidator(min_length,max_length);

            try
            {
                sv.Validate(value);
                return true;
            }
            catch
            {
                return false;
            }
        }

        //驗證最小值~最大值
        public static bool CheckInt(object value, long min , long max)
        {
            LongValidator iv = new LongValidator(min, max);

            try
            {
                iv.Validate(Convert.ToInt64( value ));
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}