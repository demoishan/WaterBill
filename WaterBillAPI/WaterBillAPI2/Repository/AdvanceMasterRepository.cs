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
    public class AdvanceMasterRepository : IAdvanceMasterRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public AdvanceMasterRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<long> AddAsync(AdvanceMaster advanceMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_AdvanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@OwnerId", advanceMaster.OwnerId);
            parameters.Add("@Amount", advanceMaster.Amount);
            parameters.Add("@RemainAmount", advanceMaster.RemainAmount);
            parameters.Add("@ChequeNo", advanceMaster.ChequeNo);
            parameters.Add("@ChequeDate", advanceMaster.ChequeDate);
            parameters.Add("@BankName", advanceMaster.BankName);
            parameters.Add("@BranchName", advanceMaster.BranchName);
            parameters.Add("@ChequeCleared", advanceMaster.ChequeCleared);
            parameters.Add("@CreatedBy", advanceMaster.CreatedBy);
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

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(AdvanceMaster advanceMaster)
        {
            var querySPName = "SP_AdvanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Delete");
            parameters.Add("@IsActive", advanceMaster.IsActive);
            parameters.Add("@AdvanceId", advanceMaster.AdvanceId);
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
            Int64 NewRowsInsert = parameters.Get<Int64>("@NewRowsInsert");

            return NewRowsInsert > 0 ? true : false;
        }

        public Task<ICollection<AdvanceMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<AdvanceMaster>> GetAsync(AdvanceMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<AdvanceMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<AdvanceMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<AdvanceMaster> GetIdAsync(long Id)
        {
            var querySPName = "SP_AdvanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectById");
            parameters.Add("@AdvanceId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<AdvanceMaster>(
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

        public Task<IEnumerable<AdvanceMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<AdvanceMaster>> GetListAsync()
        {
            var querySPName = "SP_AdvanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdvanceMaster>(
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

        public async Task<long> UpdateAsync(AdvanceMaster advanceMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_AdvanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Update");
            parameters.Add("@AdvanceId", advanceMaster.AdvanceId);
            parameters.Add("@OwnerId", advanceMaster.OwnerId);
            parameters.Add("@Amount", advanceMaster.Amount);
            parameters.Add("@RemainAmount", advanceMaster.RemainAmount);
            parameters.Add("@ChequeNo", advanceMaster.ChequeNo);
            parameters.Add("@ChequeDate", advanceMaster.ChequeDate);
            parameters.Add("@BankName", advanceMaster.BankName);
            parameters.Add("@BranchName", advanceMaster.BranchName);
            parameters.Add("@ChequeCleared", advanceMaster.ChequeCleared);
            parameters.Add("@UpdatedBy", advanceMaster.UpdatedBy);
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
    }
}
