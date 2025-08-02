import { getId } from 'src/app/functions';
import { Category } from './Category';
import { Transaction } from './Transaction';

export interface Asset {
  assetType?: string;
  category?: Category;
  id: number;
  code: string;
  name: string;
  categoryId: number; // Foreign key to Category
  categoryName?: string;
  imageUrl?: string;
  slug: string;
  status: AssetStatus;
  createdDate: string; // ISO date string
  createdBy?: string;
  lastUpdatedDate?: string; // ISO date string
  lastUpdatedBy?: string;
  stockInHand?: number;
  metadata: AssetMetadata;
  transactions?: Transaction[];
  size?: string;
  assetTypeId?: number;
}
export type AssetStatus =
  | 'pending'
  | 'In Progress'
  | 'Approved'
  | 'Rejected'
  | 'Cancelled'
  | 'Completed';
  
 export const ASSET_STATUS: AssetStatus[] = [
    'pending',
    'In Progress',
    'Approved',
    'Rejected',
    'Cancelled',
    'Completed',
  ];

export interface AssetMetadata {
  assetType?: string;
  minimumStockAlert?: number;
  serialNumber: string;
  supplierId: number;
  supplierName: string;
}
export interface AssetListParams {
  category?: string;
  orderBy?: string;
  order?: string;
  limit?: number;
  offset?: number;
}
export function initAssetListParams(): AssetListParams {
  return {
    category: '',
    orderBy: 'createdDate',
    order: 'DESC',
    limit: 10000,
    offset: 0,
  };
}
export function initAssetMetadata(): AssetMetadata {
  return {
    serialNumber: '',
    supplierId: 0,
    supplierName: '',
  };
}
export function initAsset(name = '', code = ''): Asset {
  return {
    id: 0,
    stockInHand: undefined,
    code,
    name,
    categoryId: 0,
    imageUrl: '',
    status: 'Completed',
    createdDate: '',
    createdBy: '',
    lastUpdatedDate: '',
    lastUpdatedBy: '',
    assetTypeId: 0,
    categoryName: '',
    size: '',
    slug: getId(),
    metadata: initAssetMetadata(),
  };
}
