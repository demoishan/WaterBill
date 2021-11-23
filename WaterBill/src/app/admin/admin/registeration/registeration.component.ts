import { Component, OnInit, ViewChildren } from '@angular/core';
import { NgForm } from '@angular/forms';
import { User } from '../../../models/user';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';
import { UserService } from '../../../services/user.service';
import { GroupMasterService } from '../../../services/group-master.service';
import { OwnerMasterService } from '../../../services/owner-master.service';

@Component({
  selector: 'app-registeration',
  templateUrl: './registeration.component.html',
  styleUrls: ['./registeration.component.scss']
})
export class RegisterationComponent implements OnInit {

  public blockList: any[];
  bunglowList: any[];
  isEditable: boolean;
  dataModal = new User();
  @ViewChildren('registerForm') myForm: NgForm;

  constructor(private groupMasterService: GroupMasterService, private ownerMasterService: OwnerMasterService,
    private userService: UserService, private toastr: ToastrService,
    private authService: AuthService, private router: Router) { }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.getBlockList();
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

  onReset() {
    this.dataModal = new User();
    this.myForm.reset(this.dataModal);
  }

  onSubmit() {
    if (!this.isEditable) {
      this.dataModal.Role = Number(this.dataModal.Role);
      this.userService.add(this.dataModal)
        .subscribe(
          () => {
            this.dataModal = new User();
            this.myForm.reset(this.dataModal);
            this.isEditable = false;
            this.toastr.success('Success Data added!!');
          },
          (error) => {
            this.toastr.error('Something went wrong');
          });
    }
    else {
      this.userService.update(this.dataModal)
        .subscribe(
          () => {
            this.dataModal = new User();
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
