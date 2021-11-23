import { Component, OnInit } from '@angular/core';
import { AuthService } from './../../../../services/auth.service';

@Component({
  selector: 'app-admin-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.scss']
})
export class NavBarComponent implements OnInit {

  constructor(private authService: AuthService) {
   }

  ngOnInit() {
  }

}
