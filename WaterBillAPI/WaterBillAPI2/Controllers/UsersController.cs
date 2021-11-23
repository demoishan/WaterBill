using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using WebApi.Services;
using WebApi.Models;
using System.Linq;
using WebApi.Interface;
using System.Threading.Tasks;
using WebApi.Helpers;
using System;
using WebApi.Entities;

namespace WebApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        private IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }


        [AllowAnonymous]
        [HttpPost("authenticate")]
        public async Task<IActionResult> AuthenticateAsync([FromBody]AuthenticateModel model)
        {
            var user =await _userService.LoginAuthenticateAsync(model.Username, model.Password);

            if (user == null)
                return BadRequest(new { message = "Username or password is incorrect" });

            return Ok(user);
        }


        //[HttpGet]
        //public IActionResult GetAll()
        //{
        //    var users = _userService.GetAll();
        //    return Ok(users);
        //}


        [HttpGet]
        [AllowAnonymous]
        [Route("getalllist")]
        public async Task<IActionResult> GetAllList()
        {

            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;
            objResponse.Status = System.Net.HttpStatusCode.OK;
            objResponse.Result = await _userService.GetListAsync();

            return Ok(objResponse);
        }


        [HttpPost]
        [Route("add")]
        //[AllowAnonymous]
        public async Task<IActionResult> Add([FromBody] User user)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;

            result = await _userService.AddAsync(user);
            if (result == 0)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                user.UserId = result;
                objResponse.Result = user;
            }
            return Ok(objResponse);
        }


        [HttpPost]
        [Route("update")]
        //[AllowAnonymous]
        public async Task<IActionResult> Update([FromBody] User user)
        {
            Int64 result = 0;
            Response<object> objResponse = new Response<object>();
            objResponse.IsError = false;
            objResponse.Message = StringConstant.Blank;

            result = await _userService.UpdateAsync(user);
            if (result == 0)
            {
                objResponse.Status = System.Net.HttpStatusCode.InternalServerError;
                objResponse.IsError = true;
                objResponse.Message = StringConstant.SomethingWentWrong;
            }
            else
            {
                objResponse.Status = System.Net.HttpStatusCode.OK;
                user.UserId = result;
                objResponse.Result = user;
            }
            return Ok(objResponse);
        }


        [HttpGet]
        [Route("GetUserData")]
        [Authorize(Policy = "User")]
        public IActionResult GetUserData()
        {
            return Ok("This is an normal user");
        }


        [HttpGet]
        [Route("GetAdminData")]
        //[AllowAnonymous]
        [Authorize(Roles = "Admin")]
        public IActionResult GetAdminData()
        {
            return Ok("This is an Admin user");
        }
    }
}
