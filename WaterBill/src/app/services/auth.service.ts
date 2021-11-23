import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { User } from '../models/user';
//import { environment } from '@environments/environment';
import * as common from "../shared/common";
import { UserInfoReader } from '../models/userInfoReader';
import { UserPanelService } from '../services/user-panel.service';


@Injectable({
    providedIn: 'root'
})
export class AuthService {

    userData = new BehaviorSubject<User>(new User());

    constructor(private http: HttpClient, private router: Router,
         private userPanelService: UserPanelService) { }

    login(userDetails) {
        return this.http.post<any>(common.login, userDetails)
            .pipe(map(response => {
                localStorage.setItem('authToken', response.token);
                localStorage.setItem('roles', JSON.stringify(response.roles));
                this.setUserDetails();
                return response;
            }));
    }

    setUserDetails() {
        if (localStorage.getItem('authToken')) {
            const userDetails = new User();
            const decodeUserDetails = JSON.parse(window.atob(localStorage.getItem('authToken').split('.')[1]));
            userDetails.userEmail = decodeUserDetails.userEmail;
            userDetails.OwnerId = decodeUserDetails.ownerId;
            userDetails.userId = decodeUserDetails.userId;
            userDetails.FirstName = decodeUserDetails.firstName;
            userDetails.LastName = decodeUserDetails.lastName;
            userDetails.Role = decodeUserDetails.role;
            userDetails.Roles = decodeUserDetails.roles;

            this.userData.next(userDetails);
        }
    }


    getUserId() {
        var userDetails = new User();
        userDetails = this.getUserDetails();
        return userDetails.userId;
    }

    getOwnerId() {
        var userDetails = new User();
        userDetails = this.getUserDetails();
        return userDetails.OwnerId;
    }

    getUserDetails() {
        if (localStorage.getItem('authToken')) {
            const userDetails = new User();
            const decodeUserDetails = JSON.parse(window.atob(localStorage.getItem('authToken').split('.')[1]));

            userDetails.userEmail = decodeUserDetails.userEmail;
            userDetails.OwnerId = decodeUserDetails.ownerId;
            debugger
            userDetails.userId = decodeUserDetails.userId;
            userDetails.FirstName = decodeUserDetails.firstName;
            userDetails.LastName = decodeUserDetails.lastName;
            userDetails.Role = decodeUserDetails.role;
            userDetails.Roles = decodeUserDetails.roles;
            userDetails.isLoggedIn = true;

            return userDetails;

        }
    }

    isAuthorizedByRole(requiredRoles: string[]) {
        if (requiredRoles.some(r => UserInfoReader.userRoles.includes(r))) {
            return true;
        }
    }

    logout() {
        localStorage.removeItem('authToken');
        localStorage.removeItem('roles');
        this.router.navigate(['/login']);
        this.userData.next(new User());
    }
}    