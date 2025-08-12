import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { AssetService } from 'src/services/AssetService';

@Component({
  selector: 'app-asset-dashboard',
  templateUrl: './asset-dashboard.component.html',
  styleUrls: ['./asset-dashboard.component.scss']
})
export class AssetDashboardComponent implements OnInit {

  totalAssets = 0;
  activeAssets = 0;
  lowStockAssets = 0;
  inactiveAssets = 0;

  recentAssets: any[] = [];
  isLoading = true;

  // Chart data (placeholder)
  assetStatusChart = {
    labels: ['Active', 'Inactive', 'Pending', 'Out of Stock'],
    data: [0, 0, 0, 0],
    colors: ['#28a745', '#6c757d', '#ffc107', '#dc3545']
  };

  constructor(private assetService: AssetService) {}

  ngOnInit(): void {
    this.loadDashboardData();
  }

  loadDashboardData(): void {
    this.isLoading = true;

    // Load all assets to calculate statistics
    this.assetService.getAll();

    this.assetService.$assetList.subscribe(assets => {
      this.totalAssets = assets.length;
      this.activeAssets = assets.filter(a => a.status === 'active').length;
      this.lowStockAssets = assets.filter(a => a.stockInHand <= 10 && a.stockInHand > 0).length;
      this.inactiveAssets = assets.filter(a => a.status === 'inactive').length;

      // Update chart data
      this.assetStatusChart.data = [
        this.activeAssets,
        this.inactiveAssets,
        assets.filter(a => a.status === 'pending').length,
        assets.filter(a => a.status === 'out_of_stock').length
      ];

      // Get recent assets (last 5)
      this.recentAssets = assets
        .sort((a, b) => new Date(b.createdDate).getTime() - new Date(a.createdDate).getTime())
        .slice(0, 5);

      this.isLoading = false;
    });
  }

  navigateToAssets(): void {
    // Navigation logic will be implemented with routing
    console.log('Navigate to assets list');
  }

  navigateToReports(): void {
    console.log('Navigate to reports');
  }
}
