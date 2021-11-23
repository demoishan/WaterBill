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
    public class GroupMasterService : IGroupMasterService
    {
        IGroupMasterRepository _objIGroupMasterRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public GroupMasterService(IGroupMasterRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIGroupMasterRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }


        public async Task<long> AddAsync(GroupMaster obj)
        {
            Int64 result = 0;
            result = await _objIGroupMasterRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(GroupMaster obj)
        {
            Boolean result = false;
            result = await _objIGroupMasterRepository.DeleteAsync(obj);
            return result;
        }

        public Task<ICollection<GroupMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<GroupMaster>> GetAsync(GroupMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<GroupMaster>> GetByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public async Task<GroupMaster> GetIdAsync(long Id)
        {
            return await _objIGroupMasterRepository.GetIdAsync(Id);
        }

        public Task<ICollection<GroupMaster>> GetByListByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<GroupMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<GroupMaster>> GetListAsync()
        {
            return await _objIGroupMasterRepository.GetListAsync();
        }

        public async Task<long> UpdateAsync(GroupMaster obj)
        {
            Int64 result = 0;
            result = await _objIGroupMasterRepository.UpdateAsync(obj);
            return result;
        }
    }
}
