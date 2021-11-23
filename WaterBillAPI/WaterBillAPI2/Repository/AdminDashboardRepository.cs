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
    public class AdminDashboardRepository : IAdminDashboardRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;

        public AdminDashboardRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthAdvance()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthAdvance");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<IEnumerable<AdminDashboard>> GetMonthCash()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthCash");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<IEnumerable<AdminDashboard>> GetMonthCheque()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthCheque");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<IEnumerable<AdminDashboard>> GetMonthPaid()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthPaid");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<Int32> GetMonthReceived()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthReceived");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    var result= await sqlConnection.QueryFirstOrDefaultAsync(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);
                    if (result == null)
                    {
                        return 0;
                    }
                    return result;
                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return 0;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthUnPaid()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthUnPaid");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<IEnumerable<AdminDashboard>> GetMonthYear()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonthYear");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<Int32> GetOverallUnPaid()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetOverallUnPaid");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<Int32>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return 0;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }

        public async Task<IEnumerable<AdminDashboard>> GetOverallUnPaidBillStatusBlockWise()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetOverallUnPaidBillStatusBlockWise");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<AdminDashboard>(
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

        public async Task<Int32> GetTotalAdvance()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetTotalAdvance");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<Int32>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return 0;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }

        public async Task<Int32> GetTotalOwner()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetTotalOwner");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<Int32>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return 0;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }

        public async Task<int> GetCurrentPaid()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetCurrentPaid");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<Int32>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return 0;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }

        public async Task<int> GetCurrentUnPaid()
        {
            var querySPName = "SP_AdminDashboard";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetCurrentUnPaid");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<Int32>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);


                }
                catch (Exception ex)
                {
                    var msg = ex.Message;
                    return 0;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }
    }
}
