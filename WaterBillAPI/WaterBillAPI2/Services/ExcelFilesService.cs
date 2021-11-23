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
    public class ExcelFilesService : IExcelFilesService
    {

        IExcelFilesRepository _objIExcelFilesRepository;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;

        public ExcelFilesService(IExcelFilesRepository repository, IConfiguration configuration, IHostingEnvironment env)
        {
            _objIExcelFilesRepository = repository;
            _iconfiguration = configuration;
            _env = env;
        }

        public async Task<long> AddAsync(ExcelFiles obj)
        {
            Int64 result = 0;
            result = await _objIExcelFilesRepository.AddAsync(obj);
            return result;
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(ExcelFiles obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<ExcelFiles>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<ExcelFiles>> GetAsync(ExcelFiles obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<ExcelFiles>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<ExcelFiles>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ExcelFiles> GetIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<ExcelFiles>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<ExcelFiles>> GetListAsync()
        {
            return await _objIExcelFilesRepository.GetListAsync();
        }

        public Task<long> UpdateAsync(ExcelFiles obj)
        {
            throw new NotImplementedException();
        }
    }
}
