import { Component, OnInit, OnDestroy, ViewChild, ViewChildren } from '@angular/core';
import { NgForm, FormBuilder, FormGroup } from '@angular/forms';
import { DataTableDirective } from 'angular-datatables';
import { GroupMasterService } from '../../../services/group-master.service';
import { first } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { GroupMaster } from '../../../models/groupMaster';
import { Title } from '@angular/platform-browser';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-groupmaster',
  templateUrl: './groupmaster.component.html',
  styleUrls: ['./groupmaster.component.scss']
})
export class GroupmasterComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  detailList: any;
  dataModal = new GroupMaster();
  isEditable: boolean;
  @ViewChildren('registerForm') myForm: NgForm;
  form: FormGroup;

  constructor(private groupMasterService: GroupMasterService,
    private authService: AuthService, private router: Router,
    private title: Title) {
  }

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
    this.title.setTitle("Manage Blocks");
  }

  getDatatable() {
    this.groupMasterService
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
    this.dataModal = new GroupMaster();
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
    this.dataModal.GroupId = row.groupId;
    this.dataModal.GroupName = row.groupName;
  }


  deleteRow(row) {
    this.isEditable = true;
    this.dataModal.GroupId = row.groupId;
    this.groupMasterService.delete(this.dataModal)
      .subscribe(
        () => {
          this.rerender();
        });
  }

  onSubmit() {
    if (!this.isEditable) {
      this.groupMasterService.add(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new GroupMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;

          });
    }
    else {
      this.groupMasterService.update(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new GroupMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
          });
    }

  }


}
