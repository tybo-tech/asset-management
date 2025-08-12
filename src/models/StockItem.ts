import { getId } from 'src/app/functions';
import { Category } from './Category';
import { Transaction } from './Transaction';

export interface StockItem {
  id: number;
  code: string;
  name: string;
  categoryId: number; // Foreign key to Category
  categoryName?: string;
  stockTypeId: number; // Foreign key to StockType
  stockType?: string; // Joined from StockType table
  imageUrl?: string;
  size?: string;
  slug: string;
  status: StockItemStatus;
  createdDate: string; // ISO date string
  createdBy?: string;
  lastUpdatedDate?: string; // ISO date string
  lastUpdatedBy?: string;
  stockInHand: number;
  metadata: StockItemMetadata;
  transactions?: Transaction[];
  category?: Category;
}

export type StockItemStatus =
  | 'active'
  | 'inactive'
  | 'pending'
  | 'discontinued'
  | 'out_of_stock';

export const STOCK_ITEM_STATUS: StockItemStatus[] = [
  'active',
  'inactive',
  'pending',
  'discontinued',
  'out_of_stock',
];

export interface StockItemMetadata {
  minimumStockAlert?: number;
  serialNumber?: string;
  supplierId?: number;
  supplierName?: string;
  reorderLevel?: number;
  maxStockLevel?: number;
  unitCost?: number;
  description?: string;
  [key: string]: any; // Allow additional metadata properties
}

export interface StockItemListParams {
  category?: string | number;
  orderBy?: string;
  order?: string;
  limit?: number;
  offset?: number;
}

export function initStockItemListParams(): StockItemListParams {
  return {
    category: '',
    orderBy: 'createdDate',
    order: 'DESC',
    limit: 10000,
    offset: 0,
  };
}

export function initStockItemMetadata(): StockItemMetadata {
  return {
    minimumStockAlert: 10,
    serialNumber: '',
    supplierId: 0,
    supplierName: '',
    reorderLevel: 5,
    maxStockLevel: 100,
    unitCost: 0,
    description: '',
  };
}

export function initStockItem(name = '', code = ''): StockItem {
  return {
    id: 0,
    stockInHand: 0,
    code,
    name,
    categoryId: 0,
    stockTypeId: 0,
    imageUrl: '',
    size: '',
    status: 'active',
    createdDate: '',
    createdBy: '',
    lastUpdatedDate: '',
    lastUpdatedBy: '',
    categoryName: '',
    stockType: '',
    slug: getId(),
    metadata: initStockItemMetadata(),
  };
}

// Legacy Asset interface for backward compatibility during migration
export interface Asset extends StockItem {
  assetType?: string;
  assetTypeId?: number;
}

export type AssetStatus = StockItemStatus;
export const ASSET_STATUS = STOCK_ITEM_STATUS;
export interface AssetMetadata extends StockItemMetadata {}
export interface AssetListParams extends StockItemListParams {}
export const initAssetListParams = initStockItemListParams;
export const initAssetMetadata = initStockItemMetadata;
export const initAsset = initStockItem;
