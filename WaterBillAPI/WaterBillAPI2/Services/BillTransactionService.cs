using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.Helpers;
using WebApi.Interface;
using WebApi.Models;
using static WebApi.Helpers.Enums;

namespace WebApi.Services
{
    public class BillTransactionService : IBillTransactionService
    {
        IBillTransactionRepository _objIBillTransactionRepository;
        IExcelFilesService _objIExcelFilesService;
        IMaintenanceMasterService _objIMaintenanceMasterService;
        IGroupMasterService _objIGroupMasterService;
        IOwnerMasterService _objIOwnerMasterService;
        IUnitMasterService _objIUnitMasterService;
        IConfiguration _iconfiguration;
        private IHostingEnvironment _env;
        private IConverter _converter;

        public BillTransactionService(IBillTransactionRepository objIBillTransactionRepository,
            IGroupMasterService objIGroupMasterService,
            IMaintenanceMasterService objIMaintenanceMasterService,
            IOwnerMasterService objIOwnerMasterService,
            IExcelFilesService objIExcelFilesService,
            IUnitMasterService objIUnitMasterService,
            IConfiguration configuration,
            IHostingEnvironment env,
            IConverter converter)
        {
            _objIBillTransactionRepository = objIBillTransactionRepository;
            _objIMaintenanceMasterService = objIMaintenanceMasterService;
            _objIGroupMasterService = objIGroupMasterService;
            _objIOwnerMasterService = objIOwnerMasterService;
            _objIExcelFilesService = objIExcelFilesService;
            _objIUnitMasterService = objIUnitMasterService;
            _iconfiguration = configuration;
            _env = env;
            _converter = converter;
        }

        public async Task<long> AddAsync(BillTransaction obj)
        {
            Int64 result = 0;
            if (obj.CurrentUnit > obj.LastUnit)
            {

                obj.Penalty = 0;
                obj.BillStatus = BillStatus.BillGenrate;
                obj.BillDueDate = new DateTime(obj.Year, obj.Month, 1);
                obj.BillDate = new DateTime(obj.Year, obj.Month, 1);
                result = await _objIBillTransactionRepository.AddAsync(obj);

                if (result > 0)
                {
                    await GeneratePDF(result);
                }

            }
            return result;
        }


