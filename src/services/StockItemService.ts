import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { TOAST, toast } from 'src/app/functions';
import { StockItem, StockItemListParams, initStockItemListParams } from 'src/models/StockItem';
import { StockType, StockTypeListParams } from 'src/models/StockType';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class StockItemService {
  private readonly base = `${API}/stock-items`;
  private readonly stockTypeBase = `${API}/stock-type`;
  private stockItemList = new BehaviorSubject<StockItem[]>([]);
  private stockTypeList = new BehaviorSubject<StockType[]>([]);

  $stockItemList = this.stockItemList.asObservable();
  $stockTypeList = this.stockTypeList.asObservable();

  constructor(private http: HttpClient, private router: Router) {}

  // ========== STOCK ITEM OPERATIONS ==========

  // Create Stock Item
  addStockItem(stockItem: StockItem): Observable<StockItem> {
    return this.http.post<StockItem>(`${this.base}/add.php`, stockItem);
  }

  // Get all Stock Items with filtering
  getAllStockItems(params: StockItemListParams = initStockItemListParams()): void {
    const searchParams = new URLSearchParams({
      category: params.category !== undefined ? String(params.category) : '',
      orderBy: params.orderBy ?? 'createdDate',
      order: params.order ?? 'DESC',
      limit: params.limit !== undefined ? String(params.limit) : '10000',
      offset: params.offset !== undefined ? String(params.offset) : '0',
    }).toString();

    this.http
      .get<StockItem[]>(`${this.base}/list.php?${searchParams}`)
      .subscribe((data) => {
        if (Array.isArray(data)) {
          this.stockItemList.next(data);
        }
      });
  }

  // Get Stock Item by ID
  getStockItemById(id: number): Observable<StockItem> {
    return this.http.get<StockItem>(`${this.base}/getById.php?id=${id}`);
  }

  // Get multiple Stock Items by IDs
  getStockItemsByIds(ids: number[]): Observable<StockItem[]> {
    return this.http.post<StockItem[]>(`${this.base}/getByIds.php`, ids);
  }

  // Get Stock Item by Code
  getStockItemByCode(code: string): Observable<StockItem> {
    return this.http.get<StockItem>(`${this.base}/getByCode.php?code=${code}`);
  }

  // Search Stock Items
  searchStockItems(query: string): Observable<StockItem[]> {
    return this.http.get<StockItem[]>(`${this.base}/search.php?query=${query}`);
  }

  // Update Stock Item
  updateStockItem(stockItem: StockItem): Observable<{ stockItem: StockItem; message: string }> {
    return this.http.post<{ stockItem: StockItem; message: string }>(
      `${this.base}/update.php`,
      stockItem
    );
  }

  // Adjust Stock Quantity
  adjustStock(stockItemId: number, quantity: number): Observable<StockItem> {
    return this.http.post<StockItem>(`${this.base}/adjustStock.php`, {
      stockItemId,
      stockValue: quantity,
    });
  }

  // Delete Stock Item
  removeStockItem(id: number): void {
    this.http.post<void>(`${this.base}/remove.php`, { id }).subscribe(() => {
      this.getAllStockItems();
      toast('Stock item deleted successfully', TOAST.success);
    });
  }

  // Get Stock Counts/Statistics
  getStockCounts(): Observable<any[]> {
    return this.http.get<any[]>(`${this.base}/counts.php`);
  }

  // Get Low Stock Items
  getLowStockItems(): Observable<StockItem[]> {
    return this.http.get<StockItem[]>(`${this.base}/lowStock.php`);
  }

  // Get Stock Levels
  getStockLevels(): Observable<any[]> {
    return this.http.get<any[]>(`${this.base}/stockLevels.php`);
  }

  // ========== STOCK TYPE OPERATIONS ==========

  // Get all Stock Types
  getAllStockTypes(): void {
    this.http
      .get<StockType[]>(`${this.stockTypeBase}/list.php`)
      .subscribe((data) => {
        if (Array.isArray(data)) {
          this.stockTypeList.next(data);
        }
      });
  }

  // Get all Stock Types as Observable
  getStockTypes(): Observable<StockType[]> {
    return this.http.get<StockType[]>(`${this.stockTypeBase}/list.php`);
  }

  // Get Stock Type by ID
  getStockTypeById(id: number): Observable<StockType> {
    return this.http.get<StockType>(`${this.stockTypeBase}/getById.php?id=${id}`);
  }

  // Add Stock Type
  addStockType(stockType: StockType): Observable<StockType> {
    return this.http.post<StockType>(`${this.stockTypeBase}/add.php`, stockType);
  }

  // Update Stock Type
  updateStockType(stockType: StockType): Observable<StockType> {
    return this.http.post<StockType>(`${this.stockTypeBase}/update.php`, stockType);
  }

  // Delete Stock Type
  removeStockType(id: number): void {
    this.http.post<void>(`${this.stockTypeBase}/remove.php`, { id }).subscribe(() => {
      this.getAllStockTypes();
      toast('Stock type deleted successfully', TOAST.success);
    });
  }

  // ========== UTILITY METHODS ==========

  // Download functionality
  download(url: string, filename: string): void {
    this.http
      .get<Blob>(url, { responseType: 'blob' as 'json' })
      .subscribe((response) => {
        console.log(response);
        let dataType = response.type;
        let binaryData = [];
        binaryData.push(response);
        let downloadLink = document.createElement('a');
        downloadLink.href = window.URL.createObjectURL(
          new Blob(binaryData, { type: dataType })
        );
        if (filename) downloadLink.setAttribute('download', filename);
        document.body.appendChild(downloadLink);
        downloadLink.click();
      });
  }
}

export interface IStockItemResponse {
  message: string;
  id: number;
  stockItem: StockItem;
}

export interface IStockTypeResponse {
  message: string;
  id: number;
  stockType: StockType;
}
