using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Interface;
using WebApi.Models;
using static WebApi.Helpers.ExtensionMethods;

namespace WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private IStudentService _service;
        public StudentController(IStudentService service)
        {
            _service = service ?? throw new ArgumentNullException();
        }

        [HttpPost]
        [Route("add")]
        [AllowAnonymous]
        public async Task<IActionResult> InsertStudnet([FromBody] StudentMaster studentMaster)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;

            result = await _service.AddAsync(studentMaster);
            if (result == 0)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                studentMaster.StudentId = result;
                objResponse.Result = studentMaster;
            }
            return Ok(objResponse);
        }

        [HttpGet]
        //[AllowAnonymous]
        //[Authorize(Policy = Policies.User)]
        [Authorize(Policy = "AdminOnly")]
        [Route("getall")]
        public async Task<IActionResult> GetAllStudnet()
        {

            Int64 CR = ExtensionMethods.GetDetail(User.Identity as ClaimsIdentity);

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetListAsync();

            return Ok(objResponse.Result);
        }

        [HttpGet]
        //[AllowAnonymous]
        //[Authorize(Policy = Policies.Admin,Roles = Policies.SuperAdmin)]
        [Authorize(Policy = "UserOnly")]
        [Authorize()]

        [Route("getall2")]
        public async Task<IActionResult> GetAllStudnet2()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetListAsync();

            return Ok(objResponse);
        }

        [HttpGet]
        //[AllowAnonymous]
        //[Authorize(Policy = Policies.SuperAdmin)]
        [Authorize(Policy = "SuperAdmin2")]
        [Route("getall3")]
        public async Task<IActionResult> GetAllStudnet3()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetListAsync();

            return Ok(objResponse);
        }
    }
}