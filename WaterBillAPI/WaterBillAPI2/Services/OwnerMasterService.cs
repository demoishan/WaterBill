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
    public class OwnerMasterService : IOwnerMasterService
    {
        IOwnerMasterRepository _objIOwnerMasterRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public OwnerMasterService(IOwnerMasterRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIOwnerMasterRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<long> AddAsync(OwnerMaster obj)
        {
            Int64 result = 0;
            result = await _objIOwnerMasterRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(OwnerMaster obj)
        {
            Boolean result = false;
            result = await _objIOwnerMasterRepository.DeleteAsync(obj);
            return result;
        }

        public Task<ICollection<OwnerMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<OwnerMaster>> GetAsync(OwnerMaster obj)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<OwnerMaster>> GetByGroupIdAsync(long Id)
        {
            return await _objIOwnerMasterRepository.GetByGroupIdAsync(Id);
        }

        public async Task<IEnumerable<OwnerMaster>> GetByHouseNo(string HouseNumber)
        {
            return await _objIOwnerMasterRepository.GetByHouseNo(HouseNumber);
        }

        public Task<IEnumerable<OwnerMaster>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<OwnerMaster>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<OwnerMaster> GetIdAsync(long Id)
        {
            return await _objIOwnerMasterRepository.GetIdAsync(Id);
        }

        public Task<IEnumerable<OwnerMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<OwnerMaster>> GetListAsync()
        {
            return await _objIOwnerMasterRepository.GetListAsync();
        }

        public async Task<long> UpdateAsync(OwnerMaster obj)
        {
            Int64 result = 0;
            result = await _objIOwnerMasterRepository.UpdateAsync(obj);
            return result;
        }
    }
}
