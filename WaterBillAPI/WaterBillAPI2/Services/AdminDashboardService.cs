using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Interface;
using WebApi.Models;

namespace WebApi.Services
{
    public class AdminDashboardService : IAdminDashboardService
    {
        IAdminDashboardRepository _objIAdminDashboardRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public AdminDashboardService(IAdminDashboardRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIAdminDashboardRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<int> GetCurrentPaid()
        {
            return await _objIAdminDashboardRepository.GetCurrentPaid();
        }

        public async Task<int> GetCurrentUnPaid()
        {
            return await _objIAdminDashboardRepository.GetCurrentUnPaid();
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthAdvance()
        {
            return await _objIAdminDashboardRepository.GetMonthAdvance();
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthCash()
        {
            return await _objIAdminDashboardRepository.GetMonthCash();
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthCheque()
        {
            return await _objIAdminDashboardRepository.GetMonthCheque();
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthPaid()
        {
            return await _objIAdminDashboardRepository.GetMonthPaid();
        }

        public async Task<Int32> GetMonthReceived()
        {
            return await _objIAdminDashboardRepository.GetMonthReceived();
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthUnPaid()
        {
            return await _objIAdminDashboardRepository.GetMonthUnPaid();
        }

        public async Task<IEnumerable<AdminDashboard>> GetMonthYear()
        {
            return await _objIAdminDashboardRepository.GetMonthYear();
        }

        public async Task<Int32> GetOverallUnPaid()
        {
            return await _objIAdminDashboardRepository.GetOverallUnPaid();
        }

        public async Task<IEnumerable<AdminDashboard>> GetOverallUnPaidBillStatusBlockWise()
        {
            return await _objIAdminDashboardRepository.GetOverallUnPaidBillStatusBlockWise();
        }

        public async Task<Int32> GetTotalAdvance()
        {
            return await _objIAdminDashboardRepository.GetTotalAdvance();
        }

        public async Task<Int32> GetTotalOwner()
        {
            return await _objIAdminDashboardRepository.GetTotalOwner();
        }
    }
}
