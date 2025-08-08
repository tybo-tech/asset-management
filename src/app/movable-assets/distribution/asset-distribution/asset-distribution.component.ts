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
  showDiscrepancies = false;
  consistencyValidation: any = null;

  constructor(private movableAssetService: MovableAssetService) {}

  ngOnInit() {
    this.loadDistribution();
    this.loadLocations();
    this.validateConsistency();
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

  // 🔍 Data Consistency Methods

  validateConsistency() {
    this.movableAssetService
      .validateConsistency(this.assetType.id!)
      .subscribe({
        next: (validation) => {
          this.consistencyValidation = validation;
          if (validation.has_discrepancies) {
            this.showDiscrepancies = true;
          }
        },
        error: (err) => {
          console.error('Error validating consistency:', err);
        },
      });
  }

  reconcileDistribution() {
    if (
      confirm(
        'This will update distribution data based on actual computed values. This action cannot be undone. Continue?'
      )
    ) {
      this.loading = true;
      this.movableAssetService
        .reconcileDistribution(this.assetType.id!)
        .subscribe({
          next: () => {
            console.log('Distribution reconciled successfully');
            this.loadDistribution(); // Refresh distribution data
            this.validateConsistency(); // Re-validate
            this.showDiscrepancies = false;
          },
          error: (err) => {
            console.error('Error reconciling distribution:', err);
            this.loading = false;
          },
        });
    }
  }

  dismissDiscrepancies() {
    this.showDiscrepancies = false;
  }
}
