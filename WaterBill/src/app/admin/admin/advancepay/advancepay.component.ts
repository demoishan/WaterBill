import { Component, OnInit, ViewChildren, OnDestroy, ViewChild } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { GroupMasterService } from '../../../services/group-master.service';
import { OwnerMasterService } from '../../../services/owner-master.service';
import { AdvanceMaster } from '../../../models/advanceMaster';
import { AdvanceMasterService } from '../../../services/advance-master.service';
import { DataTableDirective } from 'angular-datatables';
import { AuthService } from '../../../services/auth.service';
import { Router} from '@angular/router';
import { Subject } from 'rxjs';
import { NgForm, FormBuilder, FormGroup } from '@angular/forms';
import { Title } from '@angular/platform-browser';


@Component({
  selector: 'app-advancepay',
  templateUrl: './advancepay.component.html',
  styleUrls: ['./advancepay.component.scss']
})
export class AdvancepayComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  selectedCity :any;
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  public blockList: any[];
  bunglowList: any[];
  detailList: any;
  dataModal = new AdvanceMaster();
  isEditable: boolean;
  @ViewChildren('registerForm') myForm: NgForm;
  form: FormGroup;

  constructor(private groupMasterService: GroupMasterService,
    private ownerMasterService: OwnerMasterService,
    private advanceMasterService: AdvanceMasterService,
    private toastr: ToastrService, private authService: AuthService,
    private router: Router, private title:Title) { }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 10,
      select: true,
      dom: 'Bfrtip',
      buttons: [
        'print',
        'excel'
      ]
    };
    this.getDatatable();
    this.getBlockList();
    this.title.setTitle("Advance Payment");
  }

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.destroy();
      this.getDatatable();
    });
  }

  onReset() {
    this.dataModal = new AdvanceMaster();
    this.myForm.reset(this.dataModal);
  }

  getDatatable() {
    this.advanceMasterService
      .getAllData()
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
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
  }

  bunglowchanged(filterVal: any) {
    // var Bunglow = Number(filterVal);
    var details = this.bunglowList.find(x => x.bunglowNo == filterVal);
    this.dataModal.OwnerId = details.ownerId;
    this.dataModal.OwnerName = details.ownerName;
  }

  editRow(row) {
    this.isEditable = true;
    this.dataModal.AdvanceId = row.advanceId;
    this.dataModal.GroupName = row.groupName;
    this.dataModal.BunglowNo = row.bunglowNo;
    this.dataModal.OwnerId = row.ownerId;
    this.dataModal.OwnerName = row.ownerName;
    this.dataModal.Amount = row.amount;
    this.dataModal.RemainAmount = row.remainAmount;
    this.dataModal.ChequeNo = row.chequeNo;
    this.dataModal.BankName = row.bankName;
    this.dataModal.BranchName = row.branchName;
    this.dataModal.ChequeDate = row.chequeDate;
    this.dataModal.ChequeCleared = row.chequeCleared;
    this.selectedCity = row.groupId;
  }

  deleteRow(row) {
    this.dataModal.AdvanceId = row.advanceId;
    this.advanceMasterService.delete(this.dataModal)
      .subscribe(
        () => {
          this.rerender();
        });
  }

  onSubmit() {
    if (!this.isEditable) {
      this.advanceMasterService.add(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new AdvanceMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
            this.toastr.success('Success Data added!!');
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
    }
    else {
      this.dataModal.ChequeCleared = Number(this.dataModal.ChequeCleared);
      this.advanceMasterService.update(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new AdvanceMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
            this.toastr.success('Success Data added!!');
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
    }
  }

}
