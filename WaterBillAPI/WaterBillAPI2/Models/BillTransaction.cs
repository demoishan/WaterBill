using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static WebApi.Helpers.Enums;

namespace WebApi.Models
{
    public class BillTransaction : BaseClass
    {
        public Int64 BillId { get; set; }
        public Int64 OwnerId { get; set; }
        public string OwnerName { get; set; }
        public string GroupName { get; set; }
        public string BunglowNo { get; set; }
        public float LastUnit { get; set; }
        public Int64 CurrentUnit { get; set; }
        public Int64 Maintenance { get; set; }
        public Int64 OtherCharge { get; set; }
        public Int64 Total { get; set; }
        public Int64 UnitUsed { get; set; }
        public Int32 Year { get; set; }
        public Int32 Month { get; set; }
        public Int64 Penalty { get; set; }
        public DateTime BillDueDate { get; set; }
        public DateTime BillDate { get; set; }
        public BillStatus BillStatus { get; set; }
        public string BankName { get; set; }
        public string BranchName { get; set; }
        public string ChequeNo { get; set; }
        public DateTime? ChequeDate { get; set; }
        public Int32 PaymentType { get; set; }
        public Int64 WaterBillAmount { get; set; }
        public string ReceiptNo { get; set; } 
        public string ReceiptURL { get; set; }


    }
}
