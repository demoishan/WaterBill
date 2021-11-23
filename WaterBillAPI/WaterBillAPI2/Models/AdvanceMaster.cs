using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class AdvanceMaster : BaseClass
    {
        public Int64 AdvanceId { get; set; }
        public string GroupName { get; set; }
        public string OwnerName { get; set; }
        public string BunglowNo { get; set; }
        public Int64 OwnerId { get; set; }
        public float Amount { get; set; }
        public float RemainAmount { get; set; }
        public string ChequeNo { get; set; }
        public DateTime? ChequeDate { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public Int32 ChequeCleared { get; set; }
    }
}
