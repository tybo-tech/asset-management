import { Component } from '@angular/core';
import { Chart, registerables } from 'chart.js';
import { FEATURES } from 'src/models/SideNav';
import { RoleService } from 'src/services/RoleService';
import { UserService } from 'src/services/user.service';
Chart.register(...registerables);

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'asset-management';
  menuClass = '';
  toggleMenu() {
    this.menuClass = this.menuClass === '' ? 'show' : '';
  }
  constructor(
    private roleService: RoleService,
    private userService: UserService
  ) {
    this.enforceHttps();
    roleService.getAllRoles().subscribe((data) => {
      if (data && data.length > 0) {
        data.forEach((role) => {
          role.features?.forEach((feature) => {
            feature.name =FEATURES.find((f) => +f.id === Number(feature.featureId))?.name || '';
          })
        });
        userService.updateRoleState(data);
      }
    });
  }
  enforceHttps() {
    const fullUrl = window.location.href;
    if (fullUrl.includes('localhost')) return;

    const url = new URL(fullUrl);
    if (url.protocol === 'http:') {
      url.protocol = 'https:';
      // Redirect to the secure site
      window.location.href = url.href;
    }
  }
}
