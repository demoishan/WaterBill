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
    public class FiancialYearMasterRepository : IFinancialYearMasterRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public FiancialYearMasterRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<long> AddAsync(FinancialYearMaster financialYearMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_FinancialYearMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@YearName", financialYearMaster.YearName);
            parameters.Add("@IsActive", "True");
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

        public async Task<bool> DeleteAsync(FinancialYearMaster financialYearMaster)
        {
            Boolean NewRowsInsert = false;

            var querySPName = "SP_FinancialYearMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Delete");
            parameters.Add("@IsActive", financialYearMaster.IsActive);
            parameters.Add("@YearId", financialYearMaster.YearId);
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
            NewRowsInsert = parameters.Get<Boolean>("@NewRowsInsert");

            return NewRowsInsert;
        }

        public Task<ICollection<FinancialYearMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<FinancialYearMaster>> GetAsync(FinancialYearMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FinancialYearMaster>> GetByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<FinancialYearMaster>> GetByListByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FinancialYearMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<FinancialYearMaster>> GetListAsync()
        {
            var querySPName = "SP_FinancialYearMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<FinancialYearMaster>(
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

        public async Task<long> UpdateAsync(FinancialYearMaster financialYearMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_FinancialYearMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Update");
            parameters.Add("@YearId", financialYearMaster.YearId);
            parameters.Add("@YearName", financialYearMaster.YearName);
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

        public async Task<FinancialYearMaster> GetIdAsync(long Id)
        {
            var querySPName = "SP_FinancialYearMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectById");
            parameters.Add("@YearId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<FinancialYearMaster>(
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
