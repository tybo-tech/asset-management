import { Component } from '@angular/core';
import { Asset, AssetListParams } from 'src/models/Asset';
import { Category } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { FEATURE_NAMES } from 'src/models/SideNav';
import { initTransaction, Transaction } from 'src/models/Transaction';
import { AssetService } from 'src/services/AssetService';
import { CategoryService } from 'src/services/CategoryService';
import { CsvService } from 'src/services/CsvService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-list-assert',
  templateUrl: './list-assert.component.html',
  styleUrls: ['./list-assert.component.scss'],
})
export class ListAssertComponent {
  list: Asset[] = [];
  allItems: Asset[] = [];
  selectedAsset?: Asset;
  transaction?: Transaction;
  transactionType: 'restock' | 'usage' | 'damaged' = 'restock';
  page = PAGES.assert;
  search = '';
  loading = false;
  accessChecked = false;
  FEATURE_NAMES = FEATURE_NAMES;
  orderBy: AssetListParams = {
    orderBy: 'code',
    order: 'ASC',
    limit: 10000,
    offset: 0,
  };

  // Filters

  //__ Category
  selectedCategory = '';
  categories: string[] = [];

  //__ Asset Type
  selectedAssetType = '';
  assetTypes: string[] = [];
  constructor(
    private assetService: AssetService,
    private csvService: CsvService,
    public userService: UserService
  ) {
    this.userService.isLoggedIn();
    userService.roles$.subscribe((res) => {
      if (res && res.length) {
        if (userService.canAccess(FEATURE_NAMES.listAssets)) {
          this.load();
        }
        this.accessChecked = true;
      }
    });
  }
  load() {
    this.loading = true;
    this.assetService.getAll(this.orderBy);
    this.getList();
  }
  getList() {
    this.assetService.$assetList.subscribe((data) => {
      this.list = data || [];
      this.allItems = data || [];
      this.mapFilters();
      this.loading = false;
    });
  }
  onSortChange() {
    this.load();
  }
  mapFilters() {
    //categories
    this.categories = this.list.map((asset) => asset.categoryName || '') || [];
    this.categories = this.categories.filter(
      (value, index, self) => self.indexOf(value) === index
    );

    //asset types
    this.assetTypes = this.list.map((asset) => asset.assetType || '') || [];
    this.assetTypes = this.assetTypes.filter(
      (value, index, self) => self.indexOf(value) === index
    );
  }
  onRestock(asset: Asset) {
    this.selectedAsset = asset;
    this.transaction = initTransaction();
    this.transactionType = 'restock';
    // Logic for handling restocking, e.g., open a modal or redirect to a restocking form
  }

  onUsage(asset: Asset) {
    this.selectedAsset = asset;
    this.transactionType = 'usage';
    this.transaction = initTransaction();
    // Logic for handling usage, e.g., open a modal or redirect to a usage form
  }

  onDamages(asset: Asset) {
    this.selectedAsset = asset;
    this.transactionType = 'damaged';
    this.transaction = initTransaction();
    // Logic for handling usage, e.g., open a modal or redirect to a usage form
  }
  filterList() {
    let list = this.allItems;

    if (this.selectedCategory) {
      list = list.filter((x) => x.categoryName === this.selectedCategory);
    }

    if (this.selectedAssetType) {
      list = list.filter((x) => x.assetType === this.selectedAssetType);
    }

    this.list = list;
  }
  exportToCsv() {
    this.csvService.exportAssetsToCsv(this.getExportName(), this.list);
  }
  onCategoryChange() {
    this.filterList();
  }

  onAssetTypeChange() {
    this.filterList();
  }

  getExportName() {
    if (!this.selectedCategory && !this.selectedAssetType)
      return `assets_${new Date().toLocaleDateString()}.csv`;
    // Generate a filename based on the filters
    const filters = [];
    if (this.selectedCategory) filters.push(this.selectedCategory);
    if (this.selectedAssetType) filters.push(this.selectedAssetType);
    return `assets_${filters.join('_')}.csv`;
  }

  // Delete asset
  showConfirm = false;
  assetToDelete?: Asset;
  onDelete(asset: Asset) {
    this.showConfirm = true;
    this.assetToDelete = asset;
  }
  handleConfirm(result: boolean): void {
    if (result && this.assetToDelete) {
      this.assetService.remove(this.assetToDelete.id);
    }
    this.showConfirm = false;
    this.assetToDelete = undefined;
  }
}
