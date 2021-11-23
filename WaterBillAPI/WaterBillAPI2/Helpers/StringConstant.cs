using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Helpers
{
    public static class StringConstant
    {
        public const string DataAlreadyExists = "Data already exists";
        public const string SomethingWentWrong = "Something Went Wrong,Please Try again ";
        public const string Blank = "";
        public const string DataSuccess = "Data added successfuly";



        public const string Role_Admin = "Admin";
        public const string Role_SuperAdmin = "SuperAdmin";
        public const string Role_User = "User";

        public const string Claims_AdminOnly = "AdminOnly";
        public const string Claims_UserOnly = "UserOnly";
        public const string Claims_SuperAdmin2 = "SuperAdmin2";

    }
}
