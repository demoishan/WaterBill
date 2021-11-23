using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Interface
{
    public interface IAbstractService<T>
    {
        Task<IEnumerable<T>> GetByIdAsync(Int64 Id);
        Task<ICollection<T>> GetByListByIdAsync(Int64 Id);
        Task<ICollection<T>> GetAsync(T obj);
        Task<IEnumerable<T>> GetListAsync();
        Task<IEnumerable<T>> GetListAciveAsync(string Flag);
        Task<ICollection<T>> GetAllAsync();
        Task<Int64> UpdateAsync(T obj);
        Task<Int64> AddAsync(T obj);
        Task<bool> DeleteAsync(T obj);
        Task<bool> CheckExistsAsync(Int64 Id);
        Task<T> GetIdAsync(Int64 Id);
    }
}
