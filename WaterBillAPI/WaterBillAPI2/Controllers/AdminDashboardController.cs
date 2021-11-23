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
    public class AdminDashboardController : ControllerBase
    {
        private IAdminDashboardService _service;
        public AdminDashboardController(IAdminDashboardService service)
        {
            _service = service ?? throw new ArgumentNullException();
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthyear")]
        public async Task<IActionResult> GetMonthYear()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthYear();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getoverallunpaid")]
        public async Task<IActionResult> GetOverallUnPaid()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetOverallUnPaid();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("gettotaladvance")]
        public async Task<IActionResult> GetTotalAdvance()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetTotalAdvance();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("gettotalowner")]
        public async Task<IActionResult> GetTotalOwner()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetTotalOwner();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getcurrentpaid")]
        public async Task<IActionResult> GetCurrentPaid()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetCurrentPaid();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getcurrentunpaid")]
        public async Task<IActionResult> GetCurrentUnPaid()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetCurrentUnPaid();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthadvance")]
        public async Task<IActionResult> GetMonthAdvance()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthAdvance();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthcash")]
        public async Task<IActionResult> GetMonthCash()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthCash();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthcheque")]
        public async Task<IActionResult> GetMonthCheque()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthCheque();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthpaid")]
        public async Task<IActionResult> GetMonthPaid()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthPaid();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthunpaid")]
        public async Task<IActionResult> GetMonthUnPaid()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthUnPaid();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getoverallunpaidblockwise")]
        public async Task<IActionResult> GetOverallUnPaidBillStatusBlockWise()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetOverallUnPaidBillStatusBlockWise();

            return Ok(objResponse);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("getmonthreceived")]
        public async Task<IActionResult> GetMonthReceived()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetMonthReceived();

            return Ok(objResponse);
        }

    }
}