import { Injectable } from '@angular/core';
import { OwnerMaster } from '../models/ownerMaster';
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
export class OwnerMasterService {

  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.ownerMasterInsert, data)
      .pipe(map(res => <any>res),
        catchError(this.handleError)
      );
  }

  delete(data) {
    return this.http.post<any>(common.ownerMasterDelete, data)
      .pipe(map(res => <any>res)
      );
  }

  update(data) {
    return this.http.post<any>(common.ownerMasterUpdate, data)
      .pipe(map(res => <any>res),
        catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.ownerMasterGetAll)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getById(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.ownerMasterGetById, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getByGroupId(ID): Observable<any> {
    let quertString = { id: ID };
    return this.http.get<any>(common.ownerMasterGetByGroupId, { params: quertString })
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }
   
  handleError(error: HttpErrorResponse) {
    console.log("Error @ OwnerMaster Service : ");
    return throwError(error);
  }
}