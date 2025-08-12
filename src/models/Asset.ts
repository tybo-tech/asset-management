import { getId } from 'src/app/functions';
import { Category } from './Category';
import { Transaction } from './Transaction';
import {
  StockItem,
  StockItemStatus,
  StockItemMetadata,
  StockItemListParams,
  STOCK_ITEM_STATUS,
  initStockItemListParams,
  initStockItemMetadata,
  initStockItem
} from './StockItem';

// Legacy Asset interface - now extends StockItem for backward compatibility
export interface Asset extends StockItem {
  assetType?: string;
  assetTypeId?: number;
}

// Legacy types that map to StockItem types
export type AssetStatus = StockItemStatus;
export const ASSET_STATUS = STOCK_ITEM_STATUS;
export interface AssetMetadata extends StockItemMetadata {
  assetType?: string;
}
export interface AssetListParams extends StockItemListParams {}

// Legacy functions that delegate to StockItem functions
export function initAssetListParams(): AssetListParams {
  return initStockItemListParams();
}

export function initAssetMetadata(): AssetMetadata {
  return {
    ...initStockItemMetadata(),
    assetType: '',
  };
}

export function initAsset(name = '', code = ''): Asset {
  return {
    ...initStockItem(name, code),
    assetType: '',
    assetTypeId: 0,
  };
}
