using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using WebApi.Models;
using static WebApi.Helpers.Enums;

namespace WebApi.Entities
{
    public class User : BaseClass
    {
        public Int64 UserId { get; set; }
        public Int64 OwnerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public string Roles { get; set; }
        public MyRoles Role { get; set; }

        public string Token { get; set; }

    }


}