        public async Task GeneratePDF(long billNo)
        {

            try
            {
                var fileName = ExtensionMethods.GetUniqueFileName("ReceiptPDF");
                var folderName = Path.Combine("wwwroot", "Upload", "ReceiptPDF");
                var dbPath = Path.Combine(folderName, fileName);
                dbPath = dbPath + ".pdf";

                string societyName = "Umiya(Gota)Owner's Association";
                string societyAddress = "Narayandham Bunglows,Nr Kharikat Canal,Nikol,Ahmedabad";
                string rgNO = "G11552";

                BillTransaction bill = await GetIdAsync(billNo);
                OwnerMaster ownerMaster = await _objIOwnerMasterService.GetIdAsync(bill.OwnerId);
                IEnumerable<UnitMaster> unitMasters = await _objIUnitMasterService.GetListAsync();
                UnitMaster unitMaster = unitMasters.FirstOrDefault();

                #region HTML 
                StringBuilder sb = new StringBuilder();
                sb.Append("<table>");
                sb.Append("<tr>");
                sb.Append("<td style='width: 100%; text-align: center;'>");
                sb.Append("<table>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' align='center'>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' align='center'>");
                sb.Append("<h3>");
                sb.Append("<strong> " + societyName + " </strong>");
                sb.Append("</h3>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' align='center'>");
                sb.Append("<label>");
                sb.Append("<span style='color: black; font-size:8px; text-align: center;'>");
                sb.Append("<b> " + societyAddress + " </b>");
                sb.Append("</span>");
                sb.Append("</label>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' align='center'>");
                sb.Append("<span style='color: black; font-size:8px; text-align: center;'>R.G.NO : " + rgNO + "</span>");
                sb.Append("<br />");

                sb.Append("<span style='color: black; font-size:8px; text-align: center;'>RECEIPT FOR MONTH :<b> " + ExtensionMethods.GetMonthName(bill.Month) + " - " + bill.Year + "</b></span>");
                sb.Append("</td>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' align='center'>");
                sb.Append("</tr>");
                sb.Append("<span style='text-align: center;'>_________________________________________________</span>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2'>");
                sb.Append("<table style='width: 100%; border:1; text-align: center;'>");

                sb.Append("<tr>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'> Receipt No: </td>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'> " + bill.ReceiptNo + "</td>");
                sb.Append("<td colspan='2' style='font-size:11px;text-align: left; '>Name :  " + ownerMaster.OwnerName + "</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'>Date :</td>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'> " + ExtensionMethods.ConvertToIndianDate(System.DateTime.Now) + "</td>");
                sb.Append("<td colspan='2' style='font-size:11px; text-align: left;'>Bno:  " + ownerMaster.BunglowNo + "</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'>Current Unit :</td>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'> " + bill.CurrentUnit + "</td>");
                sb.Append("<td colspan='2' style='font-size:11px;text-align: left; '>Past Unit :  " + bill.LastUnit + " </td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'>Unit Rate per One Unit :</td>");
                sb.Append("<td colspan='2' style='text-align: left; font-size:11px;'> " + unitMaster.UnitRate + "</td>");
                sb.Append("<td colspan='2' style='font-size:11px;text-align: left; '>Bill Due date :  " + ExtensionMethods.ConvertToIndianDate(bill.BillDueDate) + " </td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td colspan='6' align='center'>");
                sb.Append("<span style='text-align: center;'>___________________________________________________</span>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='1' style='text-align:right; font-size:11px;'>Sr.No</td>");
                sb.Append("<td colspan='3' style='text-align:center; font-size:11px;'>Detail</td>");
                sb.Append("<td colspan='2' style='font-size:11px; text-align:left;'>Amount</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='6' align='center'>");
                sb.Append("<span style='text-align: center;'>___________________________________________________</span>");
                sb.Append("</td>");
                sb.Append("</tr>");

                int count = 1;

                sb.Append("<tr>");
                sb.Append("<td colspan='1' style='text-align:right; font-size:11px;'>" + count + "</td>");
                sb.Append("<td colspan='3' style='text-align:center; font-size:11px;'>Water Charge</td>");
                sb.Append("<td colspan='2' style='font-size:11px; text-align:left;'> " + bill.WaterBillAmount + "</td>");
                sb.Append("</tr>");
                count++;

                sb.Append("<tr>");
                sb.Append("<td colspan='1' style='text-align:right; font-size:11px;'>" + count + "</td>");
                sb.Append("<td colspan='3' style='text-align:center; font-size:11px;'> Maintenance </td>");
                sb.Append("<td colspan='2' style='font-size:11px; text-align:left;'> " + bill.Maintenance + "</td>");
                sb.Append("</tr>");
                count++;

                if (bill.OtherCharge > 0)
                {
                    sb.Append("<tr>");
                    sb.Append("<td colspan='1' style='text-align:right; font-size:11px;'>" + count + "</td>");
                    sb.Append("<td colspan='3' style='text-align:center; font-size:11px;'> OtherCharge </td>");
                    sb.Append("<td colspan='2' style='font-size:11px; text-align:left;'> " + bill.OtherCharge + "</td>");
                    sb.Append("</tr>");
                }
                count++;

                if (bill.Penalty > 0)
                {
                    sb.Append("<tr>");
                    sb.Append("<td colspan='1' style='text-align:right; font-size:11px;'>" + count + "</td>");
                    sb.Append("<td colspan='3' style='text-align:center; font-size:11px;'> Penalty </td>");
                    sb.Append("<td colspan='2' style='font-size:11px; text-align:left;'> " + bill.Penalty + "</td>");
                    sb.Append("</tr>");
                    count++;
                }


                sb.Append("<tr>");
                sb.Append("<td colspan='6' align='center'>");
                sb.Append("<span style='text-align: center;'>___________________________________________________</span>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2' style='text-align:right; font-size:11px;'></td>");
                sb.Append("<td colspan='2' style='text-align:center; font-size:11px;'>Total</td>");
                sb.Append("<td colspan='2' style='font-size:11px; text-align:left;'> " + bill.Total + "</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='6' align='center'>");
                sb.Append("<span style='text-align: center;'>___________________________________________________</span>");
                sb.Append("</td>");
                sb.Append("</table>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                #endregion


                var globalSettings = new GlobalSettings
                {
                    ColorMode = ColorMode.Color,
                    Orientation = Orientation.Portrait,
                    PaperSize = PaperKind.A5,
                    Margins = new MarginSettings { Top = 10 },
                    DocumentTitle = "PDF Report",
                    Out = dbPath
                };

                var objectSettings = new ObjectSettings
                {
                    PagesCount = true,
                    HtmlContent = sb.ToString(),
                    WebSettings = { DefaultEncoding = "utf-8", UserStyleSheet = Path.Combine(Directory.GetCurrentDirectory(), "libwkhtmltox.dll") },
                    HeaderSettings = { FontName = "Arial", FontSize = 9, Right = "Page [page] of [toPage]", Line = true },
                    FooterSettings = { FontName = "Arial", FontSize = 9, Line = true, Center = "Report Footer" }
                };

                var pdf = new HtmlToPdfDocument()
                {
                    GlobalSettings = globalSettings,
                    Objects = { objectSettings }
                };

                _converter.Convert(pdf);

                bill.ReceiptURL = dbPath.Replace("wwwroot", "");
                await UpdatePDFFileLocation(bill);



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> BillService()
        {
            Boolean result = false;
            result = await _objIBillTransactionRepository.BillService();
            return result;

            //await GeneratePDF(20);
            //return true;
        }

        public Task<bool> CheckExistsAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(BillTransaction obj)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<BillTransaction>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<BillTransaction>> GetAsync(BillTransaction obj)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<BillTransaction>> GetByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<BillTransaction>> GetByListByIdAsync(long Id)
        {
            throw new NotImplementedException();
        }

        public async Task<BillTransaction> GetIdAsync(long Id)
        {
            return await _objIBillTransactionRepository.GetIdAsync(Id);
        }

        public Task<IEnumerable<BillTransaction>> GetListAciveAsync(string Flag)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<BillTransaction>> GetListAsync()
        {
            return await _objIBillTransactionRepository.GetListAsync();
        }

        public async Task<long> UpdateAsync(BillTransaction obj)
        {
            Int64 result = 0;
            result = await _objIBillTransactionRepository.UpdateAsync(obj);
            return result;
        }



        public async Task<bool> UploadFile(string fileUpload, string fileName)
        {
            ExcelFiles excelFiles = new ExcelFiles();
            excelFiles.UploadFileName = fileName;
            excelFiles.UploadURL = fileUpload.Replace("wwwroot", "");

            IEnumerable<MaintenanceMaster> maintenanceMasters = await _objIMaintenanceMasterService.GetListAsync();
            IEnumerable<GroupMaster> groupMasters = await _objIGroupMasterService.GetListAsync();
            IEnumerable<OwnerMaster> ownerMasters = await _objIOwnerMasterService.GetListAsync();
            List<BulkUpload> bulkUploadsRead = ReadExcel(fileUpload);

            bulkUploadsRead = FindGroupIdAndMaintenance(bulkUploadsRead, maintenanceMasters, groupMasters, ownerMasters);
            List<BulkUpload> bulkUploads2 = await InserttoDBAsync(bulkUploadsRead);

            string DownloadPath = "";
            WriteExcel(bulkUploads2, ref DownloadPath, fileName);
            excelFiles.DownloadURL = DownloadPath.Replace("wwwroot", "");
            if (bulkUploads2.Any() && bulkUploads2.Count > 0)
            {
                excelFiles.Pass = bulkUploads2.Where(i => i.uploadStatus == UploadStatus.Pass).Count();
                excelFiles.Fail = bulkUploads2.Where(i => i.uploadStatus == UploadStatus.Fail).Count();
            }

            await _objIExcelFilesService.AddAsync(excelFiles);

            return true;
        }

        private async Task<List<BulkUpload>> InserttoDBAsync(List<BulkUpload> bulkUploads)
        {
            foreach (var item in bulkUploads.Where(i => i.uploadStatus == UploadStatus.Pass))
            {
                BillTransaction billTransaction = new BillTransaction();
                billTransaction.OwnerId = item.OwnerId;
                billTransaction.LastUnit = item.LastUnit;
                billTransaction.CurrentUnit = item.CurrentUnit;
                billTransaction.Year = item.Year;
                billTransaction.Month = item.Month;
                billTransaction.Maintenance = item.Maintenance;
                billTransaction.OtherCharge = item.OtherCharge;

                if (billTransaction.CurrentUnit > billTransaction.LastUnit)
                {
                    Int64 result = 0;
                    result = await AddAsync(billTransaction);
                    if (result! < 0)
                    {
                        item.uploadStatus = UploadStatus.Fail;
                        item.Remarks = "check why fail";
                    }
                }
                else
                {
                    item.uploadStatus = UploadStatus.Fail;
                    item.Remarks = "Currrent unit must more then Last unit";
                }


            }
            return bulkUploads;
        }

        private List<BulkUpload> FindGroupIdAndMaintenance(List<BulkUpload> bulkUploads, IEnumerable<MaintenanceMaster> maintenanceMasters,
            IEnumerable<GroupMaster> groupMasters, IEnumerable<OwnerMaster> ownerMasters)
        {
            foreach (var item in bulkUploads.Where(i => i.uploadStatus == UploadStatus.Pass))
            {
                if (item.Block != null)
                {
                    GroupMaster group = groupMasters.Where(i => i.GroupName == item.Block).FirstOrDefault();
                    item.GroupId = group.GroupId;


                    OwnerMaster ownerMaster = ownerMasters.Where(i => i.BunglowNo == (item.Block + "-" + item.BunglowNo)).FirstOrDefault();

                    if (ownerMaster != null)
                    {
                        item.OwnerId = ownerMaster.OwnerId;
                        item.LastUnit = ownerMaster.LastUnit;
                    }
                }
            }
            return bulkUploads;
        }

        private List<BulkUpload> ReadExcel(string fullPath)
        {
            XSSFWorkbook hssfworkbook;
            using (FileStream fs = new FileStream(fullPath, FileMode.Open, FileAccess.Read))
            {
                hssfworkbook = new XSSFWorkbook(fs);
            }

            List<BulkUpload> bulkUploads = new List<BulkUpload>();
            //excel and word from here
            ISheet sheet = hssfworkbook.GetSheetAt(0);
            System.Collections.IEnumerator rows = sheet.GetRowEnumerator();

            IRow headerRow = sheet.GetRow(0);
            int totalColumns = headerRow.Cells.Count;


            for (int i = (sheet.FirstRowNum + 1); i <= sheet.LastRowNum; i++)
            {

                IRow row = sheet.GetRow(i);
                if (row == null)
                {
                    continue;
                }

                bool isError = false;
                BulkUpload bulkUpload = new BulkUpload();

                if (Convert.ToString(row.GetCell(0)) != string.Empty)
                {
                    bulkUpload.Year = int.Parse(Convert.ToString(row.GetCell(0)));
                }
                else
                {
                    isError = true;
                    bulkUpload.Remarks = "Invalid Year";
                }

                if (Convert.ToString(row.GetCell(1)) != string.Empty)
                {
                    bulkUpload.Month = int.Parse(Convert.ToString(row.GetCell(1)));
                }
                else
                {
                    isError = true;
                    bulkUpload.Remarks = "Invalid Month";
                }

                if (Convert.ToString(row.GetCell(2)) != string.Empty)
                {
                    bulkUpload.Block = Convert.ToString(row.GetCell(2));
                }
                else
                {
                    isError = true;
                    bulkUpload.Remarks = "Invalid Block";
                }

                if (Convert.ToString(row.GetCell(3)) != string.Empty)
                {
                    bulkUpload.BunglowNo = Convert.ToString(row.GetCell(3));
                }
                else
                {
                    isError = true;
                    bulkUpload.Remarks = "Invalid HouseNo";
                }


                if (Convert.ToString(row.GetCell(4)) != string.Empty)
                {
                    bulkUpload.CurrentUnit = long.Parse(Convert.ToString(row.GetCell(4)));
                }
                else
                {
                    isError = true;
                    bulkUpload.Remarks = "Invalid Current Unit";
                }

                if (Convert.ToString(row.GetCell(5)) != string.Empty)
                {
                    bulkUpload.OtherCharge = long.Parse(Convert.ToString(row.GetCell(5)));
                }


                bulkUpload.uploadStatus = isError == true ? UploadStatus.Fail : UploadStatus.Pass;
                bulkUploads.Add(bulkUpload);
            }
            return bulkUploads;
        }

        private void WriteExcel(List<BulkUpload> bulkUploads, ref string DownloadPath, string fileName)
        {
            var folderName = Path.Combine("wwwroot", "Upload", "UserDownload");
            var dbPath = Path.Combine(folderName, fileName);

            // Lets converts our object data to Datatable for a simplified logic.
            // Datatable is most easy way to deal with complex datatypes for easy reading and formatting.

            DataTable table = (DataTable)JsonConvert.DeserializeObject(JsonConvert.SerializeObject(bulkUploads), (typeof(DataTable)));

            table.Columns.Remove("OwnerId");
            table.Columns.Remove("GroupId");
            var memoryStream = new MemoryStream();

            using (var fs = new FileStream(dbPath, FileMode.Create, FileAccess.Write))
            {
                IWorkbook workbook = new XSSFWorkbook();
                ISheet excelSheet = workbook.CreateSheet("Sheet1");

                List<String> columns = new List<string>();
                IRow row = excelSheet.CreateRow(0);
                int columnIndex = 0;

                foreach (System.Data.DataColumn column in table.Columns)
                {
                    columns.Add(column.ColumnName);
                    row.CreateCell(columnIndex).SetCellValue(column.ColumnName);
                    columnIndex++;
                }

                int rowIndex = 1;
                foreach (DataRow dsrow in table.Rows)
                {
                    row = excelSheet.CreateRow(rowIndex);
                    int cellIndex = 0;
                    foreach (String col in columns)
                    {
                        row.CreateCell(cellIndex).SetCellValue(dsrow[col].ToString());
                        cellIndex++;
                    }

                    rowIndex++;
                }
                workbook.Write(fs);
            }

            DownloadPath = dbPath;

        }

        public async Task<long> UpdatePDFFileLocation(BillTransaction billTransaction)
        {
            Int64 result = 0;
            result = await _objIBillTransactionRepository.UpdatePDFFileLocation(billTransaction);
            return result;
        }

        public async Task<IEnumerable<BillTransaction>> GetReport(int? GroupId, int? OwnerId, int? PaymentType, int? BillStatus, DateTime? Startdate, DateTime? Endate)
        {
            return await _objIBillTransactionRepository.GetReport(GroupId, OwnerId, PaymentType, BillStatus, Startdate, Endate);
        }
    }
}
