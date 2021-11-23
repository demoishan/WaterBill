using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class AdminDashboard
    {
        public string GroupName { get; set; }
        public string Month { get; set; }
        public string Year { get; set; }
        public Int64 Total { get; set; }
    }
}
