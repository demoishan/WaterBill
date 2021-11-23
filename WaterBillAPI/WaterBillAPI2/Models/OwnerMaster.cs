using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class OwnerMaster : BaseClass
    {
        public Int64 OwnerId { get; set; }
        public string OwnerName { get; set; }
        public string BunglowNo { get; set; }
        public string AnotherAddress { get; set; }
        public string Mobile { get; set; }
        public string EmailId { get; set; }
        public float LastUnit { get; set; }
        public Int64 GroupId { get; set; }
        public string GroupName { get; set; }
    }
}
