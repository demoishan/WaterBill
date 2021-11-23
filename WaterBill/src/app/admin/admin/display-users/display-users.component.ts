import { Component, OnInit,ViewChild } from '@angular/core';
import { UserService } from '../../../services/user.service';
import { DataTableDirective } from 'angular-datatables';
import { AuthService } from '../../../services/auth.service';
import { Title } from '@angular/platform-browser';
import { User } from '../../../models/user';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-display-users',
  templateUrl: './display-users.component.html',
  styleUrls: ['./display-users.component.scss']
})
export class DisplayUsersComponent implements OnInit {

  dtOptions: any = {};
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  detailList: any;
  dataModal = new User();
  isEditable: boolean;

  constructor(private router: Router, private title:Title, private userService : UserService,
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
    this.title.setTitle("Owners List");
    this.getDatatable();
  }

  getDatatable() {
    this.userService
      .getAllData()
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
  }

  editRow(row) {
    this.isEditable = true;
    this.router.navigate(['/admin/register'],{ queryParams: { id: row.userId}});
  }

}
