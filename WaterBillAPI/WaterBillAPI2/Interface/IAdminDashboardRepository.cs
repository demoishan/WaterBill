using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Interface
{
    public interface IAdminDashboardRepository
    {
        Task<Int32> GetTotalOwner();
        Task<Int32> GetTotalAdvance();
        Task<Int32> GetOverallUnPaid();
        Task<Int32> GetMonthReceived();
        Task<Int32> GetCurrentPaid();
        Task<Int32> GetCurrentUnPaid();
        Task<IEnumerable<AdminDashboard>> GetOverallUnPaidBillStatusBlockWise();
        Task<IEnumerable<AdminDashboard>> GetMonthYear();
        Task<IEnumerable<AdminDashboard>> GetMonthUnPaid();
        Task<IEnumerable<AdminDashboard>> GetMonthPaid();
        Task<IEnumerable<AdminDashboard>> GetMonthCash();
        Task<IEnumerable<AdminDashboard>> GetMonthCheque();
        Task<IEnumerable<AdminDashboard>> GetMonthAdvance();
    }
}
