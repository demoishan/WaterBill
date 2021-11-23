import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import * as common from "../shared/common";
import { throwError, Observable } from 'rxjs';
import { catchError } from 'rxjs/operators'
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AdminDashboardService {

  constructor(private http: HttpClient) { }

  getMonthYear(): Observable<any> {
    return this.http.get<any>(common.getmonthyear)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getOverallUnpaid(): Observable<any> {
    return this.http.get<any>(common.getoverallunpaid)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getCurrentUnpaid(): Observable<any> {
    return this.http.get<any>(common.getcurrentunpaid)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getCurrentPaid(): Observable<any> {
    return this.http.get<any>(common.getcurrentpaid)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getTotalAdvance(): Observable<any> {
    return this.http.get<any>(common.gettotaladvance)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getTotalOwner(): Observable<any> {
    return this.http.get<any>(common.gettotalowner)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthAdvance(): Observable<any> {
    return this.http.get<any>(common.getmonthadvance)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthCash(): Observable<any> {
    return this.http.get<any>(common.getmonthcash)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthCheque(): Observable<any> {
    return this.http.get<any>(common.getmonthcheque)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthPaid(): Observable<any> {
    return this.http.get<any>(common.getmonthpaid)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthUnpaid(): Observable<any> {
    return this.http.get<any>(common.getmonthunpaid)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }


  getOverallUnPaidBlockwise(): Observable<any> {
    return this.http.get<any>(common.getoverallunpaidblockwise)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthReceived(): Observable<any> {
    return this.http.get<any>(common.getmonthreceived)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }
  

  handleError(error: HttpErrorResponse) {
    console.log("Error @ Bill Transaction Service : ");
    return throwError(error);
  }
}
