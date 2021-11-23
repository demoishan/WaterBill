using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Interface;

namespace WebApi.Repository
{
    public class UserRepository : IUserRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;

        public UserRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<IEnumerable<User>> GetListAsync()
        {
            var querySPName = "SP_UserMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<User>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    throw;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }

        public async Task<long> AddAsync(User user)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_UserMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@FirstName", user.FirstName);
            parameters.Add("@LastName", user.LastName);
            parameters.Add("@EmailId", user.EmailId);
            parameters.Add("@Password", user.Password);
            parameters.Add("@OwnerId", user.OwnerId);
            parameters.Add("@Role", user.Role);
            parameters.Add("@Roles", user.Roles);
            parameters.Add("@NewRowsInsert", dbType: DbType.Int64, direction: ParameterDirection.Output);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    await sqlConnection.ExecuteAsync(
                       querySPName,
                        parameters,
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    throw;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
            NewRowsInsert = parameters.Get<Int64>("@NewRowsInsert");

            return NewRowsInsert;
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

        public async Task<long> UpdateAsync(User user)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_UserMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@UserId", user.UserId);
            parameters.Add("@FirstName", user.FirstName);
            parameters.Add("@LastName", user.LastName);
            parameters.Add("@EmailId", user.EmailId);
            parameters.Add("@Password", user.Password);
            parameters.Add("@OwnerId", user.OwnerId);
            parameters.Add("@Role", user.Role);
            parameters.Add("@Roles", user.Roles);
            parameters.Add("@NewRowsInsert", dbType: DbType.Int64, direction: ParameterDirection.Output);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    await sqlConnection.ExecuteAsync(
                       querySPName,
                        parameters,
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    throw;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
            NewRowsInsert = parameters.Get<Int64>("@NewRowsInsert");

            return NewRowsInsert;
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

        public async Task<User> LoginAuthenticateAsync(string email, string password)
        {
            var querySPName = "SP_UserMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Login");
            parameters.Add("@EmailId", email);
            parameters.Add("@Password", password);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<User>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return null;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }
    }
}
