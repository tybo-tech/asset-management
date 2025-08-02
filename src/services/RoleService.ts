import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable, of } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { API } from 'src/app/constants';
import { Role } from 'src/models/Role';
import { FEATURES } from 'src/models/SideNav';

@Injectable({
  providedIn: 'root',
})
export class RoleService {

  private readonly base = `${API}/roles`;

  private roleList = new BehaviorSubject<Role[]>([]);
  $roleList = this.roleList.asObservable();

  constructor(private http: HttpClient, private router: Router) {}

  // Create Role
  addRole(role: Role) {
    return this.http.post<Role>(`${this.base}/add-role.php`, role);
  }

  // Create Feature
  addFeature(feature: { name: string }) {
    return this.http.post<{ name: string }>(
      `${this.base}/add-feature.php`,
      feature
    );
  }

  // Add Feature to Role
  addFeatureToRole(roleId: number, featureId: number) {
    return this.http.post(`${this.base}/add-feature-to-role.php`, {
      roleId,
      featureId,
    });
  }
  // Add Feature to Role
  removeFeatureFromRole(roleId: number, featureId: number) {
    return this.http.post(`${this.base}/remove-feature-from-role.php`, {
      roleId,
      featureId,
    });
  }

  // Read all Roles
  getAllRoles() {
    return this.http.get<Role[]>(`${this.base}/list.php`);
  }

  // Read all Features
  getAllFeatures() {
    // return this.http.get<{ id: number; name: string }[]>(
    //   `${this.base}/list-features.php`
    // );
    return of(FEATURES);
  }

  // Read Role by ID
  getRoleById(id: number): Observable<Role> {
    return this.http.get<Role>(`${this.base}/getById.php?id=${id}`);
  }

  // Update Role
  updateRole(role: Role) {
    return this.http.put<Role>(`${this.base}/update-role.php`, role);
  }

  // Delete Role
  removeRole(id: number) {
    return this.http.delete<void>(`${this.base}/delete-role.php?id=${id}`);
  }
 
}
