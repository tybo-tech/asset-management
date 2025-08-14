import { Component } from '@angular/core';
import { toast } from 'src/app/functions';
import { StockType } from 'src/models/AssetType';
import { PAGES } from 'src/models/Schema';
import { StockTypeService } from 'src/services/StockTypeService';

@Component({
  selector: 'app-list-asset-types',
  templateUrl: './list-asset-types.component.html',
  styleUrls: ['./list-asset-types.component.scss'],
})
export class ListAssetTypesComponent {
  showConfirmDelete = false;
  itemToDelete: StockType | undefined;
  page = PAGES.assetType;
  loading = false;
  assetTypes: StockType[] = [];
  search = '';
  constructor(private assetTypeService: StockTypeService) {
    this.getAll();
  }
  getAll() {
    this.assetTypeService.list().subscribe((data) => {
      this.assetTypes = data || [];
      this.loading = false;
    });
  }

  deleteAssetType(item: StockType) {
    this.itemToDelete = item;
    this.showConfirmDelete = true;
  }
  handleDelete(confirm: boolean) {
    this.showConfirmDelete = false;
    if (!confirm) {
      this.itemToDelete = undefined;
      return;
    }
    if (!this.itemToDelete) {
      return;
    }
    this.loading = true;
    this.assetTypeService.remove(this.itemToDelete.id).subscribe(
      () => {
        this.getAll();
        toast('Asset Type deleted successfully');
        this.loading = false;
      },
      (err) => {
        this.loading = false;
      }
    );
  }
}
