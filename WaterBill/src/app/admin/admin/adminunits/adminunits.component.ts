import { Component, OnInit, ViewChildren } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { GroupMasterService } from '../../../services/group-master.service';
import { OwnerMasterService } from '../../../services/owner-master.service';
import { MaintenanceMasterService } from '../../../services/maintenance-master.service';
import { BilltransactionService } from '../../../services/billtransaction.service';
import { BillTransaction } from '../../../models/BillTransaction';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';
import { Title } from '@angular/platform-browser';

import { environment } from '../../../../environments/environment';
import { FileUploader, FileSelectDirective } from 'ng2-file-upload';

const URL = `${environment.apiUrl}`
const UploadURL = `${URL}/api/BillTransaction/upload`;

@Component({
  selector: 'app-adminunits',
  templateUrl: './adminunits.component.html',
  styleUrls: ['./adminunits.component.scss']
})


export class AdminunitsComponent implements OnInit {

  public blockList: any[];
  maintenanceData: any;
  bunglowList: any[];
  yearList: any[];
  monthsList: any[];
  dataModal = new BillTransaction();
  isEditable: boolean;

  // fileUploaded: File;
  // storeData: any;
  // worksheet: any;
  public uploader: FileUploader = new FileUploader({ url: UploadURL, itemAlias: 'photo' });


  @ViewChildren('registerForm') myForm: NgForm;

  constructor(private groupMasterService: GroupMasterService,
    private ownerMasterService: OwnerMasterService,
    private maintenanceMasterService: MaintenanceMasterService,
    private billtransactionService: BilltransactionService,
    private toastr: ToastrService,
    private router: Router, private authService: AuthService,
    private titleService: Title) { }

  // uploadedFile(event) {
  //   this.fileUploaded = event.target.files[0];
  //   this.readExcel();
  // }

  // readExcel() {
  //   let readFile = new FileReader();
  //   readFile.onload = (e) => {
  //     this.storeData = readFile.result;
  //     var data = new Uint8Array(this.storeData);
  //     var arr = new Array();
  //     for (var i = 0; i != data.length; ++i) arr[i] = String.fromCharCode(data[i]);
  //     var bstr = arr.join("");
  //     var workbook = XLSX.read(bstr, { type: "binary" });
  //     var first_sheet_name = workbook.SheetNames[0];
  //     this.worksheet = workbook.Sheets[first_sheet_name];
  //   }
  //   readFile.readAsArrayBuffer(this.fileUploaded);
  // }
  onReset() {
    this.dataModal = new BillTransaction();
    this.myForm.reset(this.dataModal);
  }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.uploader.onAfterAddingFile = (file) => { file.withCredentials = false; };
    this.uploader.onCompleteItem = (item: any, response: any, status: any, headers: any) => {
      this.toastr.success('File Uploaded sucessfully,please wait for 10 min to finish job');
    };
    this.setTitle('Add Unit');
    this.getBlockList();
    this.getYearList();
    this.getMonthList();
  }

  public setTitle(newTitle: string) {
    this.titleService.setTitle(newTitle);
  }

  getYearList() {
    this.billtransactionService
      .getYearData()
      .subscribe(resp => {
        this.yearList = resp.result;
      });
  }

  yearchanged(filterVal: any) {
    this.dataModal.Year = Number(filterVal);
  }

  getMonthList() {
    this.billtransactionService
      .getMonthData()
      .subscribe(resp => {
        this.monthsList = resp.result;
      });
  }

  monthchanged(filterVal: any) {
    this.dataModal.Month = Number(filterVal);
  }

  getBlockList() {
    this.groupMasterService
      .getAllData()
      .subscribe(resp => {
        this.blockList = resp.result;
        // this.blockList.push({ "groupId": '0',"groupName" : "-----S" })
      });
  }

  blockchanged(filterVal: any) {
    this.dataModal.GroupId = Number(filterVal);
    this.ownerMasterService
      .getByGroupId(this.dataModal.GroupId)
      .subscribe(resp => {
        this.bunglowList = resp.result;
      });
    this.maintenanceMasterService
      .getByGroupId(this.dataModal.GroupId)
      .subscribe(resp => {
        this.maintenanceData = resp.result;
        this.dataModal.Maintenance = this.maintenanceData[0].amount;
      });
  }

  bunglowchanged(filterVal: any) {
    // var Bunglow = Number(filterVal);
    var details = this.bunglowList.find(x => x.bunglowNo == filterVal);
    this.dataModal.OwnerId = details.ownerId;
    this.dataModal.OwnerName = details.ownerName;
    this.dataModal.LastUnit = details.lastUnit;
  }

  onSubmit() {
    this.billtransactionService.add(this.dataModal)
      .subscribe(
        () => {
          this.dataModal = new BillTransaction();
          this.myForm.reset(this.dataModal);
          this.isEditable = false;
          this.toastr.success('Success Data added!!');
        },
        (error) => {
          this.toastr.error('Something went wrong');
        });
  }

}
