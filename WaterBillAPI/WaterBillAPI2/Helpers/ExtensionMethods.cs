using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Claims;
using WebApi.Entities;

namespace WebApi.Helpers
{
    public static class ExtensionMethods
    {
        public static IEnumerable<User> WithoutPasswords(this IEnumerable<User> users)
        {
            return users.Select(x => x.WithoutPassword());
        }

        public static User WithoutPassword(this User user)
        {
            user.Password = null;
            return user;
        }

        public static string ToDescription(this Enum value)
        {
            DescriptionAttribute[] da = (DescriptionAttribute[])(value.GetType().GetField(value.ToString())).GetCustomAttributes(typeof(DescriptionAttribute), false);
            return da.Length > 0 ? da[0].Description : value.ToString();
        }

        public static T ToEnum1<T>(this string type, T defaultEnum)
        {
            T holder;
            try
            {
                holder = (T)Enum.Parse(typeof(T), type);
            }
            catch
            {
                holder = defaultEnum;
            }
            return holder;
        }

        public static T ToEnum<T>(this string stringValue, T defaultValue)
        {
            foreach (T enumValue in Enum.GetValues(typeof(T)))
            {
                DescriptionAttribute[] da = (DescriptionAttribute[])(typeof(T).GetField(enumValue.ToString())).GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (da.Length > 0 && da[0].Description == stringValue)
                    return enumValue;
            }
            return defaultValue;
        }

        public static string GetUniqueFileName(string fileName)
        {
            fileName = Path.GetFileName(fileName);
            return Path.GetFileNameWithoutExtension(fileName)
                      + "_"
                      + Guid.NewGuid().ToString().Substring(0, 4)
                      + Path.GetExtension(fileName);
        }

        public static string ConvertToIndianDate(DateTime dateTime)
        {
            //DateTime dt = DateTime.ParseExact(dateTime.ToString(), "MM/dd/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture);
            //string result = dt.ToString("dd/M/yyyy", CultureInfo.InvariantCulture);
            //return result;
           return dateTime.ToString("dd/MM/yyyy");
        }

        public static string GetMonthName(int MonthNo)
        {
            string month = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(MonthNo);
            return month;
        }

        public static Int64 GetDetail(ClaimsIdentity identity)
        {
            //var identity = User.Identity as ClaimsIdentity;
            if (identity != null)
            {
                IEnumerable<Claim> claims = identity.Claims;
                var name = claims.Where(p => p.Type == "userId").FirstOrDefault();
                var CreatedBy = name.Value;
                return Convert.ToInt64(CreatedBy);
            }
            return 0;
        }
    }
}