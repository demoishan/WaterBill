import { Component, OnInit, ViewChild, ViewChildren, OnDestroy } from '@angular/core';
import { Subject } from 'rxjs';
import { Title } from '@angular/platform-browser';
import { NgForm, FormBuilder, FormGroup } from '@angular/forms';
import { DataTableDirective } from 'angular-datatables';
import { AuthService } from './../../../services/auth.service';
import { BillTransaction } from '../../../models/BillTransaction';
import { UserPanelService } from '../../../services/user-panel.service';

@Component({
  selector: 'app-userpay',
  templateUrl: './userpay.component.html',
  styleUrls: ['./userpay.component.scss']
})
export class UserpayComponent implements OnInit, OnDestroy {

  dtOptions: any = {};
  detailList: any;
  UserId : any;
  OwnerId : any;
  TotalMonth : any;
  TotalBillAmount : any;
  TotalMaintenance : any;
  TotalPenalty : any;
  GrandTotal : any;
  dataModal = new BillTransaction();
  dtTrigger: Subject<any> = new Subject();
  @ViewChildren('registerForm') myForm: NgForm;
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;


  constructor(private authService: AuthService, private title:Title,
     private userPanelService: UserPanelService, ) {

  }

  ngOnInit() {
    this.UserId =Number(this.authService.getUserId());
    this.OwnerId = Number(this.authService.getOwnerId());
    //this.getOwnerId();
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
    this.title.setTitle("Payment");
    this.getDatatable();
    this.getTotal();
  }

  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  rerender(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.destroy();
    });
  }

  getDatatable() {
    this.userPanelService
      .getUnPaid(this.OwnerId)
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
  }

  /*getOwnerId() {
    this.userPanelService
      .getOwnerId(this.UserId)
      .subscribe(resp => {
        this.OwnerId = resp.result;
        debugger
      });
  }*/

  getTotal() {
    debugger
    this.userPanelService
      .getTotal(this.OwnerId)
      .subscribe(resp => {
        this.TotalMonth = resp.result[0].totalMonth;
        this.TotalBillAmount = resp.result[0].totalBillAmount;
        this.TotalMaintenance = resp.result[0].totalMaintenance;
        this.TotalPenalty = resp.result[0].totalPenalty;
        this.GrandTotal = resp.result[0].grandTotal;
      });
  }

  onSubmit() {   
      this.dataModal.OwnerId=this.OwnerId;
      this.userPanelService.pay(this.dataModal)
        .subscribe(
          () => {
            this.rerender();
            this.dataModal = new BillTransaction();
            this.myForm.reset(this.dataModal);
        });
  }  

}
