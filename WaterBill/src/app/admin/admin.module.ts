import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { ChartsModule } from 'ng2-charts';

import { DataTablesModule } from 'angular-datatables';
import { AdminRoutingModule } from './admin-routing.module';

import { ControlSideBarComponent } from './admin/layout/control-side-bar/control-side-bar.component';
import { MainSideBarComponent } from './admin/layout/main-side-bar/main-side-bar.component';
import { NavBarComponent } from './admin/layout/nav-bar/nav-bar.component';
import { FooterComponent } from './admin/layout/footer/footer.component';

import { AdminComponent } from './admin/admin.component';
import { ContentComponent } from './admin/content/content.component';
import { Dt1Component } from './admin/dt/dt1/dt1.component';
import { Dt2Component } from './admin/dt/dt2/dt2.component';
import { Dt3Component } from './admin/dt/dt3/dt3.component';
import { Dt4Component } from './admin/dt/dt4/dt4.component';
import { DtdetailComponent } from './admin/dt/dtdetail/dtdetail.component';
import { GroupmasterComponent } from './admin/groupmaster/groupmaster.component';
import { UnitmasterComponent } from './admin/unitmaster/unitmaster.component';
import { OwnermasterComponent } from './admin/ownermaster/ownermaster.component';
import { MaintenancemasterComponent } from './admin/maintenancemaster/maintenancemaster.component';
import { OwnerdetailsComponent } from './admin/ownerdetails/ownerdetails.component';
import { AdminpayComponent } from './admin/adminpay/adminpay.component';
import { AdvancepayComponent } from './admin/advancepay/advancepay.component';
import { AdminpayhistoryComponent } from './admin/adminpayhistory/adminpayhistory.component';
import { UserhomeComponent } from './admin/userhome/userhome.component';
import { UserpayComponent } from './admin/userpay/userpay.component';
import { AdminunitsComponent } from './admin/adminunits/adminunits.component';
import { ChequedetailComponent } from './admin/chequedetail/chequedetail.component';
import { StudentdetailComponent } from './admin/studentdetail/studentdetail.component';
import { TransactionshowComponent } from './admin/transactionshow/transactionshow.component';
import { CustomMinDirective } from './admin/adminunits/custom-min-validator.directive';
import { FileUploadModule } from 'ng2-file-upload';
import { BulkunitsComponent } from './admin/bulkunits/bulkunits.component';
import { AdmindashboardComponent } from './admin/admindashboard/admindashboard.component';
import { GridComponent } from './admin/grid/grid.component';
import { RegisterationComponent } from './admin/registeration/registeration.component';
import { DisplayUsersComponent } from './admin/display-users/display-users.component';
import { Error404Component } from './admin/error404/error404.component';

@NgModule({
  declarations: [
    AdminComponent,
    ContentComponent,
    ControlSideBarComponent,
    MainSideBarComponent,
    NavBarComponent,
    FooterComponent,
    Dt1Component,
    Dt2Component,
    Dt3Component,
    DtdetailComponent,
    Dt4Component,
    GroupmasterComponent,
    UnitmasterComponent,
    OwnermasterComponent,
    MaintenancemasterComponent,
    OwnerdetailsComponent,
    AdminpayComponent,
    AdvancepayComponent,
    AdminpayhistoryComponent,
    UserhomeComponent,
    UserpayComponent,
    AdminunitsComponent,
    ChequedetailComponent,
    StudentdetailComponent,
    TransactionshowComponent,
    BulkunitsComponent,
    CustomMinDirective,
    AdmindashboardComponent,
    GridComponent,
    RegisterationComponent,
    DisplayUsersComponent,
    Error404Component
  ],
  imports: [
    FileUploadModule,
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    DataTablesModule,
    AdminRoutingModule,
    ChartsModule,
  ]
})
export class AdminModule { }
