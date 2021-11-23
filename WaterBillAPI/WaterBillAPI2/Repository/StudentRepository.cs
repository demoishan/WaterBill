using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Interface;
using WebApi.Models;

namespace WebApi.Repository
{
    public class StudentRepository : IStudentRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public StudentRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<long> AddAsync(StudentMaster contactUs)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_StudentMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@StudentEmail", contactUs.StudentEmail);
            parameters.Add("@StudentName", contactUs.StudentName);
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

        public Task<bool> CheckExistsAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(StudentMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<StudentMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<StudentMaster>> GetAsync(StudentMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<StudentMaster>> GetByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<StudentMaster>> GetByListByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<StudentMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<StudentMaster>> GetListAsync()
        {

            var querySPName = "SP_StudentMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                   return await sqlConnection.QueryAsync<StudentMaster>(
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

        public Task<long> UpdateAsync(StudentMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<StudentMaster> GetIdAsync(long Id)
        {
            throw new NotImplementedException();
        }
    }
}
