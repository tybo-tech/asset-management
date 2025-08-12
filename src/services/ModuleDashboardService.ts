import { Injectable } from '@angular/core';
import { Observable, BehaviorSubject, combineLatest } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';
import { ModuleNavigationService } from './ModuleNavigationService';
import { CountService, ICountResponse } from './count.service';
import { AssetService } from './AssetService';
import { IKeyValue } from 'src/models/IKeyValue';
import { IDoughnutChart, IBarChart } from 'src/models/Charts';

export interface ModuleDashboardData {
  moduleId: string;
  moduleName: string;
  stats?: ICountResponse;
  counts: IKeyValue[];
  chartData: {
    locationDonut?: IDoughnutChart;
    stockBar?: IBarChart;
    topItems: any[]; // Flexible for both IKeyValue[] (columns) and actual data
    lowStockItems: any[]; // Flexible for both IKeyValue[] (columns) and actual data
  };
  loading: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class ModuleDashboardService {

  private dashboardDataSubject = new BehaviorSubject<ModuleDashboardData>({
    moduleId: 'stock-management',
    moduleName: 'Stock Management',
    counts: [],
    chartData: {
      topItems: [],
      lowStockItems: []
    },
    loading: true
  });

  public dashboardData$ = this.dashboardDataSubject.asObservable();

  constructor(
    private moduleNavService: ModuleNavigationService,
    private countService: CountService,
    private assetService: AssetService
  ) {
    this.initializeDashboard();
  }

  private initializeDashboard(): void {
    // Listen to module changes and reload dashboard data
    this.moduleNavService.currentModule$.subscribe(module => {
      console.log(`📊 Dashboard loading data for module: ${module.name}`);
      this.loadModuleDashboardData(module.id);
    });
  }

  private loadModuleDashboardData(moduleId: string): void {
    this.setLoadingState(moduleId, true);

    if (moduleId === 'stock-management') {
      this.loadStockDashboard(moduleId);
    } else if (moduleId === 'asset-management') {
      this.loadAssetDashboard(moduleId);
    }
  }

  private loadStockDashboard(moduleId: string): void {
    console.log('🔵 Loading Stock Management Dashboard');

    this.countService.all().subscribe({
      next: (stats) => {
        console.log('📦 Raw API response from count service:', stats);

        if (stats) {
          const dashboardData: ModuleDashboardData = {
            moduleId,
            moduleName: 'Stock Management',
            stats,
            counts: this.mapStockCounts(stats),
            chartData: {
              locationDonut: this.prepareLocationDonut(stats),
              stockBar: this.prepareStockBar(stats),
              topItems: stats.topIssuedAssets || [], // Use actual API data
              lowStockItems: stats.lowStock || [] // Use actual API data
            },
            loading: false
          };

          console.log('📊 Final dashboard data prepared:', {
            moduleId: dashboardData.moduleId,
            moduleName: dashboardData.moduleName,
            counts: dashboardData.counts,
            locationDonut: dashboardData.chartData.locationDonut,
            stockBar: dashboardData.chartData.stockBar,
            topItems: dashboardData.chartData.topItems?.length,
            lowStock: dashboardData.chartData.lowStockItems?.length
          });

          this.dashboardDataSubject.next(dashboardData);
          console.log('✅ Stock dashboard data loaded and broadcast');
        }
      },
      error: (error) => {
        console.error('❌ Error loading stock dashboard:', error);
        this.setLoadingState(moduleId, false);
      }
    });
  }

  private loadAssetDashboard(moduleId: string): void {
    console.log('🟢 Loading Asset Management Dashboard');

    // For now, we'll simulate asset data. Later this can be replaced with actual asset API calls
    this.simulateAssetData().subscribe({
      next: (stats) => {
        const dashboardData: ModuleDashboardData = {
          moduleId,
          moduleName: 'Asset Management',
          stats,
          counts: this.mapAssetCounts(stats),
          chartData: {
            locationDonut: this.prepareAssetLocationDonut(stats),
            stockBar: this.prepareAssetConditionBar(stats),
            topItems: stats.topIssuedAssets || [], // Use actual mock data for assets
            lowStockItems: stats.lowStock || [] // Use actual mock data for low stock assets
          },
          loading: false
        };

        this.dashboardDataSubject.next(dashboardData);
        console.log('✅ Asset dashboard data loaded');
      },
      error: (error) => {
        console.error('❌ Error loading asset dashboard:', error);
        this.setLoadingState(moduleId, false);
      }
    });
  }

  private setLoadingState(moduleId: string, loading: boolean): void {
    const currentData = this.dashboardDataSubject.value;
    this.dashboardDataSubject.next({
      ...currentData,
      moduleId,
      loading
    });
  }

  // Stock Management Data Mapping (preserving original reports)
  private mapStockCounts(stats: ICountResponse): IKeyValue[] {
    const counts: IKeyValue[] = [];

    // Stock items (previously called "assets" in the old system)
    if (stats.asset?.length) {
      stats.asset.forEach(item => {
        counts.push({
          key: item.Label, // Keep original labels like "Active Assets", "Completed Assets"
          value: item.Value.toString(),
          data: { url: '/list-assert' } // Original stock items URL
        });
      });
    }

    // Categories
    if (stats.category?.length) {
      stats.category.forEach(item => {
        counts.push({
          key: item.Label,
          value: item.Value.toString(),
          data: { url: '/categories' }
        });
      });
    }

    // Categories
    if (stats.category?.length) {
      stats.category.forEach(item => {
        counts.push({
          key: item.Label,
          value: item.Value.toString(),
          data: { url: '/categories' }
        });
      });
    }

    // Locations
    if (stats.Location?.length) {
      const totalLocations = stats.Location.length;
      counts.push({
        key: 'Locations',
        value: totalLocations.toString(),
        data: { url: '/locations' }
      });
    }

    // Other counts (suppliers, location types, etc.)
    if (stats.other?.length) {
      stats.other.forEach(item => {
        counts.push({
          key: item.Label,
          value: item.Value.toString(),
          data: { url: item.url || '/dashboard' }
        });
      });
    }

    if (stats.user?.length) {
      stats.user.forEach(item => {
        counts.push({
          key: 'Users',
          value: item.Value.toString(),
          data: { url: '/users' }
        });
      });
    }

    if (stats.restock?.length) {
      stats.restock.forEach(item => {
        counts.push({
          key: 'Restocks',
          value: item.Value.toString(),
          data: { url: '/transactions/restock' }
        });
      });
    }

    if (stats.usage?.length) {
      stats.usage.forEach(item => {
        counts.push({
          key: 'Usage',
          value: item.Value.toString(),
          data: { url: '/transactions/usage' }
        });
      });
    }

    return counts;
  }

  // Asset Management Data Mapping
  private mapAssetCounts(stats: ICountResponse): IKeyValue[] {
    const totalAssets = parseInt((stats.asset?.[0]?.Value || 0).toString());

    return [
      {
        key: 'Total Assets',
        value: totalAssets.toString(),
        data: { url: '/asset-list' }
      },
      {
        key: 'Active Assets',
        value: Math.floor(totalAssets * 0.85).toString(),
        data: { url: '/asset-list' }
      },
      {
        key: 'In Maintenance',
        value: Math.floor(totalAssets * 0.1).toString(),
        data: { url: '/asset-list' }
      },
      {
        key: 'Warranty Expiring',
        value: Math.floor(totalAssets * 0.05).toString(),
        data: { url: '/asset-list' }
      }
    ];
  }

  // Column definitions for tables
  private getStockTopItemsColumns(): IKeyValue[] {
    return [
      { value: 'Name', key: 'assetName' },
      { value: 'Issued', key: 'totalIssued' },
      { value: 'Category', key: 'categoryName' }
    ];
  }

  private getStockLowStockColumns(): IKeyValue[] {
    return [
      { value: 'Name', key: 'name' },
      { value: 'Stock In Hand', key: 'stockInHand' },
      { value: 'Minimum Alert', key: 'minimumStockAlert' }
    ];
  }

  private getAssetTopItemsColumns(): IKeyValue[] {
    return [
      { value: 'Asset Name', key: 'assetName' },
      { value: 'Location', key: 'roomName' },
      { value: 'Condition', key: 'condition' }
    ];
  }

  private getAssetWarrantyColumns(): IKeyValue[] {
    return [
      { value: 'Asset Name', key: 'assetName' },
      { value: 'Warranty Expires', key: 'warrantyDate' },
      { value: 'Days Left', key: 'daysLeft' }
    ];
  }

  // Chart data preparation methods
  private prepareLocationDonut(stats: ICountResponse): IDoughnutChart | undefined {
    console.log('🔍 Preparing location donut - raw stats:', stats);
    console.log('🔍 Location data specifically:', stats.Location);
    console.log('🔍 Location type:', typeof stats.Location);
    console.log('🔍 Location exists:', !!stats.Location);
    console.log('🔍 Location length:', stats.Location?.length);

    // Fallback test data if Location is undefined (temporary debugging)
    if (!stats.Location && stats) {
      console.log('⚠️ Location is undefined, creating test data from your API response');
      const testLocationData = [
        {
          location: "",
          totalTransactions: 490
        }
      ];

      const donutChart: IDoughnutChart = {
        labels: testLocationData.map(item => item.location || 'Unspecified Location'),
        datasets: [{
          label: 'Transactions by Location',
          data: testLocationData.map(item => item.totalTransactions),
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)',
            'rgb(75, 192, 192)',
            'rgb(153, 102, 255)',
            'rgb(255, 159, 64)',
            'rgb(199, 199, 199)',
            'rgb(83, 102, 255)',
            'rgb(255, 99, 255)'
          ],
          hoverOffset: 4
        }]
      };

      console.log('🧪 Test donut chart created:', donutChart);
      return donutChart;
    }

