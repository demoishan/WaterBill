import { Component, OnInit, OnDestroy, ViewChild, ViewChildren } from '@angular/core';
import { NgForm, FormBuilder, FormGroup } from '@angular/forms';
import { DataTableDirective } from 'angular-datatables';
import { AuthService } from '../../../services/auth.service';
import { GroupMasterService } from '../../../services/group-master.service';
import { MaintenanceMasterService } from '../../../services/maintenance-master.service';
import { first } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { Title } from '@angular/platform-browser';
import { MaintenanceMaster } from '../../../models/maintenanceMaster';


@Component({
  selector: 'app-maintenancemaster',
  templateUrl: './maintenancemaster.component.html',
  styleUrls: ['./maintenancemaster.component.scss']
})
export class MaintenancemasterComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  selectedCity :any;
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  public blockList: any[];
  detailList: any;
  dataModal = new MaintenanceMaster();
  isEditable: boolean;
  @ViewChildren('registerForm') myForm: NgForm;
  form: FormGroup;

  constructor(private maintenanceMasterService: MaintenanceMasterService, 
    private groupMasterService: GroupMasterService, private toastr: ToastrService,
    private title:Title, private authService: AuthService, private router: Router) {
  }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 5,
      select: true,
      dom: 'Bfrtip',
      buttons: [
        'print',
        'excel'
      ]
    };
    this.getDatatable();
    this.getBlockList();
    this.title.setTitle("Manage Maintenance");
  }

  getBlockList() {
    this.groupMasterService
    .getAllData()
    .subscribe(resp => {
      this.blockList = resp.result;
    });
  }
  
  blockchanged(filterVal: any) {
    this.dataModal.GroupId = Number(filterVal);
  }

  getDatatable() {
    this.maintenanceMasterService
      .getAllData()
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
  }

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  onReset() {
    this.dataModal = new MaintenanceMaster();
    this.myForm.reset(this.dataModal);
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.destroy();
      this.getDatatable();
    });
  }

  editRow(row) {
    this.isEditable = true;
    this.dataModal.MaintenanceId = row.maintenanceId;
    this.dataModal.GroupId = row.groupId;
    this.dataModal.MaintenanceName = row.maintenanceName;
    this.dataModal.Amount = row.amount;
    this.selectedCity = row.groupId;
  }


  deleteRow(row) {
    this.dataModal.MaintenanceId = row.maintenanceId;
    this.maintenanceMasterService.delete(this.dataModal)
      .subscribe(
        () => {
          this.rerender();
        });
  }

  onSubmit() {
    if (!this.isEditable) {
      this.maintenanceMasterService.add(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new MaintenanceMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
            this.toastr.success('Success Data added!!');
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
    }
    else {
      this.maintenanceMasterService.update(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new MaintenanceMaster();
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
