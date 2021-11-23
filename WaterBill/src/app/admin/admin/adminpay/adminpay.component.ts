import { Component, OnInit, ViewChildren } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { GroupMasterService } from '../../../services/group-master.service';
import { OwnerMasterService } from '../../../services/owner-master.service';
import { BilltransactionService } from '../../../services/billtransaction.service';
import { BillTransaction } from '../../../models/BillTransaction';
import { Router, ActivatedRoute} from '@angular/router';
import { NgForm, FormBuilder, FormGroup } from '@angular/forms';
import { AuthService } from '../../../services/auth.service';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-adminpay',
  templateUrl: './adminpay.component.html',
  styleUrls: ['./adminpay.component.scss']
})
export class AdminpayComponent implements OnInit {

  public blockList: any[];
  bunglowList: any[];
  dataModal = new BillTransaction();
  isEditable: boolean;
  QueryString: number;
  @ViewChildren('registerForm') myForm: NgForm;

  constructor(private groupMasterService: GroupMasterService,
    private ownerMasterService: OwnerMasterService, private authService: AuthService,
    private billtransactionService: BilltransactionService,
    private toastr: ToastrService, private title:Title,
    private router: Router, private route1: ActivatedRoute) { }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.route1.queryParams.subscribe(params => {
      this.QueryString = Number(params['id']);
    });
    if (this.QueryString) {
      this.getBillDetailsById(this.QueryString);
    }

    this.title.setTitle("Payment");
  }


  getBillDetailsById(id: number) {
    this.billtransactionService.getById(id).subscribe(resp => {
    this.isEditable = true;
    this.dataModal.BillId = id;
    this.dataModal.OwnerId = resp.result.ownerId;
    this.dataModal.OwnerName = resp.result.ownerName;
    this.dataModal.GroupName = resp.result.groupName;
    this.dataModal.BunglowNo = resp.result.bunglowNo;
    this.dataModal.LastUnit = resp.result.lastUnit;
    this.dataModal.CurrentUnit = resp.result.currentUnit;
    this.dataModal.Maintenance = resp.result.maintenance;
    this.dataModal.OtherCharge = resp.result.otherCharge;
    this.dataModal.BillStatus = resp.result.billStatus;
    this.dataModal.Total = resp.result.total;
    });
  }

  onSubmit() {
      this.dataModal.PaymentType= Number(this.dataModal.PaymentType)
      this.dataModal.BillStatus = 2;
      this.billtransactionService.update(this.dataModal)
        .subscribe(
          () => {
            this.dataModal = new BillTransaction();
            this.myForm.reset(this.dataModal);
            this.router.navigate(['/admin/adminpayhistory']);
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
  }

  onReset() {
    this.dataModal = new BillTransaction();
    this.myForm.reset(this.dataModal);
  }

}
