import { Component, OnInit, OnDestroy, ViewChild, ViewChildren } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { BilltransactionService } from '../../../services/billtransaction.service';
import { GroupMasterService } from '../../../services/group-master.service';
import { Subject } from 'rxjs';
import { BillTransaction } from '../../../models/BillTransaction';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';
import { Title } from '@angular/platform-browser';


@Component({
  selector: 'app-adminpayhistory',
  templateUrl: './adminpayhistory.component.html',
  styleUrls: ['./adminpayhistory.component.scss']
})
export class AdminpayhistoryComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;
  public blockList: any[];

  detailList: any;
  dataModal = new BillTransaction();
  isEditable: boolean;


  constructor(private billtransactionService: BilltransactionService, private router: Router,
    private title:Title, private groupMasterService: GroupMasterService, 
    private authService: AuthService) { }

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
    this.dataModal.BillStatus=1;
    this.getDatatable();
    this.getBlockList();
    this.title.setTitle("Unpaid Transaction");
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

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  getDatatable() {
    this.billtransactionService
      .getReportData(this.dataModal.GroupId, this.dataModal.OwnerId, this.dataModal.PaymentType,
       this.dataModal.StartDate, this.dataModal.EndDate)
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
  }

  editRow(row) {
    this.isEditable = true;
    this.router.navigate(['/admin/adminpay'],{ queryParams: { id: row.billId}});
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.destroy();
      this.getDatatable();
    });
  }

  onSubmit() {
    this.dataModal.GroupId;
    this.dataModal.PaymentType;
    this.dataModal.StartDate;
    this.dataModal.EndDate;
    this.dataModal.BillStatus=1;
    this.getDatatable();
  }

}
