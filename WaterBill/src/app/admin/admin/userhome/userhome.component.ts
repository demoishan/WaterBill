import { Component, OnInit, ViewChild } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Subject } from 'rxjs';
import { DataTableDirective } from 'angular-datatables';
import { AuthService } from './../../../services/auth.service';
import { BillTransaction } from '../../../models/BillTransaction';
import { UserPanelService } from '../../../services/user-panel.service';
import { UnitMasterService } from '../../../services/unit-master.service';
import { AdminDashboardService } from '../../../services/admin-dashboard.service';
import { BilltransactionService } from '../../../services/billtransaction.service';

@Component({
  selector: 'app-userhome',
  templateUrl: './userhome.component.html',
  styleUrls: ['./userhome.component.scss']
})
export class UserhomeComponent implements OnInit {

  UnitRate : any;
  Penalty : any;
  Month : any;
  Year : any;
  UserId : any;
  OwnerId : any;
  resultList : any;
  dtOptions: any = {};
  detailList: any;
  dataModal = new BillTransaction();
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective, { static: false })
  dtElement: DataTableDirective;

  public TotalU : any[] = [
    {data : [], label : 'UnitsUsed'}    
  ];
  public mbarChartLabels : string[];
  public barChartType:string = 'bar';
  public barChartLegend:boolean = true;

  constructor(private title:Title, private unitService: UnitMasterService, private userPanelService: UserPanelService, 
    private adminDashboardService: AdminDashboardService, private authService: AuthService,
    private billtransactionService: BilltransactionService) { }

  ngOnInit() {
    this.UserId =Number(this.authService.getUserId());
    this.getOwnerId();
    debugger
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
    this.title.setTitle("Home");
    this.getMonthYear();
    this.getUnitData();
    this.getUnitUsed();
    this.getDatatable();
  }

  getUnitData() {
    this.unitService
      .getAllData()
      .subscribe(resp => {
        this.UnitRate = resp.result[0].unitRate;
        this.Penalty = resp.result[0].penalty;
      });
  }

  getMonthYear() {
    this.adminDashboardService
      .getMonthYear()
      .subscribe(resp => {
        this.Month=resp.result[0].month;
        this.Year=resp.result[0].year;
      });
  }

  getDatatable() {
    this.userPanelService
      .getPaid(this.OwnerId)
      .subscribe(resp => {
        this.detailList = resp.result;
        this.dtTrigger.next();
      });
  }

  getUnitUsed() {
    this.userPanelService
      .getUnitUsed(this.OwnerId)
      .subscribe(resp => {
        debugger
        this.resultList=resp.result;
        this.dataModal.Month=resp.result.map(resultList => resultList.groupName)
        this.dataModal.Total=resp.result.map(resultList => resultList.total)
        this.mbarChartLabels = this.dataModal.Month;
        this.TotalU[0].data=this.dataModal.Total;
      });
  }

  getOwnerId() {
    this.userPanelService
      .getOwnerId(this.UserId)
      .subscribe(resp => {
        this.OwnerId= resp.result;
      });
  }

  downloadRow(row) {
    var url = this.billtransactionService.downloadFile(row.receiptURL);
    saveAs(url);
  }

  public barChartOptions:any = {
    scaleShowVerticalLines: false,
    responsive: true,
    optionsVariable : {
      scales : {
        yAxes: [{
           ticks: {
              beginAtZero: true
            }
        }]
      }
    },
    scales: {
      yAxes: [
        {
          ticks: {
            beginAtZero: true
          }
        }
      ]
    }
  };
    

  public pbarChartColors:Array<any> = [
    {
      backgroundColor: 'rgb(102, 0, 0)',
      borderColor: 'rgba(105,159,177,1)',
      pointBackgroundColor: 'rgba(105,159,177,1)',
      pointBorderColor: '#fafafa',
      pointHoverBackgroundColor: '#fafafa',
      pointHoverBorderColor: 'rgba(105,159,177)'
    }
  ];
  
    // events
    public barChartClicked(e:any):void {
      console.log(e);
    }

    public chartHovered(e:any):void {
      console.log(e);
    }
  
    public barChartHovered(e:any):void {
      console.log(e);
    }

    public chartClicked(e:any):void {
      console.log(e);
    }

}
