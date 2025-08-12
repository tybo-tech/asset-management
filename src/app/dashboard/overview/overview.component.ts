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

    // For stock management, use actual API data; for assets, use column definitions
    if (data.moduleId === 'stock-management') {
      // Use actual data from API for stock items
      this.topIssuedAssets = this.getStockTopItemsColumns(); // Column definitions
      this.lowStock = this.getStockLowStockColumns(); // Column definitions
      // The data itself comes from stats.topIssuedAssets and stats.lowStock
    } else {
      // For asset management, use column definitions
      this.topIssuedAssets = this.getAssetTopItemsColumns();
      this.lowStock = this.getAssetWarrantyColumns();
    }

    this.locationDonut = data.chartData.locationDonut;
    this.stockBar = data.chartData.stockBar;

    console.log(`✅ Dashboard updated for ${data.moduleName}`);
    console.log('📈 Chart data:', {
      counts: this.counts,
      topIssuedAssetsColumns: this.topIssuedAssets,
      lowStockColumns: this.lowStock,
      topIssuedData: this.stats?.topIssuedAssets,
      lowStockData: this.stats?.lowStock,
      locationDonut: this.locationDonut,
      stockBar: this.stockBar,
      rawLocationData: this.stats?.Location
    });

    // Specific logging for donut chart debugging
    if (this.locationDonut) {
      console.log('🍩 Donut chart data prepared:', this.locationDonut);
    } else {
      console.log('❌ No donut chart data - checking raw location data:', this.stats?.Location);
    }
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

  // Column definitions for stock management tables
  private getStockTopItemsColumns(): IKeyValue[] {
    return [
      { value: 'Name', key: 'stockItemName' }, // Fixed: API uses 'stockItemName'
      { value: 'Code', key: 'stockItemCode' }, // Added: Show stock item code
      { value: 'Total Issued', key: 'totalIssued' }, // Fixed: API uses 'totalIssued'
      { value: 'Category', key: 'categoryName' } // Fixed: API uses 'categoryName'
    ];
  }

  private getStockLowStockColumns(): IKeyValue[] {
    return [
      { value: 'Name', key: 'name' },
      { value: 'Stock In Hand', key: 'stockInHand' },
      { value: 'Minimum Alert', key: 'minimumStockAlert' }
    ];
  }

  // Column definitions for asset management tables
  private getAssetTopItemsColumns(): IKeyValue[] {
    return [
      { value: 'Asset Name', key: 'name' }, // Fixed: changed from 'assetName' to 'name'
      { value: 'Count', key: 'count' }, // Fixed: changed from 'roomName' to 'count'
      { value: 'Category', key: 'category' } // Fixed: changed from 'condition' to 'category'
    ];
  }

  private getAssetWarrantyColumns(): IKeyValue[] {
    return [
      { value: 'Asset Name', key: 'assetName' },
      { value: 'Warranty Expires', key: 'warrantyDate' },
      { value: 'Days Left', key: 'daysLeft' }
    ];
  }
}
