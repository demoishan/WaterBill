using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class MaintenanceMaster : BaseClass
    {
        public Int64 MaintenanceId { get; set; }
        public string MaintenanceName { get; set; }
        public Int64 Amount { get; set; }
        public Int64 GroupId { get; set; }


        public string GroupName { get; set; }
    }
}
