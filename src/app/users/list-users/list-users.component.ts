import { Component } from '@angular/core';
import { Role } from 'src/models/Role';
import { PAGES } from 'src/models/Schema';
import { User, UserStatus } from 'src/models/user.model';
import { RoleService } from 'src/services/RoleService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-list-users',
  templateUrl: './list-users.component.html',
  styleUrls: ['./list-users.component.scss'],
})
export class ListUsersComponent {
  userStatus: any = UserStatus;
  links = [
    {
      name: 'Dashboard',
      link: '/dashboard',
    },
    {
      name: 'Users',
      link: '',
    },
  ];
  users: User[] = [];
  page = PAGES.user
  search = '';
  roles?: Role[] 
  constructor(private userService: UserService,    private roleService: RoleService,
  ) {
    this.getUsers();
    this.getRoles();
  }
  getUsers() {
    return this.userService.users().subscribe((users) => {
      this.users = users || [];
    });
  }
  getRoles() {
    this.roleService.getAllRoles().subscribe((data) => {
      this.roles = data || [];
    });
  }
  roleName(id: any) {
    return this.roles?.find((x) => x.id === id)?.name;
  }
}
