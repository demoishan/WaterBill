import { Injectable } from '@angular/core';
import { GroupMaster } from '../models/groupMaster';
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
export class GroupMasterService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.groupMasterInsert, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  delete(data) {
    return this.http.post<any>(common.groupMasterDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.groupMasterUpdate, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.groupMasterGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ GroupMaster Service : ");
    return throwError(error);
  }
}
