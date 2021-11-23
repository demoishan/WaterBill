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
    public class AdvanceMasterService : IAdvanceMasterService
    {
        IAdvanceMasterRepository _objIAdvanceMasterRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public AdvanceMasterService(IAdvanceMasterRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIAdvanceMasterRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<long> AddAsync(AdvanceMaster obj)
        {
            Int64 result = 0;
            result = await _objIAdvanceMasterRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(AdvanceMaster obj)
        {
            Boolean result = false;
            result = await _objIAdvanceMasterRepository.DeleteAsync(obj);
            return result;
        }

        public Task<ICollection<AdvanceMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<AdvanceMaster>> GetAsync(AdvanceMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<AdvanceMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<AdvanceMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<AdvanceMaster> GetIdAsync(long Id)
        {
            return await _objIAdvanceMasterRepository.GetIdAsync(Id);
        }

        public Task<IEnumerable<AdvanceMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<AdvanceMaster>> GetListAsync()
        {
            return await _objIAdvanceMasterRepository.GetListAsync();
        }

        public async Task<long> UpdateAsync(AdvanceMaster obj)
        {
            Int64 result = 0;
            result = await _objIAdvanceMasterRepository.UpdateAsync(obj);
            return result;
        }
    }
}
