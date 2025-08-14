// src/models/AssetType.ts

import { Asset } from "./Asset";
import { StockItem } from "./StockItem";

export interface StockType {
  categoryName?: string;
  id: number;
  code: string;
  categoryId: number;
  name: string;
  imageUrl:string ;
  size:string ;
  status: 'active' | 'inactive';
  createdDate?: string; // ISO datetime string, e.g. '2025-04-21T10:00:00Z'
  createdBy?:string ;
  lastUpdatedDate?: string; // ISO datetime string
  lastUpdatedBy?:string ;

  assets?: StockItem[]; // for import
}

export function initAssetType(name = '', code = '', categoryId = 0): StockType {
  return {
    id: 0,
    code,
    categoryId,
    name,
    imageUrl: '',
    status: 'active',
    size: '',
  };
}
