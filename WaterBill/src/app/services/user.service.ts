import { Injectable } from '@angular/core';    
import { HttpClient, HttpErrorResponse } from '@angular/common/http';    
import { map } from 'rxjs/operators';    
import * as common from "../shared/common";
import { catchError } from 'rxjs/operators'
import { throwError, Observable } from 'rxjs';


@Injectable({    
  providedIn: 'root'    
})    
export class UserService {    
    
  constructor(private http: HttpClient) {    
  }    
    
  getUserData() {    
    return this.http.get(common.getUserData).pipe(map(result => result));    
  }    
    
  getAdminData() {    
    return this.http.get(common.getAdminData).pipe(map(result => result));    
  }  
  
  add(data) {
    debugger
    return this.http.post<any>(common.addUser, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  update(data) {
    return this.http.post<any>(common.addUser, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  getAllData(): Observable<any> {
    return this.http.get<any>(common.getalluser)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  handleError(error: HttpErrorResponse) {
    console.log("Error @ User Service : ");
    return throwError(error);
  }
}    