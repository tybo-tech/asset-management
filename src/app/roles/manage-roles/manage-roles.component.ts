import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { RoleService } from 'src/services/RoleService';
import { Role } from 'src/models/Role';
import { PAGES } from 'src/models/Schema';

@Component({
  selector: 'app-manage-roles',
  templateUrl: './manage-roles.component.html',
  styleUrls: ['./manage-roles.component.scss'],
})
export class ManageRolesComponent implements OnInit {
  roleForm: FormGroup;
  featureForm: FormGroup;
  page = PAGES.roles;
  roles: Role[] = [];
  search = '';
  features: { id: number; name: string }[] = [];
  selectedRoleId: number | null = null;
  showAddRoleForm = false;
  showConfirmDelete = false;
  roleToDel?: Role;
  constructor(private fb: FormBuilder, private roleService: RoleService) {
    this.roleForm = this.fb.group({
      name: ['', Validators.required],
      description: ['', Validators.required],
    });

    this.featureForm = this.fb.group({
      name: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.loadRoles();
    this.loadFeatures();
  }

  loadRoles() {
    this.roleService.getAllRoles().subscribe((roles) => {
      this.roles = roles;
      this.selectedRoleId = roles[0]?.id;
    });
  }

  loadFeatures() {
    this.roleService.getAllFeatures().subscribe((features) => {
      this.features = features;
    });
  }

  addRole() {
    if (this.roleForm.valid) {
      this.roleService.addRole(this.roleForm.value).subscribe(() => {
        this.loadRoles();
        this.roleForm.reset();
      });
    }
  }

  addFeature() {
    if (this.featureForm.valid) {
      this.roleService.addFeature(this.featureForm.value).subscribe(() => {
        this.featureForm.reset();
      });
    }
  }

  assignFeatureToRole(featureId: number) {
    if (this.selectedRoleId) {
      this.roleService
        .addFeatureToRole(this.selectedRoleId, featureId)
        .subscribe(() => {
          this.loadRoles();
        });
    }
  }

  selectRole(roleId: number) {
    this.selectedRoleId = roleId;
  }

  isAssigned(featureId: number) {
    if (!this.selectedRoleId) return false;
    const role = this.roles.find((role) => role.id === this.selectedRoleId);
    return role?.features?.some((feature) => feature.id === featureId);
  }

  // Delete Role
  handleDelete(canDelete: boolean) {
    canDelete &&
      this.roleToDel &&
      this.roleService.removeRole(this.roleToDel.id).subscribe(() => {
        this.loadRoles();
        this.showConfirmDelete = false;
        this.roleToDel = undefined;
      });
  }
  deleteRole(role: Role) {
    this.roleToDel = role;
    this.showConfirmDelete = true;
  }
}
