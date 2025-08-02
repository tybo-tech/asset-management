import { IComment } from './Transaction';

export interface OtherInfo<T> {
  Id: number;
  Name: string;
  Slug?: string;
  ItemType: string;
  ImageUrl: string;
  ParentId: string;
  Notes: string;
  ItemValue: T;
  Status: string;
  Decription: string;
  Rules: string;
  ItemCode: string;
  CreateDate?: string;
  CountProducts?: number;
  Classes?: string[];
  Cover?: { background: string };
  OwnerId: string;
  Children?: OtherInfo<any>[];
}

export function initOtherInfo<T>(
  type: string,
  parentId: string = '1',
  val: T
): OtherInfo<T> {
  return {
    Id: 0,
    Name: '',
    ItemType: type,
    ImageUrl: '',
    ParentId: parentId,
    Notes: '',
    ItemValue: val,
    Status: '',
    Decription: '',
    Rules: '',
    ItemCode: '',
    OwnerId: '',
  };
}

export const OTHER_TYPES = {
  Id: '1',
  Locations: 'Locations',
  LocationTypes: 'LocationTypes',
  Rooms: 'Rooms',
  Tanants: 'Tanants',
  Suppliers: 'Suppliers',
  StockTake: 'StockTake',
  StockTakeComments: 'StockTakeComments',
  AssetTypes: 'AssetTypes',
};
export interface OtherInfoSearchModel {
  ItemType: string;
  ParentId?: string;
  ProductCount?: 'Yes' | 'No';
}
export interface ItemValueSize {
  Name: string;
  Value: string;
  Code: string;
}

//Locations
export interface ILocation {
  Name: string;
  Slug: string;
  AddressLine1: string;
  AddressLine2: string;
  Type: number;
  Floor: string;
  RoomNo: string;
  IsSite: 'Yes' | 'No';
}

export function initLocation(): ILocation {
  return {
    Name: '',
    Slug: '',
    AddressLine1: '',
    AddressLine2: '',
    Type: 0,
    Floor: '',
    RoomNo: '',
    IsSite: 'No',
  };
}

//Rooms

export interface IRoom {
  BuildingName: string;
  Floor: string;
  RoomNo: string;
  Capacity: number;
}

export function initRoom(): IRoom {
  return {
    BuildingName: '',
    Floor: '',
    RoomNo: '',
    Capacity: 1,
  };
}

// Tanants
export interface ITenant {
  Name: string;
  RoomId: number;
  Room: string;
  UserId: string;
  StartDate: string;
  EndDate: string;
}

export function initTenant(): ITenant {
  return {
    Name: '',
    RoomId: 0,
    Room: '',
    UserId: '',
    StartDate: new Date().toISOString(),
    EndDate: new Date().toISOString(),
  };
}

// Suppliers

export interface ISupplier {
  ContactPerson: any;
  AlternateNumber: any;
  Comments: IComment[];
  Name: string;
  Address: string;
  Email: string;
  PhoneNumber: string;
}

// Stock Take

export interface IStockTake {
  AssetId: number;
  AssetName: string;
  AssetCode: string;
  AssetCategoryId: number;
  AssetCategoryName: string;
  LocationId: number;
  LocationName: string;
  Quantity?: number;
  TheoreticalQuantity: number;
  Variance: number;
  Date: string;
  Status: string;
  Comments: IComment[];
}

export function initStockTake(): IStockTake {
  return {
    AssetId: 0,
    AssetName: '',
    AssetCode: '',
    AssetCategoryId: 0,
    AssetCategoryName: '',
    LocationId: 0,
    LocationName: '',
    Quantity: 0,
    TheoreticalQuantity: 0,
    Variance: 0,
    Date: new Date().toISOString(),
    Status: 'pending',
    Comments: [],
  };
}

export function initSupplier(): ISupplier {
  return {
    Name: '',
    Address: '',
    Email: '',
    PhoneNumber: '',
    AlternateNumber: '',
    Comments: [],
    ContactPerson: '',
  };
}
