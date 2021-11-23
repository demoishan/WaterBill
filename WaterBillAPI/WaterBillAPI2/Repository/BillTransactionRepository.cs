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
    public class BillTransactionRepository : IBillTransactionRepository
    {
        IConfiguration _iconfiguration;
        private readonly DbConnection _connection;
        public BillTransactionRepository(IConfiguration iconfiguration, DbConnection connection)
        {
            _iconfiguration = iconfiguration;
            _connection = connection;
        }

        public async Task<long> AddAsync(BillTransaction billTransaction)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Insert");
            parameters.Add("@IsActive", "True");
            parameters.Add("@OwnerId", billTransaction.OwnerId);
            parameters.Add("@LastUnit", billTransaction.LastUnit);
            parameters.Add("@CurrentUnit", billTransaction.CurrentUnit);
            parameters.Add("@Penalty", billTransaction.Penalty);
            parameters.Add("@BillStatus", billTransaction.BillStatus);
            parameters.Add("@BillDueDate", billTransaction.BillDueDate);
            parameters.Add("@BillDate", billTransaction.BillDate);
            parameters.Add("@Year", billTransaction.Year);
            parameters.Add("@Month", billTransaction.Month);
            parameters.Add("@Maintenance", billTransaction.Maintenance);
            parameters.Add("@OtherCharge", billTransaction.OtherCharge);
            parameters.Add("@CreatedBy", billTransaction.CreatedBy);
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

        public Task<bool> DeleteAsync(BillTransaction obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<BillTransaction>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<BillTransaction>> GetAsync(BillTransaction obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<BillTransaction>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<BillTransaction>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<BillTransaction> GetIdAsync(long Id)
        {
            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectById");
            parameters.Add("@BillId", Id);

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

        public Task<IEnumerable<BillTransaction>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<BillTransaction>> GetListAsync()
        {
            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "SelectALL");

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

            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "Update");
            parameters.Add("@BillId", billTransaction.BillId);
            parameters.Add("@BillStatus", billTransaction.BillStatus);
            parameters.Add("@BankName", billTransaction.BankName);
            parameters.Add("@BranchName", billTransaction.BranchName);
            parameters.Add("@ChequeNo", billTransaction.ChequeNo);
            parameters.Add("@ChequeDate", billTransaction.ChequeDate);
            parameters.Add("@PaymentType", billTransaction.PaymentType);
            parameters.Add("@UpdatedBy", billTransaction.UpdatedBy);
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

        public async Task<bool> BillService()
        {
            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "BillAUto");
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

        public async Task<long> UpdatePDFFileLocation(BillTransaction billTransaction)
        {
            Int64 NewRowsInsert = 0;

            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "UpdatePDFURL");
            parameters.Add("@BillId", billTransaction.BillId);
            parameters.Add("@ReceiptURL", billTransaction.ReceiptURL);
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

        public async Task<IEnumerable<BillTransaction>> GetReport(int? GroupId, int? OwnerId, int? PaymentType, int? BillStatus, DateTime? Startdate, DateTime? Endate)
        {
            var querySPName = "SP_BillTransaction";
            var parameters = new DynamicParameters();
            parameters.Add("@Mode", "BillReport");
            parameters.Add("@GroupId", GroupId);
            parameters.Add("@OwnerId", OwnerId);
            parameters.Add("@PaymentType", PaymentType);
            parameters.Add("@BillStatus", BillStatus);
            parameters.Add("@Startdate", Startdate);
            parameters.Add("@Endate", Endate);

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
