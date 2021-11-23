using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IUserPanelRepository
    {
        Task<IEnumerable<BillTransaction>> GetUnitsUsed(Int64 Id);
        Task<IEnumerable<BillTransaction>> GetUnpaidTransaction(Int64 Id);
        Task<IEnumerable<BillTransaction>> GetPaidTransaction(Int64 Id);
        Task<BillTransaction> GetCurrentMonth(Int64 Id);
        Task<BillTransaction> GetCurrentTotal(Int64 Id);
        Task<Int64> UpdateAsync(BillTransaction obj);
        Task<Int64> GetOwnerId(Int64 Id);
        Task<IEnumerable<BillTransaction>> GetTotal(Int64 Id);
    }
}
