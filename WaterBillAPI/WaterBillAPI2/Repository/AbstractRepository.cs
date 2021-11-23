using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Interface;

namespace WebApi.Repository
{
    public abstract class AbstractRepository<T> : IAbstractRepository<T>
    {
        public Task<long> AddAsync(T obj)
        {
            throw new NotImplementedException();
        }

        public Task<bool> CheckExistsAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(T obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<T>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<T>> GetAsync(T obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<T>> GetByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<T> GetIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<T>> GetByListByIdAsync(Int64 Id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<T>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<T>> GetListAsync()
        {
            throw new NotImplementedException();
        }

        public Task<long> UpdateAsync(T obj)
        {
            throw new NotImplementedException();
        }
    }
}
