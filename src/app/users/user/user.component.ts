import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { toast, TOAST } from 'src/app/functions';
import { Category, initCategory } from 'src/models/Category';
import { Role } from 'src/models/Role';
import { PAGES } from 'src/models/Schema';
import {
  initUser,
  User,
  UserTypes,
  UserTypesOptions,
} from 'src/models/user.model';
import { RoleService } from 'src/services/RoleService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss'],
})
export class UserComponent {
  id = '';
  // roles = UserTypesOptions;
  passwordReveal = false;
  data?: User;
  page = PAGES.user;
  isAdd = false;
  roles: Role[] = [];
  constructor(
    private activatedRoute: ActivatedRoute,
    private userService: UserService,
    private roleService: RoleService,
    private router: Router
  ) {
    activatedRoute.params.subscribe((p) => {
      this.id = p['id'];
      this.get();
      this.getRoles();
    });
  }
  getRoles() {
    this.roleService.getAllRoles().subscribe((data) => {
      this.roles = data || [];
    });
  }

  get() {
    if ('add' === this.id) {
      this.isAdd = true;
      this.data = initUser(UserTypes.Admin);
      return;
    }
    this.isAdd = false;
    this.userService.getUserById(this.id).subscribe((data) => {
      this.data = data;
    });
  }
  save() {
    if (!this.data) return;
    if (!this.data.Name) {
      toast('Name is required', TOAST.warn);
      return;
    }
    if (!this.data.Email && !this.data.PhoneNumber) {
      toast('Email or Phone Number is required', TOAST.warn);
      return;
    }
    if (!this.data.Email && this.data.PhoneNumber) {
      this.data.Email = this.data.PhoneNumber;
    }
    this.userService.save(this.data).subscribe((data) => {
      toast(
        this.isAdd ? this.page.addSuccess : this.page.updateSuccess,
        TOAST.success
      );
      this.back();
    });
  }
  back() {
    this.router.navigate(['/users']);
  }
}
