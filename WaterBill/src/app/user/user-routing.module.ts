import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UserComponent } from './user.component';
import { Test1Component } from './test1/test1.component';
import { Test2Component } from './test2/test2.component';
import { Test3Component } from './test3/test3.component'
import { UserGuard } from '../guards/user.guard';

const routes: Routes = [
  {
    path: '',
    component: UserComponent, canActivate: [UserGuard],
    children: [
      { path: '', component: UserComponent, canActivate: [UserGuard],pathMatch: 'full' },
      { path: 'test1', component: Test1Component },
      { path: 'test2', component: Test2Component, canActivate: [UserGuard] },
      { path: 'test3', component: Test3Component, canActivate: [UserGuard] }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UserRoutingModule { }
