import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { TOAST, toast } from 'src/app/functions';
import { Asset, AssetListParams, initAssetListParams } from 'src/models/Asset';
import { StockItem } from 'src/models/StockItem';
import { StockItemService } from './StockItemService';
import { API } from 'src/app/constants';

@Injectable({
  providedIn: 'root',
})
export class AssetService {
  private readonly base = `${API}/asset`;
  private assetList = new BehaviorSubject<Asset[]>([]);
  $assetList = this.assetList.asObservable();

  constructor(
    private http: HttpClient,
    private router: Router,
    private stockItemService: StockItemService
  ) {}

  // ========== LEGACY ASSET METHODS (for backward compatibility) ==========
  // These methods delegate to StockItemService for the actual operations

  // Create
  add(asset: Asset): Observable<Asset> {
    // Convert Asset to StockItem and delegate
    const stockItem: StockItem = this.assetToStockItem(asset);
    return this.stockItemService.addStockItem(stockItem).pipe(
      map((result: StockItem) => this.stockItemToAsset(result))
    );
  }

  // Read all
  getAll(params: AssetListParams = initAssetListParams()): void {
    // Delegate to StockItemService
    this.stockItemService.getAllStockItems(params);

    // Subscribe to stock items and convert to assets
    this.stockItemService.$stockItemList.subscribe((stockItems: StockItem[]) => {
      const assets: Asset[] = stockItems.map(item => this.stockItemToAsset(item));
      this.assetList.next(assets);
    });
  }

  // Read by ID
  getById(id: number): Observable<Asset> {
    return this.stockItemService.getStockItemById(id).pipe(
      map((stockItem: StockItem) => this.stockItemToAsset(stockItem))
    );
  }

  // Get assets range
  getAssetsRange(ids: number[]): Observable<Asset[]> {
    return this.stockItemService.getStockItemsByIds(ids).pipe(
      map((stockItems: StockItem[]) => stockItems.map(item => this.stockItemToAsset(item)))
    );
  }

  getByCode(assetCode: string): Observable<Asset> {
    return this.stockItemService.getStockItemByCode(assetCode).pipe(
      map((stockItem: StockItem) => this.stockItemToAsset(stockItem))
    );
  }

  // Search
  search(query: string): Observable<Asset[]> {
    return this.stockItemService.searchStockItems(query).pipe(
      map((stockItems: StockItem[]) => stockItems.map(item => this.stockItemToAsset(item)))
    );
  }

  // Update
  update(asset: Asset): Observable<{ asset: Asset; message: string }> {
    const stockItem: StockItem = this.assetToStockItem(asset);
    return this.stockItemService.updateStockItem(stockItem).pipe(
      map((result) => ({
        asset: this.stockItemToAsset(result.stockItem),
        message: result.message
      }))
    );
  }

  // Adjust Stock
  adjustStock(assetId: number, stockValue: number): Observable<Asset> {
    return this.stockItemService.adjustStock(assetId, stockValue).pipe(
      map((stockItem: StockItem) => this.stockItemToAsset(stockItem))
    );
  }

  // Delete
  remove(id: number): void {
    this.stockItemService.removeStockItem(id);
    // Note: The toast notification is handled in StockItemService
  }

  // Download
  download(url: string, filename: string): void {
    this.stockItemService.download(url, filename);
  }

  // ========== CONVERSION METHODS ==========

  private assetToStockItem(asset: Asset): StockItem {
    return {
      id: asset.id,
      code: asset.code,
      name: asset.name,
      categoryId: asset.categoryId,
      categoryName: asset.categoryName,
      stockTypeId: asset.assetTypeId || 0, // Map assetTypeId to stockTypeId
      stockType: asset.assetType,
      imageUrl: asset.imageUrl,
      size: asset.size,
      slug: asset.slug,
      status: asset.status,
      createdDate: asset.createdDate,
      createdBy: asset.createdBy,
      lastUpdatedDate: asset.lastUpdatedDate,
      lastUpdatedBy: asset.lastUpdatedBy,
      stockInHand: asset.stockInHand || 0,
      metadata: asset.metadata,
      transactions: asset.transactions,
      category: asset.category,
    };
  }

  private stockItemToAsset(stockItem: StockItem): Asset {
    return {
      ...stockItem,
      assetType: stockItem.stockType,
      assetTypeId: stockItem.stockTypeId,
      stockInHand: stockItem.stockInHand,
    };
  }
}


export interface IAssetResponse {
  message: string;
  id: number;
  asset: Asset;
}
