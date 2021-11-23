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
    public class OwnerMasterRepository : IOwnerMasterRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public OwnerMasterRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<long> AddAsync(OwnerMaster ownerMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@OwnerName", ownerMaster.OwnerName);
            parameters.Add("@BunglowNo", ownerMaster.BunglowNo);
            parameters.Add("@AnotherAddress", ownerMaster.AnotherAddress);
            parameters.Add("@Mobile", ownerMaster.Mobile);
            parameters.Add("@EmailId", ownerMaster.EmailId);
            parameters.Add("@LastUnit", ownerMaster.LastUnit);
            parameters.Add("@GroupId", ownerMaster.GroupId);
            parameters.Add("@CreatedBy", ownerMaster.CreatedBy);
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

        public async Task<bool> DeleteAsync(OwnerMaster ownerMaster)
        {
            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Delete");
            parameters.Add("@IsActive", ownerMaster.IsActive);
            parameters.Add("@OwnerId", ownerMaster.OwnerId);
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

        public Task<ICollection<OwnerMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<OwnerMaster>> GetAsync(OwnerMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<OwnerMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<OwnerMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<OwnerMaster> GetIdAsync(long Id)
        {
            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectById");
            parameters.Add("@OwnerId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryFirstOrDefaultAsync<OwnerMaster>(
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

        public Task<IEnumerable<OwnerMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<OwnerMaster>> GetListAsync()
        {
            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<OwnerMaster>(
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

        public async Task<long> UpdateAsync(OwnerMaster ownerMaster)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Update");
            parameters.Add("OwnerId", ownerMaster.OwnerId);
            parameters.Add("@OwnerName", ownerMaster.OwnerName);
            parameters.Add("@BunglowNo", ownerMaster.BunglowNo);
            parameters.Add("@AnotherAddress", ownerMaster.AnotherAddress);
            parameters.Add("@Mobile", ownerMaster.Mobile);
            parameters.Add("@EmailId", ownerMaster.EmailId);
            parameters.Add("@LastUnit", ownerMaster.LastUnit);
            parameters.Add("@GroupId", ownerMaster.GroupId);
            parameters.Add("@UpdatedBy", ownerMaster.UpdatedBy);
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

        public async Task<IEnumerable<OwnerMaster>> GetByGroupIdAsync(long Id)
        {
            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectByGroupId");
            parameters.Add("@GroupId", Id);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<OwnerMaster>(
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

        public async Task<IEnumerable<OwnerMaster>> GetByHouseNo(string HouseNumber)
        {
            var querySPName = "SP_OwnerMaster";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectByBunglowNo");
            parameters.Add("@BunglowNo", HouseNumber);

            using (var sqlConnection = new SqlConnection(_connection.ConnectionString))
            {
                try
                {
                    await sqlConnection.OpenAsync();
                    return await sqlConnection.QueryAsync<OwnerMaster>(
                        querySPName,
                         parameters,
                         commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    await sqlConnection.CloseAsync();
                }
            }
        }
    }
}
