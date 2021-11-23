import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UserComponent } from './user.component';
import { UserRoutingModule } from './user-routing.module';
import { Test1Component } from './test1/test1.component';
import { Test2Component } from './test2/test2.component';
import { Test3Component } from './test3/test3.component'


@NgModule({
  declarations: [
    UserComponent,
    Test1Component,
    Test2Component,
    Test3Component],
  imports: [
    CommonModule,
    UserRoutingModule
  ]
})
export class UserModule { }
