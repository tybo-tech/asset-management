import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { LOGO } from 'src/app/constants';
import {
  FEATURE_NAMES,
  FEATURES,
  SIDE_NAV_GROUPS,
  SideNavGroup,
} from 'src/models/SideNav';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-site-navigation',
  templateUrl: './site-navigation.component.html',
  styleUrls: ['./site-navigation.component.scss'],
})
export class SiteNavigationComponent implements OnInit {
  @Output() toggleMenu = new EventEmitter<any>();
  allNavGroups: SideNavGroup[] = SIDE_NAV_GROUPS;
  sideNavGroups: SideNavGroup[] = SIDE_NAV_GROUPS.map((g) => ({
    ...g,
    items: [],
  }));

  logo = LOGO;
  features = FEATURES;
  FEATURE_NAMES = FEATURE_NAMES;
  constructor(
    private activatedRoute: ActivatedRoute,
    private userService: UserService
  ) {
    this.userService.isLoggedIn();
    userService.roles$.subscribe((res) => {
      if (res && res.length) {
        this.allNavGroups.forEach((group) => {
          const item = this.sideNavGroups.find((x) => x.name === group.name);
          if (item) {
            item.items = group.items.filter((item) =>
              userService.canAccess(item.name)
            );
          }
        });
        this.sideNavGroups = this.sideNavGroups.filter(
          (group) => group.items.length
        );
      }
    });
  }
  ngOnInit(): void {
    this.closeAll();
    this.getCurrentPage();
  }
  toggleGroup(group: SideNavGroup) {
    this.sideNavGroups.filter((g) => g !== group).map((g) => (g.open = false));
    group.open = !group.open;
  }

  closeAll() {
    this.sideNavGroups.map((g) => (g.open = false));
  }

  getCurrentPage() {
    const url = window.location.href;
    const splitUrl = url.split('/');
    const page = splitUrl.pop();
    let item = this.sideNavGroups.find((x) => x.name.toLowerCase() === page);
    if (item) {
      this.toggleGroup(item);
      return;
    }
    item = this.sideNavGroups.find(
      (x) => x.name.toLowerCase() === page?.split('-').join(' ')
    );
    if (item) {
      this.toggleGroup(item);
      return;
    }
    const subPage = splitUrl[splitUrl.length - 1];
    if (!subPage) return;
    item = this.sideNavGroups.find((x) =>
      x.name.toLowerCase().includes(subPage)
    );
    if (item) {
      this.toggleGroup(item);
      return;
    }
    item = this.sideNavGroups.find((x) =>
      x.name.toLowerCase().includes(subPage.split('-').join(' '))
    );
    if (item) {
      this.toggleGroup(item);
      return;
    }
    if (page === 'dashboard') {
      this.toggleGroup(this.sideNavGroups[0]);
      return;
    }
    if (page === 'restock' || page === 'usage') {
      item = this.sideNavGroups.find((x) => x.name.toLowerCase() === 'reports');
      item && this.toggleGroup(item);
      return;
    }
    if (page === 'list-assets') {
      item = this.sideNavGroups.find((x) => x.name.toLowerCase() === 'assets');
      item && this.toggleGroup(item);
      return;
    }
    if (
      page?.includes('review-stock-take') ||
      page === 'select-stocktake-to-review'
    ) {
      item = this.sideNavGroups.find(
        (x) => x.name.toLowerCase() === 'stocktake'
      );
      item && this.toggleGroup(item);
      return;
    }
  }
}
