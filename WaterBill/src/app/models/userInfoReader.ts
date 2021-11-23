import { Injectable } from "@angular/core";
import { User } from './user';

@Injectable({
    providedIn: 'root'
})
export class UserInfoReader {

    constructor() { }

    /**
     * @returns the entire user object as-is from local storage.
     */

    static get userInfo(): User {
        if ("roles" in localStorage)
            return JSON.parse(localStorage.getItem('roles'));
        else
            return null;
    }

    /**
     * @returns a lower case list of the current users roles.
     */
    static get userRoles(): any {
        if ("roles" in localStorage) {
            var roles = JSON.parse(localStorage.getItem('roles'));
            return roles;
        }
        return null;
    }
}