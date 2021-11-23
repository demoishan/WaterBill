using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Interface;
using WebApi.Models;

namespace WebApi.Services
{
    public class UserPanelService : IUserPanelService
    {
        IUserPanelRepository _objIUserPanelRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public UserPanelService(IUserPanelRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIUserPanelRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<BillTransaction> GetCurrentMonth(long Id)
        {
            return await _objIUserPanelRepository.GetCurrentMonth(Id);
        }

        public async Task<BillTransaction> GetCurrentTotal(long Id)
        {
            return await _objIUserPanelRepository.GetCurrentTotal(Id);
        }

        public async Task<Int64> GetOwnerId(long Id)
        {
            return await _objIUserPanelRepository.GetOwnerId(Id);
        }

        public async Task<IEnumerable<BillTransaction>> GetPaidTransaction(long Id)
        {
            return await _objIUserPanelRepository.GetPaidTransaction(Id);
        }

        public async Task<IEnumerable<BillTransaction>> GetTotal(long Id)
        {
            return await _objIUserPanelRepository.GetTotal(Id);
        }

        public async Task<IEnumerable<BillTransaction>> GetUnitsUsed(long Id)
        {
            return await _objIUserPanelRepository.GetUnitsUsed(Id);
        }

        public async Task<IEnumerable<BillTransaction>> GetUnpaidTransaction(long Id)
        {
            return await _objIUserPanelRepository.GetUnpaidTransaction(Id);
        }

        public async Task<long> UpdateAsync(BillTransaction obj)
        {
            Int64 result = 0;
            result = await _objIUserPanelRepository.UpdateAsync(obj);
            return result;
        }
    }
}
