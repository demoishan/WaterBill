using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IOwnerMasterService : IAbstractService<OwnerMaster>
    {
        Task<IEnumerable<OwnerMaster>> GetByGroupIdAsync(Int64 Id);
        Task<IEnumerable<OwnerMaster>> GetByHouseNo(String HouseNumber);
    }
}