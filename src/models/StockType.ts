import { getId } from 'src/app/functions';

export interface StockType {
  id: number;
  code: string;
  name: string;
  categoryId: number;
  categoryName?: string;
  imageUrl?: string;
  size?: string;
  status: StockTypeStatus;
  createdDate?: string;
  createdBy?: string;
  lastUpdatedDate?: string;
  lastUpdatedBy?: string;
  metadata?: any;
}

export type StockTypeStatus = 'active' | 'inactive' | 'discontinued';

export const STOCK_TYPE_STATUS: StockTypeStatus[] = [
  'active',
  'inactive',
  'discontinued',
];

export interface StockTypeListParams {
  category?: string | number;
  orderBy?: string;
  order?: string;
  limit?: number;
  offset?: number;
}

export function initStockTypeListParams(): StockTypeListParams {
  return {
    category: '',
    orderBy: 'name',
    order: 'ASC',
    limit: 10000,
    offset: 0,
  };
}

export function initStockType(name = '', code = ''): StockType {
  return {
    id: 0,
    code,
    name,
    categoryId: 0,
    categoryName: '',
    imageUrl: '',
    size: '',
    status: 'active',
    createdDate: '',
    createdBy: '',
    lastUpdatedDate: '',
    lastUpdatedBy: '',
    metadata: {},
  };
}
