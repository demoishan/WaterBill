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
using WebApi.Models;

namespace WebApi.Repository
{
    public class UserPanelRepository : IUserPanelRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;

        public UserPanelRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<BillTransaction> GetCurrentMonth(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetCurrentMonth");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<BillTransaction>(
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

        public async Task<BillTransaction> GetCurrentTotal(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetCurrentTotal");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<BillTransaction>(
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

        public async Task<IEnumerable<BillTransaction>> GetPaidTransaction(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetPaid");
            parameters.Add("@OwnerId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<BillTransaction>(
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

        public async Task<IEnumerable<BillTransaction>> GetUnitsUsed(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetUnitUsed");
            parameters.Add("@OwnerId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<BillTransaction>(
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

        public async Task<IEnumerable<BillTransaction>> GetUnpaidTransaction(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetUnPaid");
            parameters.Add("@OwnerId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<BillTransaction>(
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

        public async Task<long> UpdateAsync(BillTransaction billTransaction)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Pay");
            parameters.Add("@OwnerId", billTransaction.OwnerId);
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

        public async Task<Int64> GetOwnerId(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetOwnerId");
            parameters.Add("@UserId",Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<Int64>(
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

        public async Task<IEnumerable<BillTransaction>> GetTotal(long Id)
        {
            var querySPName = "SP_UserPanel";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Total");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<BillTransaction>(
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
    }
}
