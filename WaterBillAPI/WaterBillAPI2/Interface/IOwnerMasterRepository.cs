using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IOwnerMasterRepository : IAbstractRepository<OwnerMaster>
    {
        Task<IEnumerable<OwnerMaster>> GetByGroupIdAsync(Int64 Id);
        Task<IEnumerable<OwnerMaster>> GetByHouseNo(String HouseNumber);
    }
}
