using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static WebApi.Helpers.Enums;

namespace WebApi.Models
{
    public class BulkUpload
    {
        public int Year { get; set; } 
        public int Month { get; set; } 
        public string Block { get; set; } 
        public string BunglowNo { get; set; }
        public float LastUnit { get; set; }
        public Int64 CurrentUnit { get; set; } 
        public Int64 OtherCharge { get; set; } 
        public Int64 Maintenance { get; set; }
        public Int64 OwnerId { get; set; }
        public Int64 GroupId { get; set; }

        public UploadStatus uploadStatus { get; set; }
        public string Remarks { get; set; }

    }
}
