import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TOAST, toast } from 'src/app/functions';
import { StockItem, initStockItem, initStockItemMetadata } from 'src/models/StockItem';
import { StockType } from 'src/models/StockType';
import { Category } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { initTransaction, Transaction } from 'src/models/Transaction';
import { StockItemService } from 'src/services/StockItemService';
import { CategoryService } from 'src/services/CategoryService';

@Component({
  selector: 'app-stock-item',
  templateUrl: './stock-item.component.html',
  styleUrls: ['./stock-item.component.scss'],
})
export class StockItemComponent {
  id = '';
  data?: StockItem;
  page = PAGES.stockItem;
  isAdd = false;
  loading = false;

  // Dropdowns
  stockTypes: StockType[] = [];
  categories: Category[] = [];
  allStockTypes: StockType[] = [];

  // Other Actions Properties
  selectedStockItem?: StockItem;
  transaction?: Transaction;
  transactionType: 'restock' | 'usage' | 'damaged' = 'restock';

  constructor(
    private activatedRoute: ActivatedRoute,
    private stockItemService: StockItemService,
    private categoryService: CategoryService,
    private router: Router
  ) {
    activatedRoute.params.subscribe((p) => {
      this.id = p['id'];
      this.get();
      this.getCategories();
      this.fetchStockTypes();
    });
  }

  get title() {
    return this.isAdd ? 'Add Stock Item' : 'Update Stock Item';
  }

  getCategories() {
    this.loading = true;
    this.categoryService.getAll().subscribe((data) => {
      this.categories = data || [];
      this.loading = false;
    });
  }

  fetchStockTypes() {
    this.loading = true;
    this.stockItemService
      .getStockTypes()
      .subscribe((data) => {
        this.stockTypes = data || [];
        this.allStockTypes = data || [];
        this.loading = false;
      });
  }

  filterStockTypes() {
    if (!this.data || !this.data.categoryId) {
      this.stockTypes = this.allStockTypes;
      return;
    }
    this.stockTypes = this.allStockTypes;
    const categoryName =
      this.categories.find(
        (c) => Number(c.id) === Number(this.data?.categoryId)
      )?.name || '';
    this.stockTypes = this.allStockTypes.filter(
      (t) => t.categoryName === categoryName
    );
  }

  refreshStockItem() {
    location.reload();
  }

  get() {
    if ('add' === this.id) {
      this.isAdd = true;
      this.data = initStockItem();
      return;
    }
    this.isAdd = false;
    this.loading = true;
    this.stockItemService.getStockItemById(Number(this.id)).subscribe((data) => {
      this.data = data;
      this.loading = false;
      if (
        this.data &&
        ((this.data.metadata && typeof this.data.metadata !== 'object') ||
          !this.data.metadata)
      ) {
        this.data.metadata = initStockItemMetadata();
      }
    });
  }

  save() {
    if (!this.data) return;
    if (!this.data.name || !this.data.code) {
      toast('⚠️ Name and Code are required', TOAST.warn);
      return;
    }
    if (!this.data.categoryId) {
      toast('⚠️ Category is required', TOAST.warn);
      return;
    }
    if (!this.data.stockTypeId) {
      toast('⚠️ Stock Type is required', TOAST.warn);
      return;
    }
    if (!this.data.stockInHand) {
      this.data.stockInHand = 0;
    }
    // Add or Update
    // We make sure that the stock item code is unique
    // Whether we are adding or updating
    this.isAdd && this.validateStockItemCode(this.data.code);
    !this.isAdd && this.validateStockItemCode(this.data.code);
  }

  updateStockItem() {
    this.data &&
      this.stockItemService.updateStockItem(this.data).subscribe((res) => {
        if (res && res.stockItem && res.stockItem.id) {
          toast('✅ Stock Item updated successfully', TOAST.success);
          this.page.listUrl && this.router.navigate([this.page.listUrl]);
        }
      });
  }

  validateStockItemCode(code: string) {
    this.loading = true;
    this.stockItemService.getStockItemByCode(code).subscribe((data) => {
      this.loading = false;
      if (data && Number(data.id) === Number(this.id)) {
        this.callback();
        return;
      }
      if (data && data.id) {
        toast('⚠️ Stock Item with the same code already exists', TOAST.warn);
        return;
      }
      this.callback();
    });
  }

  callback() {
    this.isAdd ? this.insertNewStockItem() : this.updateStockItem();
  }

  insertNewStockItem() {
    this.data &&
      this.stockItemService.addStockItem(this.data).subscribe((res) => {
        if (res && res.id) {
          toast('✅ Stock Item added successfully', TOAST.success);
          this.page.listUrl && this.router.navigate([this.page.listUrl]);
        }
      });
  }

  // Other Actions

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
}
