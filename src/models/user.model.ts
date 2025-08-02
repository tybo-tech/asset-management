export interface UserShift {
  Type: string;
  ShiftId: string;
  UserId: string;
  ShiftDate: string;
  StartTime: string;
  EndTime: string;
  CreateDate: string;
  CreateUserId: string;
  Status: string;
  Notes: string;
  Price: number;
  TotalPrice: number;
}
export interface User {
  UserId: string;
  CompanyId: string;
  ParentCompanyId: string;
  UserType: string;
  Name: string;
  Surname: string;
  Email: string;
  PhoneNumber: string;
  Password: string;
  Dp: string;
  CreateDate: string;
  CreateUserId: string;
  ModifyDate: string;
  ModifyUserId: string;
  StatusId: number;
  UserToken: string;
  AddressLineHome: string;
  AddressUrlHome: string;
  AddressLineWork: string;
  AddressUrlWork: string;
  ReferralCode: string;
  ParentReferralCode: string;
  Measurements: any[];
  Metadata: {
    Source: string;
  };

  BuildingType: string;
  Suburb: string;
  City: string;
  PostalCode: string;
  CompanyName: string;
  AddressLine2: string;
  SaveMyDetails: string;
}

export function initUser(userType: string) {
  const user: User = {
    UserId: '',
    Name: '',
    Email: '',
    PhoneNumber: '',
    Password: '',
    AddressLineHome: '',
    City: '',
    PostalCode: '',
    Measurements: [],
    AddressLine2: '',
    BuildingType: '',
    CompanyName: '',
    SaveMyDetails: 'Yes',
    Suburb: '',
    AddressLineWork: '',
    AddressUrlHome: '',
    AddressUrlWork: '',
    CompanyId: '',
    CreateDate: '',
    CreateUserId: '',
    Dp: '',
    ModifyDate: '',
    ModifyUserId: '',
    ParentCompanyId: '',
    ParentReferralCode: '',
    ReferralCode: '',
    StatusId: 1,
    Surname: '',
    UserToken: '',
    UserType: userType,
    Metadata: { Source: 'Online' },
  };
  return user;
}

export const UserStatus = {
  1: 'Active',
  2: 'Inactive',
  3: 'Deleted',
};

export const UserTypes = {
  Admin: 'Admin',
  Resident: 'Resident',
};

export const UserTypesOptions = [UserTypes.Admin, UserTypes.Resident];
