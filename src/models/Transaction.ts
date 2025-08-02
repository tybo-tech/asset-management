import { getId } from 'src/app/functions';
import { Asset, AssetStatus } from './Asset';
import { User } from './user.model';
import { Category } from './Category';

export interface Transaction {
  slug: string;
  id: number;
  assetId: number; // Foreign key to Asset
  transactionType: TransactionType;
  quantity?: number;
  transactionDate: string; // ISO date string
  status: AssetStatus; // Status of the transaction
  createdDate: string; // ISO date string
  createdBy?: string;
  lastUpdatedDate?: string; // ISO date string
  lastUpdatedBy?: string;
  metadata: TransactionMetadata;
  asset?: Asset;
  creator?: User;
  category?: Category;
}

export type TransactionType =
  | 'restock'
  | 'usage'
  | 'damaged'
  | 'stock-adjustment';

export interface IComment {
  comment: string;
  createdBy: string;
  createdDate: string;
}
export function initComment(createdBy: string, comment: string): IComment {
  return {
    comment,
    createdBy,
    createdDate: new Date().toISOString(),
  };
}

export function initTransaction(): Transaction {
  return {
    id: 0,
    assetId: 0,
    transactionType: 'restock',
    quantity: undefined,
    transactionDate: new Date().toISOString(),
    status: 'pending',
    createdDate: '',
    createdBy: '',
    lastUpdatedDate: '',
    lastUpdatedBy: '',
    slug: getId(),
    metadata: {
      reasonCode: '',
      requestedBy: '',
      roomId: 0,
      requestedById: 0,
      room: '',
      comments: [],
    },
  };
}
export interface TransactionMetadata {
  supplierId?: number;
  supplierName?: string;
  condition?: string;
  reasonCode: string;
  roomId?: number;
  room?: string;
  requestedById?: number;
  requestedBy?: string;
  comments: IComment[];
  description?: string;
}
export interface TransactionDetail {
  transactionId: number;
  transactionType: 'restock' | 'usage' | 'damaged';
  quantity: number;
  transactionDate: string;
  status: 'pending' | 'completed' | 'cancelled';
  createdBy: string;
  lastUpdatedBy: string;
  assetName: string;
  assetCode: string;
  categoryName: string;
  metadata: TransactionMetadata;
  createdByName?: string;
}

export const REASON_CODES = {
  Receiving: [
    'Restock',
    'Return',
    'Transfer',
    'Reversal of duplication',
    'Reversal of stock adjustment',
    'Reversal of stock take',
    'Reversal due to error',
    'Other',
  ],

  IssuingOut: [
    'Replacement (Broken)',
    'Replacement (Damaged)',
    'Replacement (Stolen)',
    'New Allocation',
    'Reversal of duplication',
    'Reversal of stock adjustment',
    'Reversal of stock take',
    'Reversal due to error',
    'Other',
  ],
};

export const ASSET_CONDITIONS = [
  'New',
  'Used',
  'Good',
  'Fair',
  'Poor',
  'Damaged',
  'Broken',
  'Other',
];

export interface ITransactionFilter {
  startDate: string;
  endDate: string;
  category: string;
  location: string;
  status: string;
}
