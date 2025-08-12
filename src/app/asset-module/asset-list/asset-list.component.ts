import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Asset } from 'src/models/Asset';
import { AssetService } from 'src/services/AssetService';

@Component({
  selector: 'app-asset-list',
  templateUrl: './asset-list.component.html',
  styleUrls: ['./asset-list.component.scss']
})
export class AssetListComponent implements OnInit {

  assets$: Observable<Asset[]>;
  isLoading = false;
  searchQuery = '';

  constructor(private assetService: AssetService) {
    this.assets$ = this.assetService.$assetList;
  }

  ngOnInit(): void {
    this.loadAssets();
  }

  loadAssets(): void {
    this.isLoading = true;
    this.assetService.getAll();

    // Subscribe to the asset list to handle loading state
    this.assets$.subscribe({
      next: () => {
        this.isLoading = false;
      },
      error: (error: any) => {
        console.error('Error loading assets:', error);
        this.isLoading = false;
      }
    });
  }

  onSearch(): void {
    if (this.searchQuery.trim()) {
      this.assetService.search(this.searchQuery).subscribe();
    } else {
      this.loadAssets();
    }
  }

  onEdit(asset: Asset): void {
    // Navigate to edit asset
    console.log('Edit asset:', asset);
  }

  onDelete(asset: Asset): void {
    if (confirm(`Are you sure you want to delete asset: ${asset.name}?`)) {
      this.assetService.remove(asset.id);
      // Reload the list after deletion
      setTimeout(() => this.loadAssets(), 1000);
    }
  }

  onViewDetails(asset: Asset): void {
    // Navigate to asset details
    console.log('View asset details:', asset);
  }

  trackByAssetId(index: number, asset: Asset): number {
    return asset.id;
  }

  onImageError(event: Event): void {
    const target = event.target as HTMLImageElement;
    target.src = 'assets/default-asset.png';
  }
}
