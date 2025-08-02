import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import {
  IAssetType,
  IAssetTransfer,
  ILocation,
} from 'src/models/movable-assets';
import { MovableAssetService } from 'src/services/movable-asset.service';

@Component({
  selector: 'app-asset-transfer-form',
  templateUrl: './asset-transfer-form.component.html',
  styleUrls: ['./asset-transfer-form.component.scss'],
})
export class AssetTransferFormComponent implements OnInit {
  @Input({ required: true }) assetType!: IAssetType;
  @Output() onClose = new EventEmitter<void>();
  @Output() onSuccess = new EventEmitter<void>();

  model: IAssetTransfer = {
    asset_type_id: 0,
    from_location_id: null,
    to_location_id: 0,
    quantity: 1,
    reason: '',
    metadata: {},
  };

  locations: ILocation[] = [];
  loading = false;
  saving = false;

  constructor(private movableAssetService: MovableAssetService) {}

  ngOnInit() {
    this.model.asset_type_id = this.assetType.id!;
    this.loadLocations();
  }

  loadLocations() {
    this.loading = true;
    this.movableAssetService.getLocations().subscribe({
      next: (data) => {
        this.locations = data || [];
        this.loading = false;
      },
      error: (err) => {
        console.error('Error loading locations:', err);
        this.loading = false;
      },
    });
  }

  getLocationName(locationId: number): string {
    const location = this.locations.find((loc) => loc.id === locationId);
    return location ? location.name : 'Unknown Location';
  }

  submit() {
    if (!this.model.to_location_id || this.model.quantity <= 0) {
      return;
    }

    this.saving = true;
    this.movableAssetService.transferAsset(this.model).subscribe({
      next: () => {
        console.log('Transfer completed successfully');
        this.onSuccess.emit();
        this.onClose.emit();
      },
      error: (err) => {
        console.error('Error transferring asset:', err);
        this.saving = false;
      },
    });
  }

  closeForm() {
    this.onClose.emit();
  }
}
