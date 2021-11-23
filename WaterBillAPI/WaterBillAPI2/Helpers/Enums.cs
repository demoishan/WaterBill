using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Helpers
{
    public class Enums
    {
        public enum BillStatus
        {
            BillGenrate = 1,
            BillPaid =2
        }

        public enum UploadStatus
        {
            Pass = 1,
            Fail = 2
        }

        public enum MyRoles
        {
            Admin=1,
            User=2,
            SuperAdmin=3
        }
    }
}
