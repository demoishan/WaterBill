import { Component, OnInit } from '@angular/core';
import { AuthService } from './../../../../services/auth.service';
import * as $ from 'jquery';
import * as AdminLte from 'admin-lte';
@Component({
  selector: 'app-admin-main-side-bar',
  templateUrl: './main-side-bar.component.html',
  styleUrls: ['./main-side-bar.component.scss']
})
export class MainSideBarComponent implements OnInit {
 
  userFullName:any;
  res: any;
  constructor(private authService: AuthService) {

  }

  ngAfterViewInit() {
    $('[data-widget="treeview"]').each(function() {
        AdminLte.Treeview._jQueryInterface.call($(this), 'init');
    });
}
  ngOnInit() {
    var user= this.authService.getUserDetails();
    this.userFullName = user.FirstName + " " + user.LastName;

    // $(document).ready(() => {
    //   const trees: any = $('[data-widget="tree"]');
    //   trees.tree();
    // });
  }

}
