import { getId } from 'src/app/functions';
import { AssetType } from './AssetType';

export interface Category {

  id: number;
  code: string;
  name: string;
  imageUrl?: string;
  slug: string;
  status: 'active' | 'inactive';
  createdDate: string; // ISO date string
  createdBy?: string;
  lastUpdatedDate?: string; // ISO date string
  lastUpdatedBy?: string;

  // import
  assetTypes?: AssetType[]; // for import
}

export function initCategory(name = '', code=''): Category {
  return {
    id: 0,
    code,
    name,
    imageUrl: '',
    slug: getId(),
    status: 'active',
    createdDate: '',
    createdBy: '',
    lastUpdatedDate: '',
    lastUpdatedBy: '',
  };
}
