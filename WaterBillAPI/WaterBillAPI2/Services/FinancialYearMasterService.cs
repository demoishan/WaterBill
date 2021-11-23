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
    public class FinancialYearMasterService : IFinancialYearMasterService
    {
        IFinancialYearMasterRepository _objIFinancialYearMasterRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public FinancialYearMasterService(IFinancialYearMasterRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIFinancialYearMasterRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<long> AddAsync(FinancialYearMaster obj)
        {
            Int64 result = 0;
            result = await _objIFinancialYearMasterRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(FinancialYearMaster obj)
        {
            Boolean result = false;
            result = await _objIFinancialYearMasterRepository.DeleteAsync(obj);
            return result;
        }

        public Task<ICollection<FinancialYearMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<FinancialYearMaster>> GetAsync(FinancialYearMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FinancialYearMaster>> GetByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public async Task<FinancialYearMaster> GetIdAsync(long Id)
        {
            return await _objIFinancialYearMasterRepository.GetIdAsync(Id);
        }

        public Task<ICollection<FinancialYearMaster>> GetByListByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<FinancialYearMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<FinancialYearMaster>> GetListAsync()
        {
            return await _objIFinancialYearMasterRepository.GetListAsync();
        }

        public async Task<long> UpdateAsync(FinancialYearMaster obj)
        {
            Int64 result = 0;
            result = await _objIFinancialYearMasterRepository.UpdateAsync(obj);
            return result;
        }
    }
}
