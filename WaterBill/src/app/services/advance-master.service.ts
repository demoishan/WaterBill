import { Injectable } from '@angular/core';
import { AdvanceMaster } from '../models/advanceMaster';
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
export class AdvanceMasterService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.advanceMasterInsert, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  delete(data) {
    return this.http.post<any>(common.advanceMasterDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.advanceMasterUpdate, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.advanceMasterGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ AdvanceMaster Service : ");
    return throwError(error);
  }
}
