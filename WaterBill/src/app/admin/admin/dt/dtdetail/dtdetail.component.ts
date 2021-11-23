import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-dtdetail',
  templateUrl: './dtdetail.component.html',
  styleUrls: ['./dtdetail.component.scss']
})
export class DtdetailComponent implements OnInit {

  public constructor(private titleService: Title) { }

  public setTitle(newTitle: string) {
    this.titleService.setTitle(newTitle);
  }

  ngOnInit() {
    this.setTitle('DataTable Detail')
  }

}
