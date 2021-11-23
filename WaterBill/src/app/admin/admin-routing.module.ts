import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AdminComponent } from './admin/admin.component';
import { Dt1Component } from './admin/dt/dt1/dt1.component';
import { Dt2Component } from './admin/dt/dt2/dt2.component';
import { Dt3Component } from './admin/dt/dt3/dt3.component';
import { Dt4Component } from './admin/dt/dt4/dt4.component';
import { DtdetailComponent } from './admin/dt/dtdetail/dtdetail.component';
import { UnitmasterComponent } from './admin/unitmaster/unitmaster.component'
import { GroupmasterComponent } from './admin/groupmaster/groupmaster.component';
import { MaintenancemasterComponent } from './admin/maintenancemaster/maintenancemaster.component';
import { OwnermasterComponent } from './admin/ownermaster/ownermaster.component';
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
import { BulkunitsComponent } from './admin/bulkunits/bulkunits.component';
import { AdmindashboardComponent } from './admin/admindashboard/admindashboard.component';
import { DisplayUsersComponent } from './admin/display-users/display-users.component';
import { RegisterationComponent } from './admin/registeration/registeration.component';
import { Error404Component } from './admin/error404/error404.component';
import { AdminGuard } from '../guards/admin.guard';

const routes: Routes = [
  {
    path: '',
    component: AdminComponent, canActivate: [AdminGuard],
    children: [
      { path: '', component: AdmindashboardComponent, canActivate: [AdminGuard],pathMatch: 'full' },
      // { path: '', component: AdminDashBoardComponent, canActivate: [AdminGuard],pathMatch: 'full' },
      { path: 'dt1', component: Dt1Component, canActivate: [AdminGuard] },
      { path: 'dt2', component: Dt2Component, canActivate: [AdminGuard] },
      { path: 'dt3', component: Dt3Component, canActivate: [AdminGuard] },
      { path: 'dt4', component: Dt4Component, canActivate: [AdminGuard] },
      { path: 'dtdetail', component: DtdetailComponent, canActivate: [AdminGuard] },
      { path: 'groupmaster', component: GroupmasterComponent, canActivate: [AdminGuard] },
      { path: 'unitmaster', component: UnitmasterComponent, canActivate: [AdminGuard] },
      { path: 'maintenancemaster', component: MaintenancemasterComponent, canActivate: [AdminGuard] },
      { path: 'ownermaster', component: OwnermasterComponent, canActivate: [AdminGuard] },
      { path: 'owneradd', component: OwnerdetailsComponent, canActivate: [AdminGuard] },
      { path: 'adminpay', component: AdminpayComponent, canActivate: [AdminGuard] },
      { path: 'advancepay', component: AdvancepayComponent, canActivate: [AdminGuard] },
      { path: 'adminpayhistory', component: AdminpayhistoryComponent, canActivate: [AdminGuard] },
      { path: 'userhome', component: UserhomeComponent, canActivate: [AdminGuard] },
      { path: 'userpay', component: UserpayComponent, canActivate: [AdminGuard] },
      { path: 'adminunits', component: AdminunitsComponent, canActivate: [AdminGuard] },
      { path: 'chequedetail', component: ChequedetailComponent, canActivate: [AdminGuard] },
      { path: 'student', component: StudentdetailComponent, canActivate: [AdminGuard] },
      { path: 'transactionshow', component: TransactionshowComponent, canActivate: [AdminGuard] },
      { path: 'bulkunits', component: BulkunitsComponent, canActivate: [AdminGuard] },
      { path: 'register', component: RegisterationComponent, canActivate: [AdminGuard] },
      { path: 'displayuser', component: DisplayUsersComponent, canActivate: [AdminGuard] },
      { path: '404', component: Error404Component, canActivate: [AdminGuard] },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
