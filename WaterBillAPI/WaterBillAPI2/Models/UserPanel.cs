using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class UserPanel
    {
        public Int64 UnitRate { get; set; }
        public Int64 Penalty { get; set; }
        public string CurrentMonth { get; set; }
        public Int64 CurrentTotal { get; set; }
        public string Month { get; set; }
        public Int64 UnitUsed { get; set; }
    }
}
