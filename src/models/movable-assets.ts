// 🎯 Master asset definition
export interface IAssetType {
  id?: number;
  name: string;
  category?: string;
  description?: string;
  default_value?: number;
  total_quantity?: number;
  metadata?: any;
  created_at?: string;
  updated_at?: string;
}

// 📍 Physical or virtual location
export interface ILocation {
  id?: number;
  name: string;
  building?: string;
  floor?: string;
  metadata?: any;
  created_at?: string;
  updated_at?: string;
}

// 📦 Distribution of assets at locations (summary)
export interface IAssetLocation {
  id?: number;
  asset_type_id: number;
  location_id: number;
  quantity: number;
  last_updated?: string;

  // Optional expanded info
  asset_type?: IAssetType;
  location?: ILocation;
}

// 🔁 Movement of asset types (summary)
export interface IAssetTransfer {
  id?: number;
  asset_type_id: number;
  from_location_id?: number | null;
  to_location_id: number;
  quantity: number;
  reason?: string;
  date?: string;
  done_by?: number;
  metadata?: any;

  // Expanded fields
  asset_type?: IAssetType;
  from_location?: ILocation;
  to_location?: ILocation;
}

// 🔍 Individual serialized asset item
export interface IAssetItem {
  id?: number;
  asset_type_id: number;
  asset_code: string;
  serial_number?: string;
  condition?: string;
  warranty_expiry?: string;
  status?: 'Active' | 'In Maintenance' | 'Disposed';
  current_location_id?: number | null;
  metadata?: any;
  created_at?: string;
  updated_at?: string;

  // Expanded fields
  asset_type?: IAssetType;
  current_location?: ILocation;
}

// 🧾 Movement of individual asset units
export interface IAssetItemTransfer {
  id?: number;
  asset_item_id: number;
  from_location_id?: number | null;
  to_location_id: number;
  reason?: string;
  date?: string;
  done_by?: number;
  metadata?: any;

  // Expanded fields
  asset_item?: IAssetItem;
  from_location?: ILocation;
  to_location?: ILocation;
}
