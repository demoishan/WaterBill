using System;
using System.Collections.Generic;
using System.Linq;

namespace WebApi.Models
{
    public class ExcelFiles : BaseClass
    {
        public Int64 UploloadId { get; set; }
       // public string OwnerName { get; set; }

        public string UploadFileName { get; set; }

        public string UploadURL { get; set; }

        public string DownloadURL { get; set; }

        public int Pass { get; set; }

        public int Fail { get; set; }

    }
}
