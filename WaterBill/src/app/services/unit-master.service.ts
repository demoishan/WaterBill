import { Injectable } from '@angular/core';
import { UnitMaster } from '../models/unitMaster';
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
export class UnitMasterService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.unitMasterInsert, data)
      .pipe(map(res => <any>res)
      );
  }

  delete(data) {
    return this.http.post<any>(common.unitMasterDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.unitMasterUpdate, data)
      .pipe(map(res => <any>res)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.unitMasterGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ UnitMaster Service : ");
    return throwError(error);
  }
}
