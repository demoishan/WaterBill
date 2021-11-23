using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IUnitMasterRepository : IAbstractRepository<UnitMaster>
    {
        Task<IEnumerable<YearMaster>> GetYear();
        Task<IEnumerable<MonthMaster>> GetMonth();
    }
}
