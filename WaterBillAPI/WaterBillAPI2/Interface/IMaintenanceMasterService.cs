using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IMaintenanceMasterService : IAbstractService<MaintenanceMaster>
    {
        Task<IEnumerable<MaintenanceMaster>> GetByGroupIdAsync(Int64 Id);
    }
}
