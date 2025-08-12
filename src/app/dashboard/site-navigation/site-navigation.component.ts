import { Component, EventEmitter, OnInit, Output, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subject, Observable } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { LOGO } from 'src/app/constants';
import { ModuleContext, ModuleSideNavGroup } from 'src/models/ModuleNavigation';
import { ModuleNavigationService } from 'src/services/ModuleNavigationService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-site-navigation',
  templateUrl: './site-navigation.component.html',
  styleUrls: ['./site-navigation.component.scss'],
})
export class SiteNavigationComponent implements OnInit, OnDestroy {
  @Output() toggleMenu = new EventEmitter<any>();

  moduleContext$: Observable<ModuleContext> = this.moduleNavService.getModuleContext();
  logo = LOGO;

  private destroy$ = new Subject<void>();
  private navigationGroups: ModuleSideNavGroup[] = [];

  constructor(
    private activatedRoute: ActivatedRoute,
    private moduleNavService: ModuleNavigationService,
    private userService: UserService
  ) {
    this.userService.isLoggedIn();
  }

  ngOnInit(): void {
    // Initialize module navigation from storage
    this.moduleNavService.initializeFromStorage();

    // Subscribe to module context changes
    this.moduleContext$
      .pipe(takeUntil(this.destroy$))
      .subscribe(context => {
        this.navigationGroups = context.navigationGroups;
        this.closeAll();
        this.getCurrentPage();
      });
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  closeAll() {
    this.navigationGroups.forEach(group => {
      group.open = false;
    });
  }

  toggleGroup(group: ModuleSideNavGroup) {
    // Close all other groups
    this.navigationGroups
      .filter(g => g !== group)
      .forEach(g => g.open = false);

    // Toggle the selected group
    group.open = !group.open;
  }

  hasPermission(permission: string): Observable<boolean> {
    return this.moduleNavService.hasPermission(permission);
  }

  onToggleMenu() {
    this.toggleMenu.emit();
  }

  getCurrentPage() {
    const url = window.location.href;
    const splitUrl = url.split('/');
    const page = splitUrl.pop();

    // Find the group that contains the current page
    let targetGroup = this.navigationGroups.find(group =>
      group.items.some(item =>
        item.url === `/${page}` ||
        item.url.endsWith(`/${page}`)
      )
    );

    if (targetGroup) {
      this.toggleGroup(targetGroup);
      return;
    }

    // Fallback logic for complex URLs
    const subPage = splitUrl[splitUrl.length - 2];
    if (subPage) {
      targetGroup = this.navigationGroups.find(group =>
        group.items.some(item =>
          item.url.includes(`/${subPage}/`) ||
          item.url.includes(subPage)
        )
      );

      if (targetGroup) {
        this.toggleGroup(targetGroup);
        return;
      }
    }

    // Default to first group if no match found
    if (this.navigationGroups.length > 0) {
      this.toggleGroup(this.navigationGroups[0]);
    }
  }
}