    // Use Location data if available
    if (stats.Location?.length) {
      const filteredLocations = stats.Location.filter(item => item.totalTransactions > 0);

      console.log('🔍 Filtered locations:', filteredLocations);

      if (filteredLocations.length === 0) {
        console.log('❌ No valid location data after filtering');
        return undefined; // No valid data for chart
      }

      const donutChart: IDoughnutChart = {
        labels: filteredLocations.map(item => item.location || 'Unspecified Location'),
        datasets: [{
          label: 'Transactions by Location',
          data: filteredLocations.map(item => item.totalTransactions),
          backgroundColor: [
            'rgb(255, 99, 132)',   // Red
            'rgb(54, 162, 235)',   // Blue
            'rgb(255, 205, 86)',   // Yellow
            'rgb(75, 192, 192)',   // Teal
            'rgb(153, 102, 255)',  // Purple
            'rgb(255, 159, 64)',   // Orange
            'rgb(199, 199, 199)',  // Gray
            'rgb(83, 102, 255)',   // Light Blue
            'rgb(255, 99, 255)'    // Pink
          ],
          hoverOffset: 4
        }]
      };

      console.log('✅ Donut chart prepared:', donutChart);
      return donutChart;
    }

    console.log('❌ No Location data found in stats');
    return undefined;
  }

  private prepareStockBar(stats: ICountResponse): IBarChart | undefined {
    // Use stockLevels data if available
    if (stats.stockLevels?.length) {
      const barChart: IBarChart = {
        labels: stats.stockLevels.map(item => item.name),
        datasets: [{
          label: 'Stock Levels',
          data: stats.stockLevels.map(item => item.stockInHand),
          backgroundColor: [
            'rgba(255, 99, 132, 0.6)',
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 205, 86, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 205, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      };
      return barChart;
    }
    return undefined;
  }

  private prepareAssetLocationDonut(stats: ICountResponse): any {
    // Transform data for asset location distribution
    return {
      labels: ['Office', 'Storage', 'Conference Room', 'Lobby'],
      data: [45, 25, 20, 10],
      backgroundColor: ['#4caf50', '#2e7d32', '#66bb6a', '#81c784']
    };
  }

  private prepareAssetConditionBar(stats: ICountResponse): any {
    // Transform data for asset condition breakdown
    return {
      labels: ['New', 'Good', 'Fair', 'Needs Repair'],
      data: [30, 45, 20, 5],
      backgroundColor: ['#4caf50', '#66bb6a', '#ffeb3b', '#f44336']
    };
  }

  // Simulate asset data (to be replaced with real API calls)
  private simulateAssetData(): Observable<ICountResponse> {
    return new Observable(observer => {
      setTimeout(() => {
        const mockAssetStats: ICountResponse = {
          asset: [{ Label: 'Total Assets', Value: 156, url: '', icon: '' }],
          user: [{ Label: 'Users', Value: 12, url: '', icon: '' }],
          restock: [{ Label: 'Transfers', Value: 23, url: '', icon: '' }],
          usage: [{ Label: 'Maintenance', Value: 8, url: '', icon: '' }],
          other: [],
          category: [],
          topIssuedAssets: [
            { assetName: 'Dell Laptop #001', roomName: 'Office 101', condition: 'Good' },
            { assetName: 'Samsung Monitor #002', roomName: 'Office 102', condition: 'New' },
            { assetName: 'Office Chair #003', roomName: 'Office 103', condition: 'Fair' }
          ],
          lowStock: [
            { name: 'HP Printer #004', stockInHand: 1, minimumStockAlert: 2, id: 1 },
            { name: 'Projector #005', stockInHand: 0, minimumStockAlert: 1, id: 2 },
            { name: 'Conference Phone #006', stockInHand: 1, minimumStockAlert: 3, id: 3 }
          ],
          Location: [
            { location: 'Office', totalTransactions: 45 },
            { location: 'Storage', totalTransactions: 25 },
            { location: 'Conference Room', totalTransactions: 20 },
            { location: 'Lobby', totalTransactions: 10 }
          ],
          stockLevels: [
            { category: 'Electronics', id: 1, name: 'Laptops', stockInHand: 30 },
            { category: 'Furniture', id: 2, name: 'Chairs', stockInHand: 45 },
            { category: 'Equipment', id: 3, name: 'Printers', stockInHand: 20 },
            { category: 'Accessories', id: 4, name: 'Cables', stockInHand: 5 }
          ]
        };
        observer.next(mockAssetStats);
        observer.complete();
      }, 800); // Simulate API delay
    });
  }

  // Public method to refresh current module data
  public refreshCurrentModule(): void {
    const currentModule = this.moduleNavService.getCurrentModule();
    this.loadModuleDashboardData(currentModule.id);
  }
}
