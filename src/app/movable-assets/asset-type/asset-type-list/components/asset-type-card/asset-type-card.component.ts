import { Component, Input, Output, EventEmitter } from '@angular/core';
import { IAssetType } from 'src/models/movable-assets';

@Component({
  selector: 'app-asset-type-card',
  templateUrl: './asset-type-card.component.html',
  styleUrls: ['./asset-type-card.component.scss']
})
export class AssetTypeCardComponent {
  @Input() assetType!: IAssetType;
  @Input() loading = false;

  @Output() edit = new EventEmitter<IAssetType>();
  @Output() viewDistribution = new EventEmitter<IAssetType>();
  @Output() transfer = new EventEmitter<IAssetType>();

  onEdit() {
    this.edit.emit(this.assetType);
  }

  onViewDistribution() {
    this.viewDistribution.emit(this.assetType);
  }

  onTransfer() {
    this.transfer.emit(this.assetType);
  }

  formatValue(value: number | undefined): string {
    if (!value) return 'R0.00';
    return `R${value.toLocaleString('en-ZA', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
  }
}
