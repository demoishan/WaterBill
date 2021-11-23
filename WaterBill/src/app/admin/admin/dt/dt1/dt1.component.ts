import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
  selector: 'app-dt1',
  templateUrl: './dt1.component.html',
  styleUrls: ['./dt1.component.scss']
})
export class Dt1Component implements OnInit {
  dtOptions: DataTables.Settings = {};
 
  public constructor(private titleService: Title) { }

  public setTitle(newTitle: string) {
    this.titleService.setTitle(newTitle);
  }

  ngOnInit(): void {
    this.dtOptions = {
      pagingType: 'full_numbers'
    };
    this.setTitle('DataTable 1');
  }

}
