import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { OwnerMasterService } from '../../../services/owner-master.service';
import { Subject } from 'rxjs';
import { AuthService } from '../../../services/auth.service';
import { OwnerMaster } from '../../../models/ownerMaster';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';

@Component({
  selector: 'app-ownermaster',
  templateUrl: './ownermaster.component.html',
  styleUrls: ['./ownermaster.component.scss']
})
export class OwnermasterComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  ownername:any;
  detailList: any;
  dataModal = new OwnerMaster();
  isEditable: boolean;


  constructor(private ownerMasterService: OwnerMasterService, private router: Router,
    private title:Title, private authService: AuthService) {
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
    this.title.setTitle("Owners List");
  }

  getDatatable() {
    this.ownerMasterService
      .getAllData()
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
        //this.ownername=resp.result.map(detailList => detailList.ownerName)
        //console.log(this.ownername);
      });
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

  editRow(row) {
    this.isEditable = true;
    this.router.navigate(['/admin/owneradd'],{ queryParams: { id: row.ownerId}});
  }


  deleteRow(row) {
    this.isEditable = true;
    this.dataModal.OwnerId = row.ownerId;
    this.ownerMasterService.delete(this.dataModal)
      .subscribe(
        () => {
          this.rerender();
        });
  }

}
