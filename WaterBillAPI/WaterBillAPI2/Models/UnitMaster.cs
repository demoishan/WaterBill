using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class UnitMaster : BaseClass
    {
        public Int64 UnitId { get; set; }
        public float UnitRate { get; set; }
        public Int64 Penalty { get; set; }
        public int BillDueDays { get; set; }
    }
}
