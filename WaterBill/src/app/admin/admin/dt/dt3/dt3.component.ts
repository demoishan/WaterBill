import { AfterViewInit, Component, OnInit, Renderer } from '@angular/core';
import { Router } from '@angular/router';
import { Title } from '@angular/platform-browser';
import { Subject } from 'rxjs';


@Component({
  selector: 'app-dt3',
  templateUrl: './dt3.component.html',
  styleUrls: ['./dt3.component.scss']
})
export class Dt3Component implements AfterViewInit, OnInit {

  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject();

  public setTitle(newTitle: string) {
    this.titleService.setTitle(newTitle);
  }
  constructor(private renderer: Renderer, private router: Router, private titleService: Title) { }

  ngOnInit(): void {
    this.setTitle('DataTable 3');
    this.dtOptions = {
      ajax: 'https://l-lin.github.io/angular-datatables/data/data.json',
      columns: [{
        title: 'ID',
        data: 'id'
      }, {
        title: 'First name',
        data: 'firstName'
      }, {
        title: 'Last name',
        data: 'lastName'
      }, {
        title: 'Action',
        render: function (data: any, type: any, full: any) {
          return 'View';
        }
      }]
    };
  }

  ngAfterViewInit(): void {
    this.renderer.listenGlobal('document', 'click', (event) => {
      if (event.target.hasAttribute("view-person-id")) {
        this.router.navigate(["/dtdetail/" + event.target.getAttribute("view-person-id")]);
      }
    });
  }
}
