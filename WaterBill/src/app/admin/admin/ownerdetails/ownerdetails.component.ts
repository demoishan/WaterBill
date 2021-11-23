import { Component, OnInit, OnDestroy, ViewChild, ViewChildren } from '@angular/core';
import { OwnerMasterService } from '../../../services/owner-master.service';
import { GroupMasterService } from '../../../services/group-master.service';
import { NgForm, FormBuilder, FormGroup } from '@angular/forms';
import { AuthService } from '../../../services/auth.service';
import { OwnerMaster } from '../../../models/ownerMaster';
import { Title } from '@angular/platform-browser';
import { ToastrService } from 'ngx-toastr';
import { Router, ActivatedRoute, Params } from '@angular/router';
// import 'rxjs/add/operator/filter';

@Component({
  selector: 'app-ownerdetails',
  templateUrl: './ownerdetails.component.html',
  styleUrls: ['./ownerdetails.component.scss']
})
export class OwnerdetailsComponent implements OnInit {
  public blockList: any[];
  public data: any;
  dataModal = new OwnerMaster();
  isEditable: boolean;
  @ViewChildren('registerForm') myForm: NgForm;
  form: FormGroup;
  ownerQueryStrig: number;
  selectedCity :any;

  constructor(private ownerMasterService: OwnerMasterService,
    private groupMasterService: GroupMasterService, private toastr: ToastrService,
    private router: Router, private route1: ActivatedRoute, private authService: AuthService,
    private title:Title) { }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.getBlockList();

    this.route1.queryParams.subscribe(params => {
      this.ownerQueryStrig = Number(params['id']);
    });
    if (this.ownerQueryStrig) {
      this.getOnerDetailsById(this.ownerQueryStrig);
    }

    this.title.setTitle("Add Owner");
  }

  getOnerDetailsById(id: number) {
    this.ownerMasterService.getById(id).subscribe(resp => {
    this.isEditable = true;
    this.dataModal.OwnerId = resp.result.ownerId;
    this.dataModal.GroupId = resp.result.groupId;
    this.dataModal.BunglowNo = resp.result.bunglowNo;
    this.dataModal.OwnerName = resp.result.ownerName;
    this.dataModal.Mobile = resp.result.mobile;
    this.dataModal.EmailId = resp.result.emailId;
    this.dataModal.LastUnit = resp.result.lastUnit;
    this.dataModal.AnotherAddress = resp.result.anotherAddress;
    this.selectedCity = resp.result.groupId;
    });
  }
  getBlockList() {
    this.groupMasterService
      .getAllData()
      .subscribe(resp => {
        this.blockList = resp.result;
      });
  }

  onSubmit() {
    if (!this.isEditable) {
      this.ownerMasterService.add(this.dataModal)
        .subscribe(
          () => {
            this.dataModal = new OwnerMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
            this.router.navigate(['/admin/ownermaster']);
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
    }
    else {
      this.ownerMasterService.update(this.dataModal)
        .subscribe(
          () => {
            this.dataModal = new OwnerMaster();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
            this.router.navigate(['/admin/ownermaster']);
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
    }

  }

  blockchanged(filterVal: any) {
    this.dataModal.GroupId = Number(filterVal);
  }

  onReset() {
    this.dataModal = new OwnerMaster();
    this.myForm.reset(this.dataModal);
  }

}
