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
    public class UnitMasterService : IUnitMasterService
    {
        IUnitMasterRepository _objIUnitMasterRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public UnitMasterService(IUnitMasterRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIUnitMasterRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }


        public async Task<long> AddAsync(UnitMaster obj)
        {
            Int64 result = 0;
            result = await _objIUnitMasterRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(UnitMaster obj)
        {
            Boolean result = false;
            result = await _objIUnitMasterRepository.DeleteAsync(obj);
            return result;
        }

        public Task<ICollection<UnitMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<UnitMaster>> GetAsync(UnitMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<UnitMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<UnitMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<UnitMaster> GetIdAsync(long Id)
        {
            return await _objIUnitMasterRepository.GetIdAsync(Id);
        }

        public Task<IEnumerable<UnitMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<UnitMaster>> GetListAsync()
        {
            return await _objIUnitMasterRepository.GetListAsync();
        }

        public async Task<IEnumerable<MonthMaster>> GetMonth()
        {
            return await _objIUnitMasterRepository.GetMonth();
        }

        public async Task<IEnumerable<YearMaster>> GetYear()
        {
            return await _objIUnitMasterRepository.GetYear();
        }

        public async Task<long> UpdateAsync(UnitMaster obj)
        {
            Int64 result = 0;
            result = await _objIUnitMasterRepository.UpdateAsync(obj);
            return result;
        }
    }
}
