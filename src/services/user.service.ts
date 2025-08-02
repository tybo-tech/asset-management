import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from 'src/models/user.model';
import { API } from 'src/app/constants';
import { Router } from '@angular/router';
import { Role } from 'src/models/Role';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  url: string;
  private userBehaviorSubject?: BehaviorSubject<User>;
  public userObservable?: Observable<User>;

  private userListBehaviorSubject?: BehaviorSubject<User[]>;
  public userListObservable?: Observable<User[]>;

  private rolesBs = new BehaviorSubject<Role[]>([]);
  roles$ = this.rolesBs.asObservable();

  constructor(private http: HttpClient, private router: Router) {
    this.url = `${API}`;

    let _user = localStorage.getItem(Constants.LocalUser);
    let user = undefined;
    if (_user && _user !== 'undefined') {
      user = JSON.parse(_user);
    }
    this.userBehaviorSubject = new BehaviorSubject<User>(user);
    this.userObservable = this.userBehaviorSubject.asObservable();

    this.userListBehaviorSubject = new BehaviorSubject<User[]>(user);
    this.userListObservable = this.userListBehaviorSubject.asObservable();
  }
  updateUserState(user: User) {
    if (this.userBehaviorSubject) this.userBehaviorSubject.next(user);
    if (user) localStorage.setItem(Constants.LocalUser, JSON.stringify(user));
    else localStorage.removeItem(Constants.LocalUser);
  }
  updateUserListState(users: User[]) {
    if (this.userListBehaviorSubject) this.userListBehaviorSubject.next(users);
  }
  public get getUser() {
    return this.userBehaviorSubject?.value;
  }
  save(data: User): Observable<User> {
    return this.http.post<User>(`${this.url}/user/save.php`, data);
  }

  get userId() {
    let _user = localStorage.getItem(Constants.LocalUser);
    let user = undefined;
    if (_user && _user !== 'undefined') {
      user = JSON.parse(_user);
    }
    return user?.UserId || 0;
  }

  getStat(): Observable<any> {
    return this.http.get<any>(`${this.url}/user/get-admin-stat.php`);
  }
  getUserById(userId: number | string): Observable<User> {
    return this.http.get<User>(`${this.url}/user/get.php?UserId=${userId}`);
  }
  draft_order(id: string): Observable<User> {
    return this.http.get<User>(`${this.url}/user/draft-order.php?Id=${id}`);
  }
  users() {
    return this.http.get<User[]>(`${this.url}/user/users.php`);
  }

  login(data: { Email: string; Password: string }): Observable<User> {
    return this.http.post<User>(`${this.url}/user/login.php`, data);
  }
  verifyEmail(Email: string): Observable<User> {
    return this.http.get<User>(
      `${this.url}/user/get-by-email.php?Email=${Email}`
    );
  }
  logout(e: any = undefined) {
    if (this.userBehaviorSubject) this.userBehaviorSubject.next(e);
    localStorage.removeItem(Constants.LocalUser);
    location.href = '/';
  }
  isLoggedIn() {
    const user = this.userBehaviorSubject?.value;
    if (!user) {
      // alert('You are not logged in');
      this.router.navigate(['/']);
    }
  }

  canAccess(feature: string) {
    // const user = this.userBehaviorSubject?.value;
    // if (!user) return false;
    // const roles = this.rolesBs.value;
    // if (!roles) return false;
    // const role = roles.find((x) => +x.id === +user.UserType);
    // if (!role) return false;
    // const hasFeature = role.features?.find((x) => x.name === feature);
    // return !!hasFeature;
    return true; // Default to true for now, implement actual logic later
  }
  updateRoleState(data: Role[]) {
    this.rolesBs.next(data);
  }
}
export const Constants = {
  LocalUser: 'currentUser',
};
