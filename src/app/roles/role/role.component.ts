import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { toast, TOAST } from 'src/app/functions';
import { initCategory } from 'src/models/Category';
import { IKeyValue } from 'src/models/IKeyValue';
import { Role } from 'src/models/Role';
import { PAGES } from 'src/models/Schema';
import { FEATURES } from 'src/models/SideNav';
import { RoleService } from 'src/services/RoleService';

@Component({
  selector: 'app-role',
  templateUrl: './role.component.html',
  styleUrls: ['./role.component.scss'],
})
export class RoleComponent {
  id = '';
  data?: Role;
  isAdd = false;
  loading = false;
  page = PAGES.roles;

  constructor(
    private activatedRoute: ActivatedRoute,
    private dataService: RoleService,
    private router: Router
  ) {
    activatedRoute.params.subscribe((p) => {
      this.id = p['id'];
      this.get();
    });
  }

  get() {
    if ('add' === this.id) {
      this.isAdd = true;
      this.data = {
        description: '',
        name: '',
        id: 0,
      };
      return;
    }
    this.isAdd = false;
    this.loading = true;
    this.dataService.getRoleById(Number(this.id)).subscribe((data) => {
      this.loading = false;
      if (data && data.id) {
        data.features = data.features || [];
        data.features = data.features.map((x) => {
          return {
            ...x,
            name:
              FEATURES.find((f) => f.id === Number(x.featureId))?.name || '',
          };
        });
        this.data = data;
      }
    });
  }
  save() {
    if (!this.data) return;
    if (!this.data.name) {
      toast('Name is required', TOAST.warn);
      return;
    }
    this.isAdd && this.add();
    !this.isAdd &&
      this.dataService.updateRole(this.data).subscribe((data) => {
        this.loading = false;
        data && this.router.navigate([this.page.listUrl]);
      });
  }
  add() {
    if (!this.data) return;
    this.loading = true;
    this.dataService.addRole(this.data).subscribe(() => {
      this.loading = false;
      this.router.navigate([this.page.listUrl]);
    });
  }
}
