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
    public class MaintenanceMasterService : IMaintenanceMasterService
    {
        IMaintenanceMasterRepository _objIMaintenanceMasterRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public MaintenanceMasterService(IMaintenanceMasterRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIMaintenanceMasterRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<long> AddAsync(MaintenanceMaster obj)
        {
            Int64 result = 0;
            result = await _objIMaintenanceMasterRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(MaintenanceMaster obj)
        {
            Boolean result = false;
            result = await _objIMaintenanceMasterRepository.DeleteAsync(obj);
            return result;
        }

        public Task<ICollection<MaintenanceMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<MaintenanceMaster>> GetAsync(MaintenanceMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<MaintenanceMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<MaintenanceMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<MaintenanceMaster> GetIdAsync(long Id)
        {
            return await _objIMaintenanceMasterRepository.GetIdAsync(Id);
        }

        public Task<IEnumerable<MaintenanceMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<MaintenanceMaster>> GetListAsync()
        {
            return await _objIMaintenanceMasterRepository.GetListAsync();
        }

        public async Task<long> UpdateAsync(MaintenanceMaster obj)
        {
            Int64 result = 0;
            result = await _objIMaintenanceMasterRepository.UpdateAsync(obj);
            return result;
        }

        async Task<IEnumerable<MaintenanceMaster>> IMaintenanceMasterService.GetByGroupIdAsync(long Id)
        {
            return await _objIMaintenanceMasterRepository.GetByGroupIdAsync(Id);
        }
    }
}
