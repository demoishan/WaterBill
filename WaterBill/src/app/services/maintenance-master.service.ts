import { Injectable } from '@angular/core';
import { MaintenanceMaster } from '../models/maintenanceMaster';
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
export class MaintenanceMasterService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.maintenanceMasterInsert, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  delete(data) {
    return this.http.post<any>(common.maintenanceMasterDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.maintenanceMasterUpdate, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.maintenanceMasterGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getByGroupId(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.maintenanceMasterGetByGroupId, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ MaintenanceMaster Service : ");
    return throwError(error);
  }
}
