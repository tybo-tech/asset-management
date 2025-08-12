import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { IKeyValue } from 'src/models/IKeyValue';
import { ICountResponse } from 'src/services/count.service';
import { ModuleDashboardService, ModuleDashboardData } from 'src/services/ModuleDashboardService';
import { Router } from '@angular/router';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-overview',
  templateUrl: './overview.component.html',
  styleUrls: ['./overview.component.scss'],
})
export class OverviewComponent implements OnInit, OnDestroy {
  // Dashboard data from module-aware service
  dashboardData: ModuleDashboardData | null = null;

  // Legacy properties for backward compatibility with existing templates
  stats?: ICountResponse;
  counts: IKeyValue[] = [];
  feaure = 'Overview';
  loading = true;

  // Dynamic column definitions (will change based on module)
  topIssuedAssets: IKeyValue[] = [];
  lowStock: IKeyValue[] = [];

  // Chart data properties (for template compatibility)
  locationDonut: any = null;
  stockBar: any = null;

  private destroy$ = new Subject<void>();

  constructor(
    private moduleDashboardService: ModuleDashboardService,
    private router: Router,
    private userService: UserService
  ) {
    this.userService.isLoggedIn();
    this.userService.roles$.subscribe((res) => {
      if (res && res.length) {
        console.log(this.userService.canAccess(this.feaure));
      }
    });
  }

  ngOnInit(): void {
    console.log('🚀 Overview Component initialized - subscribing to module dashboard data');

    // Subscribe to module-aware dashboard data
    this.moduleDashboardService.dashboardData$
      .pipe(takeUntil(this.destroy$))
      .subscribe(data => {
        console.log(`📊 Dashboard received data for module: ${data.moduleName}`, data);
        this.updateDashboard(data);
      });
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  private updateDashboard(data: ModuleDashboardData): void {
    this.dashboardData = data;
    this.loading = data.loading;

    // Update legacy properties for existing chart components
    this.stats = data.stats;
    this.counts = data.counts;
    this.topIssuedAssets = data.chartData.topItems;
    this.lowStock = data.chartData.lowStockItems;
    this.locationDonut = data.chartData.locationDonut;
    this.stockBar = data.chartData.stockBar;

    console.log(`✅ Dashboard updated for ${data.moduleName}`);
    console.log('📈 Chart data:', {
      counts: this.counts,
      topItems: this.topIssuedAssets,
      lowStock: this.lowStock,
      locationDonut: this.locationDonut,
      stockBar: this.stockBar
    });
  }

  // Legacy method for navigation - keep for existing functionality
  onRowClick(item: any): void {
    if (item?.data?.url) {
      this.router.navigate([item.data.url]);
    }
  }

  // Refresh dashboard data
  refreshDashboard(): void {
    this.moduleDashboardService.refreshCurrentModule();
  }
}
