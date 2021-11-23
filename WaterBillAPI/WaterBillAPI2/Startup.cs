using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using WebApi.Helpers;
using WebApi.Services;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using WebApi.Repository;
using WebApi.Interface;
using System.Data.Common;
using System.Data.SqlClient;
using Hangfire;
using Hangfire.SqlServer;
using System;
using DinkToPdf;
using DinkToPdf.Contracts;
using static WebApi.Helpers.ExtensionMethods;

namespace WebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public DbConnection DbConnection => new SqlConnection(Configuration.GetConnectionString("MyConnectionString"));

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            // Add Hangfire services.
            services.AddHangfire(configuration => configuration
                .SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
                .UseSimpleAssemblyNameTypeSerializer()
                .UseRecommendedSerializerSettings()
                .UseSqlServerStorage(Configuration.GetConnectionString("MyConnectionString"), new SqlServerStorageOptions
                {
                    CommandBatchMaxTimeout = TimeSpan.FromMinutes(5),
                    SlidingInvisibilityTimeout = TimeSpan.FromMinutes(5),
                    QueuePollInterval = TimeSpan.Zero,
                    UseRecommendedIsolationLevel = true,
                    UsePageLocksOnDequeue = true,
                    DisableGlobalLocks = true
                }));

            // Add the processing server as IHostedService
            services.AddHangfireServer();

            // Add converter to DI
            services.AddSingleton(typeof(IConverter), new SynchronizedConverter(new PdfTools()));

            services.AddCors();
            services.AddControllers();

            // configure strongly typed settings objects
            var appSettingsSection = Configuration.GetSection("AppSettings");
            services.Configure<AppSettings>(appSettingsSection);

            // configure jwt authentication
            var appSettings = appSettingsSection.Get<AppSettings>();
            var key = Encoding.ASCII.GetBytes(appSettings.Secret);
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });


            services.AddAuthorization(options =>
            {
                options.AddPolicy(StringConstant.Claims_AdminOnly, policy =>
                      policy.RequireRole(StringConstant.Role_Admin));

                options.AddPolicy(StringConstant.Claims_UserOnly, policy =>
                     policy.RequireRole(StringConstant.Role_User));

                options.AddPolicy(StringConstant.Claims_SuperAdmin2, policy =>
                     policy.RequireRole(StringConstant.Role_Admin, StringConstant.Role_SuperAdmin));
            });

            services.AddAuthorization(options =>
            {
               
            });




            services.AddSingleton<IConfiguration>(Configuration);
            services.AddTransient<DbConnection>((conn) => DbConnection);

            // configure DI for application services
            //services.AddScoped<IUserService, UserService>();
            services.AddSingleton<IStudentService, StudentService>();
            services.AddSingleton<IStudentRepository, StudentRepository>();

            services.AddSingleton<IGroupMasterService, GroupMasterService>();
            services.AddSingleton<IGroupMasterRepository, GroupMasterRepository>();

            services.AddSingleton<IFinancialYearMasterService, FinancialYearMasterService>();
            services.AddSingleton<IFinancialYearMasterRepository, FiancialYearMasterRepository>();

            services.AddSingleton<IUnitMasterService, UnitMasterService>();
            services.AddSingleton<IUnitMasterRepository, UnitMasterRepository>();

            services.AddSingleton<IMaintenanceMasterService, MaintenanceMasterService>();
            services.AddSingleton<IMaintenanceMasterRepository, MaintenanceMasterRepository>();

            services.AddSingleton<IAdvanceMasterService, AdvanceMasterService>();
            services.AddSingleton<IAdvanceMasterRepository, AdvanceMasterRepository>();

            services.AddSingleton<IOwnerMasterService, OwnerMasterService>();
            services.AddSingleton<IOwnerMasterRepository, OwnerMasterRepository>();

            services.AddSingleton<IBillTransactionService, BillTransactionService>();
            services.AddSingleton<IBillTransactionRepository, BillTransactionRepository>();

            services.AddSingleton<IExcelFilesService, ExcelFilesService>();
            services.AddSingleton<IExcelFilesRepository, ExcelFilesRepository>();

            services.AddSingleton<IAdminDashboardService, AdminDashboardService>();
            services.AddSingleton<IAdminDashboardRepository, AdminDashboardRepository>();

            services.AddSingleton<IUserPanelService, UserPanelService>();
            services.AddSingleton<IUserPanelRepository, UserPanelRepository>();

            services.AddSingleton<IUserService, UserService>();
            services.AddSingleton<IUserRepository, UserRepository>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IBackgroundJobClient backgroundJobs)
        {
            //app.UseDefaultFiles();
            app.UseStaticFiles();

            app.UseRouting();

            //app.UseHangfireDashboard();
            app.UseHangfireDashboard("/jobs", new DashboardOptions() { });

            RecurringJob.AddOrUpdate<IBillTransactionService>(_serv => _serv.BillService(), Cron.Hourly);

            // global cors policy
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
