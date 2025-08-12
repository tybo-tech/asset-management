import { Component } from '@angular/core';
import { StockItem, StockItemListParams } from 'src/models/StockItem';
import { Category } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { FEATURE_NAMES } from 'src/models/SideNav';
import { initTransaction, Transaction } from 'src/models/Transaction';
import { StockItemService } from 'src/services/StockItemService';
import { CategoryService } from 'src/services/CategoryService';
import { CsvService } from 'src/services/CsvService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-list-stock',
  templateUrl: './list-stock.component.html',
  styleUrls: ['./list-stock.component.scss'],
})
export class ListStockComponent {
  list: StockItem[] = [];
  allItems: StockItem[] = [];
  selectedStockItem?: StockItem;
  transaction?: Transaction;
  transactionType: 'restock' | 'usage' | 'damaged' = 'restock';
  page = PAGES.assert;
  search = '';
  loading = false;
  accessChecked = false;
  FEATURE_NAMES = FEATURE_NAMES;
  orderBy: StockItemListParams = {
    orderBy: 'code',
    order: 'ASC',
    limit: 10000,
    offset: 0,
  };

  // Filters

  //__ Category
  selectedCategory = '';
  categories: string[] = [];

  //__ Stock Type (previously Asset Type)
  selectedStockType = '';
  stockTypes: string[] = [];
  constructor(
    private stockItemService: StockItemService,
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
    this.stockItemService.getAllStockItems(this.orderBy);
    this.getList();
  }
  getList() {
    this.stockItemService.$stockItemList.subscribe((data: StockItem[]) => {
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
    this.categories = this.list.map((stockItem) => stockItem.categoryName || '') || [];
    this.categories = this.categories.filter(
      (value: string, index: number, self: string[]) => self.indexOf(value) === index
    );

    //stock types
    this.stockTypes = this.list.map((stockItem) => stockItem.stockType || '') || [];
    this.stockTypes = this.stockTypes.filter(
      (value: string, index: number, self: string[]) => self.indexOf(value) === index
    );
  }
  onRestock(stockItem: StockItem) {
    this.selectedStockItem = stockItem;
    this.transaction = initTransaction();
    this.transactionType = 'restock';
    // Logic for handling restocking, e.g., open a modal or redirect to a restocking form
  }

  onUsage(stockItem: StockItem) {
    this.selectedStockItem = stockItem;
    this.transactionType = 'usage';
    this.transaction = initTransaction();
    // Logic for handling usage, e.g., open a modal or redirect to a usage form
  }

  onDamages(stockItem: StockItem) {
    this.selectedStockItem = stockItem;
    this.transactionType = 'damaged';
    this.transaction = initTransaction();
    // Logic for handling usage, e.g., open a modal or redirect to a usage form
  }
  filterList() {
    let list = this.allItems;

    if (this.selectedCategory) {
      list = list.filter((x) => x.categoryName === this.selectedCategory);
    }

    if (this.selectedStockType) {
      list = list.filter((x) => x.stockType === this.selectedStockType);
    }

    this.list = list;
  }
  exportToCsv() {
    this.csvService.exportAssetsToCsv(this.getExportName(), this.list);
  }
  onCategoryChange() {
    this.filterList();
  }

  onStockTypeChange() {
    this.filterList();
  }

  getExportName() {
    if (!this.selectedCategory && !this.selectedStockType)
      return `stock_items_${new Date().toLocaleDateString()}.csv`;
    // Generate a filename based on the filters
    const filters = [];
    if (this.selectedCategory) filters.push(this.selectedCategory);
    if (this.selectedStockType) filters.push(this.selectedStockType);
    return `stock_items_${filters.join('_')}.csv`;
  }

  // Delete stock item
  showConfirm = false;
  stockItemToDelete?: StockItem;
  onDelete(stockItem: StockItem) {
    this.showConfirm = true;
    this.stockItemToDelete = stockItem;
  }
  handleConfirm(result: boolean): void {
    if (result && this.stockItemToDelete) {
      this.stockItemService.removeStockItem(this.stockItemToDelete.id);
    }
    this.showConfirm = false;
    this.stockItemToDelete = undefined;
  }
}
