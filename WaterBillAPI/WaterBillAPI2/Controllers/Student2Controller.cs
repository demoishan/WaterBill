using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApi.Helpers;
using WebApi.Interface;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Admin")]
    public class Student2Controller : ControllerBase
    {
        private IStudentService _service;
        public Student2Controller(IStudentService service)
        {
            _service = service ?? throw new ArgumentNullException();
        }

        [HttpPost]
        [Route("add")]
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
        [Route("getall")]
        public async Task<IActionResult> GetAllStudnet()
        {
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetListAsync();

            return Ok(objResponse.Result);
        }



        [HttpGet]
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
    }
}