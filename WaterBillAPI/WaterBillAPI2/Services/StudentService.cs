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
    public class StudentService : IStudentService
    {

        IStudentRepository _objIContactUsRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;
 
        public StudentService(IStudentRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIContactUsRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }
        public async Task<long> AddAsync(StudentMaster obj)
        {
            Int64 result = 0;
            result = await _objIContactUsRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> CheckExistsAsync(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(StudentMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<StudentMaster>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<StudentMaster>> GetAsync(StudentMaster obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<StudentMaster>> GetByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<StudentMaster> GetIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<StudentMaster>> GetByListByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<StudentMaster>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<StudentMaster>> GetListAsync()
        {
            return await _objIContactUsRepository.GetListAsync();
        }

        public Task<long> UpdateAsync(StudentMaster obj)
        {
            throw new NotImplementedException();
        }
    }
}
