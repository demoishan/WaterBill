using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.Interface
{
    public interface IUserService : IAbstractService<User>
    {
        Task<User> LoginAuthenticateAsync(string email, string password);

    }
}
