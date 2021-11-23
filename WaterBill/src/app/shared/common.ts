import { environment } from '../../environments/environment';
const URL = `${environment.apiUrl}`

export const apiURL1 = URL;

export const login = `${URL}/users/authenticate`;

export const getAdminData = `${URL}/users/GetAdminData`;
export const getUserData = `${URL}/user/GetUserData`;
export const addUser = `${URL}/users/add`;
export const getalluser = `${URL}/users/getalllist`;

export const insertStudent = `${URL}/api/student/add`;
export const getStudentALL = `${URL}/api/student/getall2`;

export const groupMasterInsert = `${URL}/api/groupmaster/add`;
export const groupMasterUpdate = `${URL}/api/groupmaster/update`;
export const groupMasterGetAll = `${URL}/api/groupmaster/getall`;
export const groupMasterDelete = `${URL}/api/groupmaster/delete`;

export const financialYearMasterInsert = `${URL}/api/financialyearmaster/add`;
export const financialYearMasterUpdate = `${URL}/api/financialyearmaster/update`;
export const financialYearMasterGetAll = `${URL}/api/financialyearmaster/getall`;
export const financialYearMasterDelete = `${URL}/api/financialyearmaster/delete`;

export const unitMasterInsert = `${URL}/api/unitmaster/add`;
export const unitMasterUpdate = `${URL}/api/unitmaster/update`;
export const unitMasterGetAll = `${URL}/api/unitmaster/getall`;
export const unitMasterDelete = `${URL}/api/unitmaster/delete`;
export const getyear = `${URL}/api/unitmaster/getyear`;
export const getmonth = `${URL}/api/unitmaster/getmonth`;

export const maintenanceMasterInsert = `${URL}/api/maintenancemaster/add`;
export const maintenanceMasterUpdate = `${URL}/api/maintenancemaster/update`;
export const maintenanceMasterGetAll = `${URL}/api/maintenancemaster/getall`;
export const maintenanceMasterDelete = `${URL}/api/maintenancemaster/delete`;
export const maintenanceMasterGetByGroupId = `${URL}/api/maintenancemaster/getbygroupid`;

export const ownerMasterInsert = `${URL}/api/ownermaster/add`;
export const ownerMasterUpdate = `${URL}/api/ownermaster/update`;
export const ownerMasterGetAll = `${URL}/api/ownermaster/getall`;
export const ownerMasterDelete = `${URL}/api/ownermaster/delete`;
export const ownerMasterGetById = `${URL}/api/ownermaster/getbyid`;
export const ownerMasterGetByGroupId = `${URL}/api/ownermaster/getbygroupid`;

export const advanceMasterInsert = `${URL}/api/advancemaster/add`;
export const advanceMasterUpdate = `${URL}/api/advancemaster/update`;
export const advanceMasterGetAll = `${URL}/api/advancemaster/getall`;
export const advanceMasterDelete = `${URL}/api/advancemaster/delete`;

export const billTransactionInsert = `${URL}/api/billtransaction/add`;
export const billTransactionUpdate = `${URL}/api/billtransaction/update`;
export const billTransactionGetAll = `${URL}/api/billtransaction/getall`;
export const billTransactionGetReport = `${URL}/api/billtransaction/getreport`;
export const billTransactionDelete = `${URL}/api/billtransaction/delete`;
export const billTransactionGetById = `${URL}/api/billtransaction/getbyid`;
export const getexcelfilesdetails = `${URL}/api/billtransaction/getexcelfile`;

export const userpay = `${URL}/api/userpanel/pay`;
export const getuserpaid = `${URL}/api/userpanel/getpaid`;
export const getuserunpaid = `${URL}/api/userpanel/getunpaid`;
export const getownerid = `${URL}/api/userpanel/getownerid`;
export const gettotal = `${URL}/api/userpanel/gettotal`;
export const getuserunitused = `${URL}/api/userpanel/getunitused`;
export const getusercurrentmonth = `${URL}/api/userpanel/getcurrentmonth`;
export const getusercurrenttotal = `${URL}/api/userpanel/getcurrenttotal`;

export const getmonthyear = `${URL}/api/admindashboard/getmonthyear`;
export const getoverallunpaid = `${URL}/api/admindashboard/getoverallunpaid`;
export const gettotaladvance = `${URL}/api/admindashboard/gettotaladvance`;
export const gettotalowner = `${URL}/api/admindashboard/gettotalowner`;
export const getmonthadvance = `${URL}/api/admindashboard/getmonthadvance`;
export const getmonthcash = `${URL}/api/admindashboard/getmonthcash`;
export const getmonthcheque = `${URL}/api/admindashboard/getmonthcheque`;
export const getmonthpaid = `${URL}/api/admindashboard/getmonthpaid`;
export const getmonthunpaid = `${URL}/api/admindashboard/getmonthunpaid`;
export const getoverallunpaidblockwise = `${URL}/api/admindashboard/getoverallunpaidblockwise`;
export const getmonthreceived = `${URL}/api/admindashboard/getmonthreceived`;
export const getcurrentpaid = `${URL}/api/admindashboard/getcurrentpaid`;
export const getcurrentunpaid = `${URL}/api/admindashboard/getcurrentunpaid`;
