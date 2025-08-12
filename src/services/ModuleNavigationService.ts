import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, combineLatest } from 'rxjs';
import { map } from 'rxjs/operators';
import {
  Module,
  ModuleContext,
  ModuleSideNavGroup,
  UserModuleAccess,
  MODULES,
  MODULE_NAV_GROUPS,
  MODULE_FEATURES,
  SHARED_FEATURES
} from 'src/models/ModuleNavigation';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root'
})
export class ModuleNavigationService {

  private currentModuleSubject = new BehaviorSubject<Module>(MODULES[0]); // Default to Stock Management
  private userModuleAccessSubject = new BehaviorSubject<UserModuleAccess[]>([]);

  public currentModule$ = this.currentModuleSubject.asObservable();
  public userModuleAccess$ = this.userModuleAccessSubject.asObservable();

  constructor(private userService: UserService) {
    // Initialize with default access - replace with actual API call
    this.initializeUserModuleAccess();

    // Initialize theme based on current module
    const currentModuleId = localStorage.getItem('currentModule') || 'stock-management';
    this.applyModuleTheme(currentModuleId);
  }

  /**
   * Initialize user module access from backend
   * This should be called after user login
   */
  private initializeUserModuleAccess(): void {
    const user = this.userService.getUser;
    if (user) {
      // TODO: Replace with actual API call to get user module permissions
      const defaultAccess: UserModuleAccess[] = [
        {
          userId: Number(user.UserId),
          moduleId: 'stock-management',
          isEnabled: true,
          permissions: [
            'view_stock_overview',
            'view_stock_items',
            'create_stock_items',
            'view_stock_transactions',
            'view_requisitions',
            'perform_stocktake',
            'manage_categories',
            'manage_types',
            'manage_locations',
            'manage_suppliers',
            'manage_users',
            'manage_roles'
          ]
        },
        {
          userId: Number(user.UserId),
          moduleId: 'asset-management',
          isEnabled: true, // Enable asset management module
          permissions: [
            'view_asset_overview',
            'view_assets',
            'create_assets',
            'edit_assets',
            'delete_assets',
            'view_asset_transactions',
            'transfer_assets',
            'manage_asset_types',
            'manage_asset_locations',
            'view_asset_reports'
          ]
        }
      ];

      this.userModuleAccessSubject.next(defaultAccess);
    }
  }

  /**
   * Get available modules for the current user
   */
  getAvailableModules(): Observable<Module[]> {
    return this.userModuleAccess$.pipe(
      map(accessList =>
        MODULES.filter(module =>
          accessList.some(access =>
            access.moduleId === module.id && access.isEnabled
          )
        )
      )
    );
  }

  /**
   * Get current module context including navigation and permissions
   */
  getModuleContext(): Observable<ModuleContext> {
    return combineLatest([
      this.currentModule$,
      this.getAvailableModules(),
      this.userModuleAccess$
    ]).pipe(
      map(([currentModule, availableModules, userAccess]) => {
        const currentUserAccess = userAccess.find(access =>
          access.moduleId === currentModule.id
        );

        const navigationGroups = this.getFilteredNavigationGroups(
          currentModule.id,
          currentUserAccess?.permissions || []
        );

        return {
          currentModule,
          availableModules,
          navigationGroups,
          userPermissions: currentUserAccess?.permissions || []
        };
      })
    );
  }

  /**
   * Switch to a different module
   */
  switchModule(moduleId: string): boolean {
    const targetModule = MODULES.find(m => m.id === moduleId);
    if (!targetModule) {
      console.error(`Module ${moduleId} not found`);
      return false;
    }

    // Check if user has access to this module
    const userAccess = this.userModuleAccessSubject.value;
    const hasAccess = userAccess.some(access =>
      access.moduleId === moduleId && access.isEnabled
    );

    if (!hasAccess) {
      console.error(`User does not have access to module ${moduleId}`);
      return false;
    }

    this.currentModuleSubject.next(targetModule);

    // Apply module-specific theme
    this.applyModuleTheme(moduleId);

    // Store in localStorage for persistence
    localStorage.setItem('currentModule', moduleId);

    return true;
  }

  /**
   * Get current module
   */
  getCurrentModule(): Module {
    return this.currentModuleSubject.value;
  }

  /**
   * Check if user has specific permission in current module
   */
  hasPermission(permission: string): Observable<boolean> {
    return this.userModuleAccess$.pipe(
      map(accessList => {
        const currentModule = this.getCurrentModule();
        const access = accessList.find(a => a.moduleId === currentModule.id);
        return access?.permissions.includes(permission) || false;
      })
    );
  }

  /**
   * Get filtered navigation groups based on module and permissions
   */
  private getFilteredNavigationGroups(
    moduleId: string,
    permissions: string[]
  ): ModuleSideNavGroup[] {
    return MODULE_NAV_GROUPS
      .filter(group =>
        group.moduleId === moduleId || group.moduleId === 'shared'
      )
      .map(group => ({
        ...group,
        items: group.items.filter(item =>
          !item.requiredPermissions ||
          item.requiredPermissions.some(perm => permissions.includes(perm))
        )
      }))
      .filter(group => group.items.length > 0)
      .sort((a, b) => a.order - b.order);
  }

  /**
   * Initialize module from localStorage on app start
   */
  initializeFromStorage(): void {
    const storedModuleId = localStorage.getItem('currentModule');
    if (storedModuleId) {
      this.switchModule(storedModuleId);
    }
  }

  /**
   * Update user module access (called when user permissions change)
   */
  updateUserModuleAccess(access: UserModuleAccess[]): void {
    this.userModuleAccessSubject.next(access);

    // Check if current module is still accessible
    const currentModule = this.getCurrentModule();
    const hasAccess = access.some(a =>
      a.moduleId === currentModule.id && a.isEnabled
    );

    if (!hasAccess) {
      // Switch to first available module
      const firstAvailable = access.find(a => a.isEnabled);
      if (firstAvailable) {
        this.switchModule(firstAvailable.moduleId);
      }
    }
  }

  /**
   * Get breadcrumb path for current navigation
   */
  getBreadcrumbPath(currentUrl: string): Observable<string[]> {
    return this.getModuleContext().pipe(
      map(context => {
        const breadcrumbs = [context.currentModule.name];

        // Find matching feature in navigation
        for (const group of context.navigationGroups) {
          const feature = group.items.find(item => item.url === currentUrl);
          if (feature) {
            breadcrumbs.push(group.name);
            breadcrumbs.push(feature.name);
            break;
          }
        }

        return breadcrumbs;
      })
    );
  }

  private applyModuleTheme(moduleId: string): void {
    // Remove any existing module theme classes
    document.body.classList.remove('stock-management-theme', 'asset-management-theme');

    // Apply the new module theme class
    const themeClass = `${moduleId}-theme`;
    document.body.classList.add(themeClass);

    // Debug logging for testing
    console.log(`🎨 Theme switched to: ${themeClass}`);
    console.log(`📋 Current body classes:`, document.body.className);
  }
}
