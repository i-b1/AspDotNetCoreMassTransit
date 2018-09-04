using System.Threading.Tasks;
using Identity.Api.Models;
using Identity.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Identity.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IIdentityRepository _identityRespository;

        public UsersController(IIdentityRepository identityRespository)
        {
            _identityRespository = identityRespository;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(string id)
        {
            var user = await _identityRespository.GetUserAsync(id);
            return Ok(user);
        }

        [HttpGet("applicationcount/{id}")]
        public async Task<IActionResult> GetUserApplicantCount(string id)
        {
            var count = await _identityRespository.GetUserApplicationCountAsync(id);
            return Ok(count);
        }


        [HttpPost]
        public async Task<IActionResult> Post([FromBody]User value)
        {
            var user = await _identityRespository.UpdateUserAsync(value);
            return Ok(user);
        }
    }
}
