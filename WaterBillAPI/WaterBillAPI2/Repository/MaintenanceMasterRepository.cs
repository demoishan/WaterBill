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
    public class MaintenanceMasterRepository : IMaintenanceMasterRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public MaintenanceMasterRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public Task<IEnumerable<MaintenanceMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<MaintenanceMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<MaintenanceMaster>> GetAsync(MaintenanceMaster obj)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<MaintenanceMaster>> GetListAsync()
        {
            var querySPName = "SP_MaintenanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<MaintenanceMaster>(
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

        public Task<IEnumerable<MaintenanceMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<MaintenanceMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<long> UpdateAsync(MaintenanceMaster maintenanceMaster)
        {
            
            Int64 NewRowsInsert = 0;
           
            var querySPName = "SP_MaintenanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Update");
            parameters.Add("@MaintenanceId",maintenanceMaster.MaintenanceId);
            parameters.Add("@MaintenanceName", maintenanceMaster.MaintenanceName);
            parameters.Add("@Amount", maintenanceMaster.Amount);
            parameters.Add("@GroupId", maintenanceMaster.GroupId);
            parameters.Add("@UpdatedBy", maintenanceMaster.UpdatedBy);
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

        public async Task<long> AddAsync(MaintenanceMaster maintenanceMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_MaintenanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@MaintenanceName", maintenanceMaster.MaintenanceName);
            parameters.Add("@Amount", maintenanceMaster.Amount);
            parameters.Add("@GroupId", maintenanceMaster.GroupId);
            parameters.Add("@CreatedBy", maintenanceMaster.CreatedBy);
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

        public async Task<bool> DeleteAsync(MaintenanceMaster maintenanceMaster)
        {
            var querySPName = "SP_MaintenanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Delete");
            parameters.Add("@MaintenanceId", maintenanceMaster.MaintenanceId);
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

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<MaintenanceMaster> GetIdAsync(long Id)
        {
            var querySPName = "SP_MaintenanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectById");
            parameters.Add("@MaintenanceId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<MaintenanceMaster>(
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

        async Task<IEnumerable<MaintenanceMaster>> IMaintenanceMasterRepository.GetByGroupIdAsync(long Id)
        {
            var querySPName = "SP_MaintenanceMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectByGroupId");
            parameters.Add("@GroupId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<MaintenanceMaster>(
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
