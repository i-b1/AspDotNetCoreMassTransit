
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Identity.Api.Models;
using Newtonsoft.Json;
//using StackExchange.Redis;

namespace Identity.Api.Services
{
    public class IdentityRepository : IIdentityRepository
    {
        private readonly Dictionary<string, User> _database;
        private readonly Dictionary<string, long> _cnt;

        public IdentityRepository()
        {
            _database = new Dictionary<string, User>();
            _cnt = new Dictionary<string, long>();
        }

        public async Task<User> UpdateUserAsync(User user)
        {
            var created = _database.TryAdd(user.Id, user);
            if (!created) return null;
            return await GetUserAsync(user.Id);
        }

        public async Task<long> UpdateUserApplicationCountAsync(string userId)
        {
            if(!_cnt.ContainsKey(userId))
            {
                _cnt[userId] = 1;
            }
            else
            {
                _cnt[userId] = _cnt[userId] + 1;
            }
            return _cnt[userId];
        }

        public async Task<User> GetUserAsync(string userId)
        {
            return _database[userId];
        }

        public async Task<long> GetUserApplicationCountAsync(string userId)
        {
            return (_cnt.ContainsKey(userId))? _cnt[userId] : 0;
        }
    }
}
