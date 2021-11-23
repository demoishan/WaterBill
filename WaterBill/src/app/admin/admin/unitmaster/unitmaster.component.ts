import { Component, OnInit, ViewChildren } from '@angular/core';
import { NgForm, FormBuilder, Validators } from '@angular/forms';
import { UnitMasterService } from '../../../services/unit-master.service';
import { UnitMaster } from 'src/app/models/unitMaster';
import { Title } from '@angular/platform-browser';
import { AuthService } from '../../../services/auth.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-unitmaster',
  templateUrl: './unitmaster.component.html',
  styleUrls: ['./unitmaster.component.scss']
})
export class UnitmasterComponent implements OnInit {
  currentUnitRate: any;
  currentPenalty: any;
  dataModal = new UnitMaster();
  @ViewChildren('registerForm') myForm: NgForm;

  constructor(private formBuilder: FormBuilder,
    private unitService: UnitMasterService, private toastr: ToastrService,
    private title:Title, private authService: AuthService, private router: Router) { }

  ngOnInit() {

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if (UserOnly) {
      this.router.navigate(['/admin/404']);
    }

    this.getData();
    this.title.setTitle("Manage Units")
  }

  getData() {
    this.unitService
      .getAllData()
      .subscribe(resp => {
        this.currentUnitRate = resp.result[0].unitRate;
        this.currentPenalty = resp.result[0].penalty;
      },
      (error) => {
        this.toastr.error('Something went wrong');
      }
      );
  }
  onSubmit() {
    this.unitService.add(this.dataModal)
      .subscribe(
        () => {
          this.getData();
          this.toastr.success('Success Data added!!');
        },
        (error) => {
          this.toastr.error('Something went wrong');
        });
  }


  onReset() {
    this.dataModal = new UnitMaster();
    this.myForm.reset(this.dataModal);
  }


}
