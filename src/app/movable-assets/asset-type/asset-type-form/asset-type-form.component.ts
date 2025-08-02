import { Component, EventEmitter, Input, Output, OnInit } from '@angular/core';
import { IAssetType } from 'src/models/movable-assets';
import { MovableAssetService } from 'src/services/movable-asset.service';

interface MetadataEntry {
  key: string;
  value: string;
}

@Component({
  selector: 'app-asset-type-form',
  templateUrl: './asset-type-form.component.html',
  styleUrls: ['./asset-type-form.component.scss'],
})
export class AssetTypeFormComponent implements OnInit {
  @Input({ required: true }) asset!: IAssetType;
  @Output() formSubmitted = new EventEmitter<IAssetType>();
  @Output() onClose = new EventEmitter<void>();

  saving = false;
  metadataEntries: MetadataEntry[] = [];

  constructor(private movableAssetService: MovableAssetService) {}

  ngOnInit() {
    this.initializeMetadata();
  }

  initializeMetadata() {
    // Convert metadata object to entries array for easier editing
    if (this.asset.metadata) {
      try {
        const metadata = typeof this.asset.metadata === 'string'
          ? JSON.parse(this.asset.metadata)
          : this.asset.metadata;

        this.metadataEntries = Object.entries(metadata).map(([key, value]) => ({
          key,
          value: String(value)
        }));
      } catch (e) {
        this.metadataEntries = [];
      }
    } else {
      this.metadataEntries = [];
    }
  }

  addMetadataEntry() {
    this.metadataEntries.push({ key: '', value: '' });
  }

  removeMetadataEntry(index: number) {
    this.metadataEntries.splice(index, 1);
    this.updateMetadata();
  }

  updateMetadata() {
    // Convert entries array back to metadata object
    const metadata: any = {};
    this.metadataEntries
      .filter(entry => entry.key.trim() && entry.value.trim())
      .forEach(entry => {
        metadata[entry.key.trim()] = entry.value.trim();
      });

    this.asset.metadata = metadata;
  }

  closeForm() {
    this.onClose.emit();
  }
  save() {
    this.updateMetadata(); // Ensure metadata is updated before saving
    this.saving = true;

    if (this.asset.id) {
      // Update existing asset type
      this.movableAssetService.updateAssetType(this.asset).subscribe({
        next: (data) => {
          if (data) {
            console.log('Asset type updated successfully:', data);
            this.formSubmitted.emit(data);
            this.saving = false;
            this.closeForm();
          }
        },
        error: (err) => {
          console.error('Error updating asset type:', err);
          this.saving = false;
        },
      });
    } else {
      // Add new asset type
      this.movableAssetService.addAssetType(this.asset).subscribe({
        next: (data) => {
          if (data && data.item) {
            console.log('Asset type added successfully:', data.item);
            this.formSubmitted.emit(data.item);
            this.saving = false;
            this.closeForm();
          }
        },
        error: (err) => {
          console.error('Error adding asset type:', err);
          this.saving = false;
        },
      });
    }
  }
}
