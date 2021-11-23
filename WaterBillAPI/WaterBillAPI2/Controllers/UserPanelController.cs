using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApi.Helpers;
using WebApi.Interface;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserPanelController : ControllerBase
    {
        private IUserPanelService _service;

        public UserPanelController(IUserPanelService service)
        {
            _service = service ?? throw new ArgumentNullException();
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getpaid")]
        public async Task<IActionResult> GetPaid(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetPaidTransaction(Id);

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getunpaid")]
        public async Task<IActionResult> GetUnPaid(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetUnpaidTransaction(Id);

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getunitused")]
        public async Task<IActionResult> GetUnitUsed(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetUnitsUsed(Id);

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getcurrentmonth")]
        public async Task<IActionResult> GetCurrentMonth(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetCurrentMonth(Id);

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getcurrenttotal")]
        public async Task<IActionResult> GetCurrentTotal(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetCurrentTotal(Id);

            return Ok(objResponse);
        }


        [HttpPost]
        [Route("pay")]
        //[AllowAnonymous]
        public async Task<IActionResult> Update([FromBody] BillTransaction billTransaction)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;

            result = await _service.UpdateAsync(billTransaction);
            if (result == 0)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                billTransaction.BillId = result;
                objResponse.Result = billTransaction;
            }
            return Ok(objResponse);
        }


        [HttpGet]
        [AllowAnonymous]
        [Route("getownerid")]
        public async Task<IActionResult> GetOwnerId(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetOwnerId(Id);

            return Ok(objResponse);
        }


        [HttpGet]
        [AllowAnonymous]
        [Route("gettotal")]
        public async Task<IActionResult> GetTotal(Int64 Id)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetTotal(Id);

            return Ok(objResponse);
        }
    }
}