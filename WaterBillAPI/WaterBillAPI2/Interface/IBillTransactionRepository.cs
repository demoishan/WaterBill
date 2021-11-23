using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IBillTransactionRepository : IAbstractRepository<BillTransaction>
    {
        Task<bool> BillService();
        Task<Int64> UpdatePDFFileLocation(BillTransaction billTransaction);
        Task<IEnumerable<BillTransaction>> GetReport(int? GroupId, int? OwnerId, int? PaymentType, int? BillStatus, DateTime? Startdate, DateTime? Endate);

    }
}
