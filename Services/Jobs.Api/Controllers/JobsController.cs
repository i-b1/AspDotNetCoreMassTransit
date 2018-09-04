using System.Collections.Generic;
using System.Threading.Tasks;
using Events;
using Jobs.Api.Models;
using Jobs.Api.Services;
using MassTransit;
using Microsoft.AspNetCore.Mvc;

namespace Jobs.Api.Controllers
{
    [Route("api/[controller]")]
    public class JobsController : ControllerBase
    {
        private readonly IJobRepository _jobRepository;
        private readonly IBus _bus;

        public JobsController(IJobRepository jobRepository, IBus bus)
        {
            _jobRepository = jobRepository;
            _bus = bus;
        }

        [HttpGet]
        public async Task<IEnumerable<Job>> Get()
        {
            return await _jobRepository.GetAll();
        }

        [HttpGet("{id}")]
        public async Task<Job> Get(int id)
        {
            return await _jobRepository.Get(id);
        }

        [HttpPost("/api/jobs/applicants")]
        public async Task<IActionResult> Post([FromBody]JobApplicant model)
        {
            // fetch the job data
            var job = await _jobRepository.Get(model.JobId);
            var id = await _jobRepository.AddApplicant(model);

            // commands should be sent to specific endpoint:
            //var endpoint = await _bus.GetSendEndpoint(new Uri("rabbitmq://rabbitmq/dncmt"));  //?bind=true&queue=dncmt
            //await endpoint.Send<ApplicantApplyCommand>(new  { model.JobId,model.ApplicantId,job.Title});

            // events should be published widely:
            await _bus.Publish<ApplicantAppliedEvent>(new { model.JobId, model.ApplicantId, job.Title });
            return Ok(id);
        }       
    }
}
