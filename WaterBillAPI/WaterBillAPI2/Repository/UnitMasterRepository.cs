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
    public class UnitMasterRepository : IUnitMasterRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public UnitMasterRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<long> AddAsync(UnitMaster unitMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@UnitRate", unitMaster.UnitRate);
            parameters.Add("@Penalty", unitMaster.Penalty);
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

        public async Task<bool> DeleteAsync(UnitMaster unitMaster)
        {
            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Delete");
            parameters.Add("@IsActive", unitMaster.IsActive);
            parameters.Add("@GroupId", unitMaster.UnitId);
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

        public Task<ICollection<UnitMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<UnitMaster>> GetAsync(UnitMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<UnitMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<UnitMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<UnitMaster> GetIdAsync(long Id)
        {
            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectById");
            parameters.Add("@UnitId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<UnitMaster>(
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

        public Task<IEnumerable<UnitMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<UnitMaster>> GetListAsync()
        {
            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<UnitMaster>(
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

        public async Task<long> UpdateAsync(UnitMaster unitMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Update");
            parameters.Add("@UnitId", unitMaster.UnitId);
            parameters.Add("@UnitRate", unitMaster.UnitRate);
            parameters.Add("@Penalty", unitMaster.Penalty);
            parameters.Add("@UpdatedBy", unitMaster.UpdatedBy);
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

        public async Task<IEnumerable<YearMaster>> GetYear()
        {
            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetYear");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<YearMaster>(
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

        public async Task<IEnumerable<MonthMaster>> GetMonth()
        {
            var querySPName = "SP_ConfigurationMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "GetMonth");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<MonthMaster>(
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
