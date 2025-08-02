export interface Requisition {
  id?: number;
  requestNumber: string;
  site: number;
  requestedBy: string;
  type: 'stock' | 'purchase';
  status: 'pending' | 'approved' | 'rejected' | 'completed';
  createdDate?: string;
  lastUpdatedDate?: string;
  approvedBy?: string | null;
  items: RequisitionItem[];
  metadata : {
    notes: string
  }
}

export interface RequisitionItem {
  id?: number;
  requisitionId: number;
  itemType: 'asset' | 'custom';
  assetId?: number | null;
  description: string;
  jobDetails?: string;
  assetName?: string;
  quantity: number;
  availability?: 'yes' | 'no' | null;
  status: 'pending' | 'approved' | 'rejected';
  roomId: number;
}

export function initRequisition(): Requisition {
  return {
    requestNumber: '',
    site: 0,
    requestedBy: '',
    type: 'stock',
    status: 'pending',
    items: [],
    metadata: {
      notes: ''
    }
  };
}

export function initRequisitionItem(): RequisitionItem {
  return {
    requisitionId: 0,
    itemType: 'asset',
    description: '',
    quantity: 0,
    status: 'pending',
    roomId: 0,
  };
}
