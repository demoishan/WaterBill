using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Interface;

namespace WebApi.Services
{
   
    public class UserService : IUserService
    {
        IUserRepository _objIUserRepository;

        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        private readonly AppSettings _appSettings;


        public UserService(IUserRepository repository, IConfiguration configuration, IHostingEnvironment env, IOptions<AppSettings> appSettings)
        {
            _objIUserRepository = repository;
            _iconfiguration = configuration;
            _env = env;
            _appSettings = appSettings.Value;
        }

        public async Task<User> LoginAuthenticateAsync(string email, string password)
        {
            try
            {
                User user = await _objIUserRepository.LoginAuthenticateAsync(email, password);

                if (user == null)
                    return null;

                user = GenerateJWT(user);
                return user;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public User GenerateJWT(User user)
        {
            // authentication successful so generate jwt token
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.UserId.ToString()),
                    new Claim("userId", user.UserId.ToString()),
                    new Claim("ownerId", user.OwnerId.ToString()),
                    new Claim("firstName", user.FirstName),
                    new Claim("lastName", user.LastName),
                    new Claim("userEmail", user.EmailId),
                    new Claim("role", user.Role.ToString()),
                    new Claim("roles", user.Roles)
                }),

                Expires = DateTime.UtcNow.AddDays(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            user.Token = tokenHandler.WriteToken(token);

            return user;
        }


        public async Task<IEnumerable<User>> GetListAsync()
        {
            return await _objIUserRepository.GetListAsync();
        }

        public async Task<long> AddAsync(User obj)
        {
            Int64 result = 0;
            if (obj.Role==Enums.MyRoles.Admin)
            {
                obj.Roles = StringConstant.Claims_AdminOnly;
            }
            if (obj.Role == Enums.MyRoles.User)
            {
                obj.Roles = StringConstant.Claims_UserOnly;
            }
            if (obj.Role == Enums.MyRoles.SuperAdmin)
            {
                obj.Roles = StringConstant.Claims_UserOnly;
            }
             
            result = await _objIUserRepository.AddAsync(obj);
            return result;
        }

        public Task<IEnumerable<User>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<User>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<User>> GetAsync(User obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<User>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<User>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<long> UpdateAsync(User obj)
        {
            Int64 result = 0;
            result = await _objIUserRepository.UpdateAsync(obj);
            return result;
        }

        public Task<bool> DeleteAsync(User obj)
        {
            throw new NotImplementedException();
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<User> GetIdAsync(long Id)
        {
            throw new NotImplementedException();
        }
    }
}