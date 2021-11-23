import { Component, OnInit, OnDestroy } from '@angular/core';

import { AuthService } from '../../services/auth.service';

import { User } from '../../models/user';
import { UserRole } from '../../models/roles';
@Component({
  selector: 'app-starter',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent implements OnInit, OnDestroy {

  userDataSubscription: any;
  userData = new User();

  body: HTMLBodyElement = document.getElementsByTagName('body')[0];

  constructor(private authService: AuthService) {
    this.userDataSubscription = this.authService.userData.asObservable().subscribe(data => {
      this.userData = data;
    });
  }

  ngOnInit() {
    this.body.classList.add('sidebar-mini');
   
  }

  ngOnDestroy() {
    // remove the the body classes
    this.body.classList.remove('sidebar-mini');
  }

}
