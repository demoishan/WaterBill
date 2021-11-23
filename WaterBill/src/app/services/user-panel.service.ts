import { Injectable } from '@angular/core';
import { BillTransaction } from '../models/BillTransaction';
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
export class UserPanelService {

  constructor(private http: HttpClient, private router: Router) { }

  getUnPaid(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.getuserunpaid, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getPaid(ID): Observable<any> {
    debugger
    let quertString = { id: ID };
    return this.http.get<any>(common.getuserpaid, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getOwnerId(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.getownerid, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getTotal(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.gettotal, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getUnitUsed(ID): Observable<any> {
    debugger
    let quertString = { id: ID };
    return this.http.get<any>(common.getuserunitused, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getCurrentMonth(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.getusercurrentmonth, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getCurrentTotal(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.getusercurrenttotal, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  pay(data) {
    return this.http.post<any>(common.userpay, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ User Panel Service : ");
    return throwError(error);
  }
}
