import { Injectable } from '@angular/core';
import { throwError, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import * as common from "../shared/common";
import { catchError } from 'rxjs/operators'
import { HttpClient, HttpErrorResponse, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class BilltransactionService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.billTransactionInsert, data)
      .pipe(map(res => <any>res),
        catchError(this.handleError)
      );
  }

  delete(data) {
    return this.http.post<any>(common.billTransactionDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.billTransactionUpdate, data)
      .pipe(map(res => <any>res),
        catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.billTransactionGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getReportData(GroupId?, OwnerId?, PaymentType?, BillStatus?, Startdate?, Endate?): Observable<any> {

    let params1 = new HttpParams();
    if (GroupId) {
      params1 = params1.append("GroupId", GroupId)
    }
    if (PaymentType) {
      params1 = params1.append("PaymentType", PaymentType)
    }
    if (BillStatus) {
      params1 = params1.append("BillStatus", BillStatus)
    }
    if (Startdate) {
      params1 = params1.append("Startdate", Startdate)
    }
    if (Endate) {
      params1 = params1.append("Endate", Endate)
    }

    return this.http.get<any>(common.billTransactionGetReport, { params: params1 })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getExcelFilesDetail(): Observable<any> {
    return this.http.get<any>(common.getexcelfilesdetails)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  downloadFile(url1): any {
    var path = common.apiURL1 + url1;
     return path;
  }



  getById(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.billTransactionGetById, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getYearData(): Observable<any> {
    return this.http.get<any>(common.getyear)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getMonthData(): Observable<any> {
    return this.http.get<any>(common.getmonth)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ Bill Transaction Service : ");
    return throwError(error);
  }
}
