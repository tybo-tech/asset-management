import { Component, OnInit } from '@angular/core';
import { IAssetType } from 'src/models/movable-assets';
import { MovableAssetService } from 'src/services/movable-asset.service';

@Component({
  selector: 'app-asset-type-list',
  templateUrl: './asset-type-list.component.html',
  styleUrls: ['./asset-type-list.component.scss'],
})
export class AssetTypeListComponent implements OnInit {
  assetTypes: IAssetType[] = [];
  newItem?: IAssetType;
  showAddForm = false;
  showEditForm = false;
  showTransferForm = false;
  showDistribution = false;
  itemToEdit?: IAssetType;
  selectedAssetType?: IAssetType;
  selectedDistribution?: IAssetType;
  loading = false;
  searchTerm = '';

  constructor(private movableAssetService: MovableAssetService) {}

  ngOnInit() {
    this.fetchAssetTypes();
  }

  fetchAssetTypes() {
    this.loading = true;
    this.movableAssetService.listAssetTypes().subscribe({
      next: (data) => {
        this.assetTypes = data || [];
        this.loading = false;
      },
      error: (err) => {
        console.error('Error fetching asset types:', err);
        this.loading = false;
      },
    });
  }

  selectItemToEdit(item: IAssetType) {
    this.itemToEdit = { ...item };
    this.showEditForm = true;
    this.showAddForm = false;
  }
  initNewItem() {
    this.showAddForm = true;
    this.showEditForm = false;
    this.itemToEdit = undefined;
    // Initialize a new item with default values
    this.newItem = {
      name: '',
      category: '',
      description: '',
      default_value: 0,
      total_quantity: 0,
      metadata: {},
    };
  }

  // Computed property for filtered asset types
  get filteredAssetTypes(): IAssetType[] {
    if (!this.searchTerm.trim()) {
      return this.assetTypes;
    }

    const term = this.searchTerm.toLowerCase();
    return this.assetTypes.filter(asset =>
      asset.name.toLowerCase().includes(term) ||
      asset.category?.toLowerCase().includes(term) ||
      asset.description?.toLowerCase().includes(term)
    );
  }

  // Get metadata tags for display
  getMetadataTags(metadata: any): string[] {
    if (!metadata) return [];

    try {
      const parsed = typeof metadata === 'string' ? JSON.parse(metadata) : metadata;
      return Object.entries(parsed).map(([key, value]) => `${key}: ${value}`);
    } catch {
      return [];
    }
  }

  // Export to CSV functionality
  exportToCsv() {
    const csvData = this.filteredAssetTypes.map(asset => ({
      Name: asset.name,
      Category: asset.category,
      Description: asset.description,
      'Default Value': asset.default_value,
      'Total Quantity': asset.total_quantity,
      'Created Date': asset.created_at
    }));

    if (csvData.length === 0) return;

    // Simple CSV export logic
    const headers = Object.keys(csvData[0]);
    const csvContent = [
      headers.join(','),
      ...csvData.map(row =>
        headers.map(header => {
          const value = (row as any)[header];
          return `"${value || ''}"`;
        }).join(',')
      )
    ].join('\n');

    const blob = new Blob([csvContent], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `asset-types-${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
    window.URL.revokeObjectURL(url);
  }

  // Navigation methods
  viewDistribution(assetType: IAssetType) {
    this.selectedDistribution = { ...assetType };
    this.showDistribution = true;
    console.log('View distribution for:', assetType.name);
  }

  transferAsset(assetType: IAssetType) {
    // Open transfer form with selected asset
    this.selectedAssetType = { ...assetType };
    this.showTransferForm = true;
    console.log('Opening transfer form for:', assetType.name);
  }

  // Form handling methods
  closeForm() {
    this.showAddForm = false;
    this.showEditForm = false;
    this.showTransferForm = false;
    this.showDistribution = false;
    this.newItem = undefined;
    this.itemToEdit = undefined;
    this.selectedAssetType = undefined;
    this.selectedDistribution = undefined;
  }

  closeTransferForm() {
    this.showTransferForm = false;
    this.selectedAssetType = undefined;
  }

  closeDistribution() {
    this.showDistribution = false;
    this.selectedDistribution = undefined;
  }

  onTransferFromDistribution(assetType: IAssetType) {
    // Close distribution and open transfer
    this.closeDistribution();
    this.transferAsset(assetType);
  }

  onTransferSuccess() {
    this.fetchAssetTypes(); // Refresh the list
    this.closeTransferForm();
  }

  onAssetTypeSaved(assetType: IAssetType) {
    alert('Asset Type saved successfully!');
    // Refresh the list
    this.fetchAssetTypes();
    this.closeForm();
  }
}
