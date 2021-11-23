using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
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
    [Authorize(Policy = StringConstant.Claims_AdminOnly)]
    [ApiController]
    public class GroupMasterController : ControllerBase
    {
        private IGroupMasterService _service;
        public GroupMasterController(IGroupMasterService service)
        {
            _service = service ?? throw new ArgumentNullException();
        }

        [HttpPost]
        [Route("add")]
        //[AllowAnonymous]
        public async Task<IActionResult> Add([FromBody] GroupMaster groupMaster)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;

            groupMaster.CreatedBy = ExtensionMethods.GetDetail(User.Identity as ClaimsIdentity);
            result = await _service.AddAsync(groupMaster);
            if (result == 0)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                groupMaster.GroupId = result;
                objResponse.Result = groupMaster;
            }
            return Ok(objResponse);
        }

        [HttpGet]
        //[AllowAnonymous]
        [Route("get")]
        public async Task<IActionResult> Get()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;

            return Ok(objResponse);
        }

        [HttpGet]
        //[AllowAnonymous]
        [Route("getbyid")]
        public async Task<IActionResult> GetById(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetIdAsync(Id);

            return Ok(objResponse);
        }


        [HttpGet]
        //[AllowAnonymous]
        [Route("getall")]
        public async Task<IActionResult> GetAll()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetListAsync();

            return Ok(objResponse);
        }


        [HttpPost]
        [Route("update")]
        //[AllowAnonymous]
        public async Task<IActionResult> Update([FromBody] GroupMaster groupMaster)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;

            groupMaster.UpdatedBy = ExtensionMethods.GetDetail(User.Identity as ClaimsIdentity);

            result = await _service.UpdateAsync(groupMaster);
            if (result == 0)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                groupMaster.GroupId = result;
                objResponse.Result = groupMaster;
            }
            return Ok(objResponse);
        }


        [HttpPost]
        [Route("delete")]
        //[AllowAnonymous]
        public async Task<IActionResult> Delete([FromBody] GroupMaster groupMaster)
        {
            Boolean result = false;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;


            result = await _service.DeleteAsync(groupMaster);
            if (result == false)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                //groupMaster.GroupId = groupMaster.GroupId;
                objResponse.Result = groupMaster;
            }
            return Ok(objResponse);
        }
    }
}