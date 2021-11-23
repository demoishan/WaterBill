import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {

  userData: string;

  constructor(private userService: UserService) { }

  ngOnInit() {
    this.userData ="aaa";
  }

  fetchUserData() {
    this.userService.getAdminData().subscribe(
      (result: string) => {
        this.userData = result;
      }
    );
  }

}
