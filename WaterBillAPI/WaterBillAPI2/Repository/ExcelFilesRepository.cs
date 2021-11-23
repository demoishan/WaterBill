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
    public class ExcelFilesRepository : IExcelFilesRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public ExcelFilesRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }
        public async Task<long> AddAsync(ExcelFiles obj)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_ExcelFiles";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@IsActive", "True");
            parameters.Add("@UploadFileName", obj.UploadFileName);
            parameters.Add("@UploadURL", obj.UploadURL);
            parameters.Add("@DownloadURL", obj.DownloadURL);
            parameters.Add("@Pass", obj.Pass);
            parameters.Add("@Fail", obj.Fail);
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

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(ExcelFiles obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<ExcelFiles>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<ExcelFiles>> GetAsync(ExcelFiles obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<ExcelFiles>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<ExcelFiles>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ExcelFiles> GetIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<ExcelFiles>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<ExcelFiles>> GetListAsync()
        {
            var querySPName = "SP_ExcelFiles";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<ExcelFiles>(
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

        public Task<long> UpdateAsync(ExcelFiles obj)
        {
            throw new NotImplementedException();
        }
    }
}
