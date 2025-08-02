import { Component } from '@angular/core';
import { toast } from 'src/app/functions';
import { AssetType } from 'src/models/AssetType';
import { PAGES } from 'src/models/Schema';
import { AssetTypeService } from 'src/services/AssetTypeService';

@Component({
  selector: 'app-list-asset-types',
  templateUrl: './list-asset-types.component.html',
  styleUrls: ['./list-asset-types.component.scss'],
})
export class ListAssetTypesComponent {
  showConfirmDelete = false;
  itemToDelete: AssetType | undefined;
  page = PAGES.assetType;
  loading = false;
  assetTypes: AssetType[] = [];
  search = '';
  constructor(private assetTypeService: AssetTypeService) {
    this.getAll();
  }
  getAll() {
    this.assetTypeService.getAll().subscribe((data) => {
      this.assetTypes = data || [];
      this.loading = false;
    });
  }

  deleteAssetType(item: AssetType) {
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
