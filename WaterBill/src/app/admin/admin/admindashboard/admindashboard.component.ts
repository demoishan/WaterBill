import { Component, OnInit } from '@angular/core';
import { Label } from 'ng2-charts';
import { Title } from '@angular/platform-browser';
import { AdminHome } from '../../../models/adminHome';
import { AuthService } from '../../../services/auth.service';
import { UnitMasterService } from '../../../services/unit-master.service';
import { AdminDashboardService } from '../../../services/admin-dashboard.service';
import { Router } from '@angular/router';



@Component({
  selector: 'app-admindashboard',
  templateUrl: './admindashboard.component.html',
  styleUrls: ['./admindashboard.component.scss']
})
export class AdmindashboardComponent implements OnInit {

  
  resultList : any;
  paidList : any;
  unpaidList : any;
  dataModal = new AdminHome();
  public mbarChartLabels : string[];
  public barChartType: string = 'bar';
  public barChartLegend: boolean = true;

  public TotalOU : any[] = [
    {data : [], label : 'Unpaid'}    
  ];

  public TotalC : any[] = [
    {data : [], label : 'Paid'},
    {data : [], label : 'UnPaid'}        
  ];

  public TotalP : any[] = [
    {data : [], label : 'Cash'},
    {data : [], label : 'Cheque'},
    {data : [], label : 'Advance'}        
  ];

  constructor(private authService: AuthService, private title: Title,
    private router: Router, private unitService: UnitMasterService, 
    private adminDashboardService: AdminDashboardService) { }

  ngOnInit() {

    this.title.setTitle("Home");

    var UserOnly = this.authService.isAuthorizedByRole(['UserOnly']);
    if(UserOnly){
      this.router.navigate(['/admin/userhome']);
    }



    this.getUnitData();
    this.getTotalOwner();
    this.getTotalAdvance();
    this.getCurrentUnPaid();
    this.getCurrentPaid();
    this.getOverallUnPaid();
    this.getMonthReceived();
    this.getMonthYear();
    this.getOverallUnPaidBlockwise();
    this.getCurrentBillStatusBlockwise();
    this.getMonthPaymentTypeBlockwise();

  }

