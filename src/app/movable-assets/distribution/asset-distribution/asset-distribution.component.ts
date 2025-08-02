import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import {
  IAssetType,
  IAssetLocation,
  ILocation,
} from 'src/models/movable-assets';
import { MovableAssetService } from 'src/services/movable-asset.service';

@Component({
  selector: 'app-asset-distribution',
  templateUrl: './asset-distribution.component.html',
  styleUrls: ['./asset-distribution.component.scss'],
})
export class AssetDistributionComponent implements OnInit {
  @Input({ required: true }) assetType!: IAssetType;
  @Output() onClose = new EventEmitter<void>();
  @Output() onTransfer = new EventEmitter<IAssetType>();

  distribution: IAssetLocation[] = [];
  locations: ILocation[] = [];
  loading = false;

  constructor(private movableAssetService: MovableAssetService) {}

  ngOnInit() {
    this.loadDistribution();
    this.loadLocations();
  }

  loadDistribution() {
    this.loading = true;
    this.movableAssetService
      .getLocationDistribution(this.assetType.id!)
      .subscribe({
        next: (data) => {
          this.distribution = data || [];
          this.loading = false;
        },
        error: (err) => {
          console.error('Error loading distribution:', err);
          this.loading = false;
        },
      });
  }

  loadLocations() {
    this.movableAssetService.getLocations().subscribe({
      next: (data) => {
        this.locations = data || [];
      },
      error: (err) => {
        console.error('Error loading locations:', err);
      },
    });
  }

  getLocationName(locationId: number): string {
    // First try to get from distribution data (which includes location object)
    const distributionItem = this.distribution.find((item) => item.location_id === locationId);
    if (distributionItem && distributionItem.location) {
      return distributionItem.location.name;
    }

    // Fallback to locations array
    const location = this.locations.find((loc) => loc.id === locationId);
    return location ? location.name : 'Unknown Location';
  }

  getTotalDistributed(): number {
    return this.distribution.reduce((sum, item) => sum + item.quantity, 0);
  }

  getDistributionPercentage(): number {
    const total = this.assetType.total_quantity || 0;
    if (total === 0) return 0;
    return Math.round((this.getTotalDistributed() / total) * 100);
  }

  initiateTransfer() {
    this.onTransfer.emit(this.assetType);
  }

  closeModal() {
    this.onClose.emit();
  }
}
