// Enhanced Asset Model for Phase 2 - Aligns with Lodgistics Specification
import { StockItem } from './StockItem';

/**
 * Asset Type (Parent) - represents the category/type of asset
 */
export interface AssetType {
  id: number;
  name: string; // e.g., "Samsung 40\" LED TV"
  categoryId: number;
  categoryName?: string;
  description?: string;
  imageUrl?: string;
  createdDate: string;
  createdBy?: string;
  isActive: boolean;
}

/**
 * Asset Movement Status according to specification
 */
export type AssetMovementStatus =
  | 'in_grv'           // GRV process
  | 'in_store'         // In storage facility
  | 'in_room'          // Assigned to room
  | 'in_maintenance'   // Under maintenance
  | 'disposed'         // Disposed/retired
  | 'in_transit';      // Being moved

/**
 * Asset Condition as per specification
 */
export type AssetCondition =
  | 'new'
  | 'good'
  | 'fair'
  | 'damaged'
  | 'needs_repair';

/**
 * Movement Reason Codes (Admin configurable)
 */
export type MovementReasonCode =
  | 'initial_assignment'
  | 'transfer'
  | 'maintenance_required'
  | 'maintenance_complete'
  | 'disposal'
  | 'returned_to_store'
  | 'room_change';

/**
 * Individual Asset (Child) - extends StockItem for compatibility
 */
export interface IndividualAsset extends StockItem {
  // Parent reference
  assetTypeId: number;
  assetType?: AssetType;

  // Unique identifiers
  assetCode: string;          // Unique asset code
  serialNumber?: string;      // Optional serial number

  // Financial & Warranty
  purchaseDate?: string;      // ISO date string
  warrantDate?: string;       // ISO date string
  cost?: number;              // Purchase cost

  // Location & Status
  currentRoomId?: number;     // Current room assignment
  currentRoomName?: string;   // Room name for display
  movementStatus: AssetMovementStatus;
  condition: AssetCondition;

  // Maintenance
  maintenanceNotes?: string;  // Notes when in maintenance
  maintenanceStartDate?: string; // When maintenance started

  // Disposal
  disposalDate?: string;      // When disposed
  disposalReason?: string;    // Reason for disposal
  disposalBy?: string;        // User who disposed

  // Movement history
  movements?: AssetMovement[];
}

/**
 * Asset Movement Record - tracks all movements
 */
export interface AssetMovement {
  id: number;
  assetId: number;
  fromLocationId?: number;
  fromLocationName?: string;
  toLocationId?: number;
  toLocationName?: string;
  movementDate: string;       // ISO date string
  userId: number;
  userName?: string;
  reasonCode: MovementReasonCode;
  notes?: string;
  createdDate: string;
}

/**
 * Asset Dashboard Statistics
 */
export interface AssetStatistics {
  totalAssets: number;
  activeAssets: number;
  inMaintenanceAssets: number;
  disposedAssets: number;
  warrantyExpiringSoon: number; // Next 30 days
  lowStockAssets: number;

  // By status breakdown
  statusBreakdown: {
    status: AssetMovementStatus;
    count: number;
  }[];

  // By condition breakdown
  conditionBreakdown: {
    condition: AssetCondition;
    count: number;
  }[];
}

/**
 * Asset Search and Filter Parameters
 */
export interface AssetSearchParams {
  query?: string;
  categoryId?: number;
  assetTypeId?: number;
  serialNumber?: string;
  roomId?: number;
  condition?: AssetCondition;
  movementStatus?: AssetMovementStatus;
  warrantyExpiryDays?: number; // Filter by warranty expiring within X days
  dateCreatedFrom?: string;
  dateCreatedTo?: string;
  pageSize?: number;
  pageNumber?: number;
}

/**
 * Warranty Alert Data
 */
export interface WarrantyAlert {
  assetId: number;
  assetCode: string;
  assetName: string;
  serialNumber?: string;
  warrantyDate: string;
  daysUntilExpiry: number;
  currentRoomName?: string;
}

// Initialize functions
export function initAssetSearchParams(): AssetSearchParams {
  return {
    pageSize: 20,
    pageNumber: 1
  };
}

export function initIndividualAsset(): IndividualAsset {
  return {
    id: 0,
    code: '',
    name: '',
    categoryId: 0,
    stockTypeId: 0,
    slug: '',
    status: 'active',
    createdDate: new Date().toISOString(),
    stockInHand: 1,
    metadata: {},

    // Asset-specific fields
    assetTypeId: 0,
    assetCode: '',
    movementStatus: 'in_grv',
    condition: 'new',
    movements: []
  };
}

// Legacy compatibility - map to StockItem
export type Asset = IndividualAsset;
export const ASSET_STATUS = ['active', 'inactive', 'pending', 'discontinued', 'out_of_stock'] as const;
export type AssetStatus = typeof ASSET_STATUS[number];
