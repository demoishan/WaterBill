import { Injectable } from '@angular/core';
import { FinancialYearMaster } from '../models/financialYearMaster';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import * as common from "../shared/common";
import { catchError } from 'rxjs/operators'
import { throwError } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class FinancialYearMasterService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.financialYearMasterInsert, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  delete(data) {
    return this.http.post<any>(common.financialYearMasterDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.financialYearMasterUpdate, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.financialYearMasterGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ FinancialMaster Service : ");
    return throwError(error);
  }
  
}