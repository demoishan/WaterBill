using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace WebApi.Models
{
    public class Response<T>
    {
        public HttpStatusCode Status { get; set; }
        public bool IsError { get; set; }
        public bool IsAddUpdate { get; set; }
        public string Message { get; set; }
        public T Result { get; set; }
    }
}