  public barChartOptions: any = {
    scaleShowVerticalLines: true,
    responsive: true,
    optionsVariable : {
      scales : {
        yAxes: [{
           ticks: {
              beginAtZero: true,
              min : 0,
              max : 20,
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

  getUnitData() {
    this.unitService
      .getAllData()
      .subscribe(resp => {
        this.dataModal.UnitRate = resp.result[0].unitRate;
        this.dataModal.Penalty = resp.result[0].penalty;
      });
  }

  getTotalOwner() {
    this.adminDashboardService
      .getTotalOwner()
      .subscribe(resp => {
        this.dataModal.TotalOwner=resp.result;
      });
  }

  getTotalAdvance() {
    this.adminDashboardService
      .getTotalAdvance()
      .subscribe(resp => {
        this.dataModal.TotalAdvance=resp.result;
      });
  }

  getCurrentUnPaid() {
    this.adminDashboardService
      .getCurrentUnpaid()
      .subscribe(resp => {
        this.dataModal.CurrentUnpaid=resp.result;
      });
  }

  getCurrentPaid() {
    this.adminDashboardService
      .getCurrentPaid()
      .subscribe(resp => {
        this.dataModal.CurrentPaid=resp.result;
      });
  }

  getOverallUnPaid() {
    this.adminDashboardService
      .getOverallUnpaid()
      .subscribe(resp => {
        this.dataModal.OverallUnpaid=resp.result;
      });
  }

  getMonthReceived() {
    this.adminDashboardService
      .getMonthReceived()
      .subscribe(resp => {
        this.dataModal.TotalAmt=resp.result;
      });
  }

  getMonthYear() {
    this.adminDashboardService
      .getMonthYear()
      .subscribe(resp => {
        this.dataModal.Month=resp.result[0].month;
        this.dataModal.Year=resp.result[0].year;
      });
  }

  getOverallUnPaidBlockwise() {
    this.adminDashboardService
      .getOverallUnPaidBlockwise()
      .subscribe(resp => {
        this.resultList=resp.result;
        this.dataModal.GroupName=resp.result.map(resultList => resultList.groupName)
        this.dataModal.TotalOU=resp.result.map(resultList => resultList.total)
        this.mbarChartLabels = this.dataModal.GroupName;
        this.TotalOU[0].data=this.dataModal.TotalOU;
      });
  }

  getCurrentBillStatusBlockwise() {

    this.adminDashboardService
      .getMonthPaid()
      .subscribe(resp => {
        this.paidList=resp.result;
        this.dataModal.TotalP=resp.result.map(paidList => paidList.total)
        this.TotalC[0].data=this.dataModal.TotalP;
      });

      this.adminDashboardService
      .getMonthUnpaid()
      .subscribe(resp => {
        this.paidList=resp.result;
        this.dataModal.TotalP=resp.result.map(paidList => paidList.total)
        this.TotalC[1].data=this.dataModal.TotalP;
      });
  }


  getMonthPaymentTypeBlockwise() {
    this.adminDashboardService
      .getMonthCash()
      .subscribe(resp => {
        this.paidList=resp.result;
        this.dataModal.TotalP=resp.result.map(paidList => paidList.total)
        this.TotalP[0].data=this.dataModal.TotalP;
      });

      this.adminDashboardService
      .getMonthCheque()
      .subscribe(resp => {
        this.paidList=resp.result;
        this.dataModal.TotalP=resp.result.map(paidList => paidList.total)
        this.TotalP[1].data=this.dataModal.TotalP;
      });

      this.adminDashboardService
      .getMonthAdvance()
      .subscribe(resp => {
        this.paidList=resp.result;
        debugger
        this.dataModal.TotalP=resp.result.map(paidList => paidList.total)
        this.TotalP[2].data=this.dataModal.TotalP;
      });
  }


  public payTypeLabels: Label[] = ['Cash', 'Cheque', 'Advance'];




  public barChartData: any[] = [
    { data: [55, 60, 75, 82], label: 'Paid' },
    { data: [58, 55, 60, 79], label: 'UnPaid' }
  ];

  public pbarChartData: any[] = [
    { data: [55, 60, 75, 82], label: 'Cash' },
    { data: [58, 55, 60, 79], label: 'Cheque' },
    { data: [28, 48, 40, 19], label: 'Advance' }
  ];


  public barChartColors: Array<any> = [
    {
      backgroundColor: 'rgba(8,60,97,1)',
      borderColor: 'rgba(105,159,177,1)',
      pointBackgroundColor: 'rgba(105,159,177,1)',
      pointBorderColor: '#fafafa',
      pointHoverBackgroundColor: '#fafafa',
      pointHoverBorderColor: 'rgba(105,159,177)'
    },
    {
      backgroundColor: 'rgba(61,104,19,1)',
      borderColor: 'rgba(77,20,96,1)',
      pointBackgroundColor: 'rgba(77,20,96,1)',
      pointBorderColor: '#fff',
      pointHoverBackgroundColor: '#fff',
      pointHoverBorderColor: 'rgba(77,20,96,1)'
    }
  ];

  public pbarChartColors: Array<any> = [
    {
      backgroundColor: 'rgba(8,60,97,1)',
      borderColor: 'rgba(105,159,177,1)',
      pointBackgroundColor: 'rgba(105,159,177,1)',
      pointBorderColor: '#fafafa',
      pointHoverBackgroundColor: '#fafafa',
      pointHoverBorderColor: 'rgba(105,159,177)'
    },
    {
      backgroundColor: 'rgba(61,104,19,1)',
      borderColor: 'rgba(77,20,96,1)',
      pointBackgroundColor: 'rgba(77,20,96,1)',
      pointBorderColor: '#fff',
      pointHoverBackgroundColor: '#fff',
      pointHoverBorderColor: 'rgba(77,20,96,1)'
    }
  ];

  // events
  public barChartClicked(e: any): void {
    console.log(e);
  }

  public chartHovered(e: any): void {
    console.log(e);
  }

  public barChartHovered(e: any): void {
    console.log(e);
  }

  public chartClicked(e: any): void {
    console.log(e);
  }



}
