import { Injectable } from '@angular/core';
import { Student } from '../models/student';
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
export class StudentService {

  // userData = new BehaviorSubject<Student>(new Student());
  constructor(private http: HttpClient, private router: Router) { }

  add(data) {
    return this.http.post<any>(common.insertStudent, data)
      .pipe(map(res => <any>res),
      catchError(this.handleError)
      );
  }

  getHomesUsers(): Observable<any[]> {
    return this.http.get<any[]>(common.getStudentALL).pipe(
      map((res: any[]) => res),
      catchError(this.handleError)
    );
  }

  getStudentDetails() {
    return this.http.get(common.getStudentALL).pipe(map(result => result),
      catchError(this.handleError)
    );
  }

  getAllEmployees(): Observable<any> {
    var action = `GET -> add():getAllEmployees`;
    return this.http.get<any>(common.getStudentALL)
      .pipe(map(result => result),
        catchError(this.handleError)
      );
  }

  getAllEmployeesWithPaging1(dtParams: any): Observable<any> {
    return this.http.put(common.getStudentALL, dtParams);
  }
  
  handleError(error: HttpErrorResponse) {
    console.log("Error @ Student Service : ");
    return throwError(error);
  }
}
