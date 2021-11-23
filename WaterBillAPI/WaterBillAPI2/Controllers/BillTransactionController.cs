using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Threading.Tasks;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
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
    public class BillTransactionController : ControllerBase
    {
        private IBillTransactionService _service;
        private IExcelFilesService _excelservice;

        public BillTransactionController(IBillTransactionService service, IExcelFilesService excelservice)
        {
            _service = service ?? throw new ArgumentNullException();
            _excelservice = excelservice ?? throw new ArgumentNullException();
        }

        [HttpPost]
        [Route("add")]
        [AllowAnonymous]
        public async Task<IActionResult> Add([FromBody] BillTransaction billTransaction)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;


            billTransaction.CreatedBy = ExtensionMethods.GetDetail(User.Identity as ClaimsIdentity);
            result = await _service.AddAsync(billTransaction);
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
        [AllowAnonymous]
        [Route("get1")]
        public async Task<IActionResult> Get1()
        {
            await _service.BillService();
            return Ok();
        }

        [HttpGet]
        [AllowAnonymous]
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

        [AllowAnonymous]
        [Route("upload")]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> Upload()
        {
            try
            {
                var file = Request.Form.Files[0];
                var folderName = Path.Combine("wwwroot", "Upload", "UserUpload");
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);

                if (file.Length > 0)                                                
                {
                    var fileName = ExtensionMethods.GetUniqueFileName(ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"'));
                    var dbPath = Path.Combine(folderName, fileName);


                    using (var stream = new FileStream(dbPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    BackgroundJob.Enqueue(() => _service.UploadFile(dbPath, fileName));
                    //await _service.UploadFile(dbPath, fileName);

                    return Ok("File Uploaded sucessfully,please wait for 10 min to finish job");
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        }



        [HttpGet]
        [AllowAnonymous]
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

        [HttpGet]
        [AllowAnonymous]
        [Route("getreport")]
        public async Task<IActionResult> GetReport(int? GroupId, int? OwnerId, int? PaymentType, int? BillStatus, DateTime? Startdate, DateTime? Endate)
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _service.GetReport(GroupId, OwnerId, PaymentType, BillStatus, Startdate, Endate);

            return Ok(objResponse);
        }


        [HttpGet]
        [AllowAnonymous]
        [Route("getexcelfile")]
        public async Task<IActionResult> GetExcelFiles()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _excelservice.GetListAsync();

            return Ok(objResponse);
        }


        [HttpPost]
        [Route("update")]
        [AllowAnonymous]
        public async Task<IActionResult> Update([FromBody] BillTransaction billTransaction)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;


            billTransaction.UpdatedBy = ExtensionMethods.GetDetail(User.Identity as ClaimsIdentity);
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
        [Route("billauto")]
        [AllowAnonymous]
        public async Task<IActionResult> BillService()
        {
            Boolean result = false;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;


            result = await _service.BillService();
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = result;
            return Ok(objResponse);
        }

    }
}