export interface SideNav {
  name: string;
  url: string;
  icon: string;
}
export interface SideNavGroup {
  name: string;
  icon: string;
  items: SideNav[];
  open?: boolean;
}

export const SIDE_NAV_GROUPS: SideNavGroup[] = [
  {
    name: 'Stock Management',
    icon: 'bi bi-box',
    items: [
      { name: 'Overview', url: '/dashboard', icon: 'bi bi-grid' },
      { name: 'List Stock', url: '/list-stock', icon: 'bi bi-list' },
      { name: 'Add Stock', url: '/stock/add', icon: 'bi bi-plus-circle' },
    ],
  },
  {
    name: 'Asset Management',
    icon: 'bi bi-box',
    items: [
      { name: 'List Assets', url: '/assets', icon: 'bi bi-list' },
      { name: 'Add Asset', url: '/asset/add', icon: 'bi bi-plus-circle' },
    ],
  },
  {
    name: 'Categories',
    icon: 'bi bi-tags',
    items: [
      { name: 'List Categories', url: '/categories', icon: 'bi bi-list' },
      { name: 'Add Category', url: '/category/add', icon: 'bi bi-plus-circle' },
    ],
  },
  {
    name: 'Asset Types',
    icon: 'bi bi-tag',
    items: [
      { name: 'List Asset Types', url: '/asset-types', icon: 'bi bi-list' },
      {
        name: 'Add Asset Type',
        url: '/asset-types/add',
        icon: 'bi bi-plus-circle',
      },
    ],
  },
  {
    name: 'Users',
    icon: 'bi bi-people',
    items: [
      { name: 'Manage User Roles', url: '/roles', icon: 'bi bi-lock' },
      { name: 'List Users', url: '/users', icon: 'bi bi-list' },
      { name: 'Add User', url: '/user/add', icon: 'bi bi-plus-circle' },
    ],
  },
  {
    name: 'Locations',
    icon: 'bi bi-geo-alt',
    items: [
      { name: 'List Locations', url: '/locations', icon: 'bi bi-list' },
      { name: 'Add Location', url: '/location/add', icon: 'bi bi-plus-circle' },
    ],
  },
  {
    name: 'Suppliers',
    icon: 'bi bi-truck',
    items: [
      { name: 'List Suppliers', url: '/suppliers', icon: 'bi bi-list' },
      { name: 'Add Supplier', url: '/supplier/add', icon: 'bi bi-plus-circle' },
    ],
  },
  {
    name: 'Requisitions',
    icon: 'bi bi-cart',
    items: [
      {
        name: 'List Requisitions',
        url: '/list-requisitions',
        icon: 'bi bi-list',
      },
      {
        name: 'Add Requisition',
        url: '/requisition/add',
        icon: 'bi bi-plus-circle',
      },
    ],
  },
  {
    name: 'Stocktake',
    icon: 'bi bi-list-check',
    items: [
      {
        name: 'All Assets',
        url: '/stocktake/all-assets',
        icon: 'bi bi-archive',
      },
      {
        name: 'By Category',
        url: '/init-stocktake/category',
        icon: 'bi bi-tags',
      },
      {
        name: 'Reports',
        url: '/select-stocktake-to-review',
        icon: 'bi bi-clipboard-check',
      },
    ],
  },
  {
    name: 'Reports',
    icon: 'bi bi-bar-chart',
    items: [
      {
        name: 'Restock History',
        url: '/transactions/restock',
        icon: 'bi bi-arrow-repeat',
      },
      {
        name: 'Dispatch History',
        url: '/transactions/usage',
        icon: 'bi bi-arrow-down',
      },
    ],
  },
];

export const FEATURES = [
  { id: 1, name: 'Overview', description: 'Overview of assets' },
  { id: 2, name: 'List Assets (Stock)', description: 'View all assets in the system' },
  { id: 3, name: 'Add Asset', description: 'Add Asset to the system' },
  { id: 4, name: 'List Categories', description: 'View all categories' },
  { id: 5, name: 'Add Category', description: 'Add a new category' },
  { id: 6, name: 'List Asset Types', description: 'View all asset types' },
  { id: 7, name: 'Add Asset Type', description: 'Add a new asset type' },
  { id: 8, name: 'Manage User Roles', description: 'Manage user roles' },
  { id: 9, name: 'List Users', description: 'View all users' },
  { id: 10, name: 'Add User', description: 'Add a new user' },
  { id: 11, name: 'List Locations', description: 'View all locations' },
  { id: 12, name: 'Add Location', description: 'Add a new location' },
  { id: 13, name: 'List Suppliers', description: 'View all suppliers' },
  { id: 14, name: 'Add Supplier', description: 'Add a new supplier' },
  { id: 15, name: 'List Requisitions', description: 'View all requisitions' },
  { id: 16, name: 'Add Requisition', description: 'Add a new requisition' },
  { id: 17, name: 'All Assets', description: 'View all assets for stocktake' },
  {
    id: 18,
    name: 'By Category',
    description: 'View assets by category for stocktake',
  },
  { id: 19, name: 'Reports', description: 'View stocktake reports' },
  { id: 20, name: 'Restock History', description: 'View restock history' },
  { id: 21, name: 'Dispatch History', description: 'View dispatch history' },
  // Export assets
  { id: 22, name: 'Export Assets', description: 'Export assets to CSV' },
  { id: 23, name: 'List Assets', description: 'View all assets in the system' },
];

export const FEATURE_NAMES = {
  overview: 'Overview',
  listStock: 'List Assets (Stock)',
  listAssets: 'List Assets',
  addAsset: 'Add Asset',
  listCategories: 'List Categories',
  addCategory: 'Add Category',
  listAssetTypes: 'List Asset Types',
  addAssetType: 'Add Asset Type',
  manageUserRoles: 'Manage User Roles',
  listUsers: 'List Users',
  addUser: 'Add User',
  listLocations: 'List Locations',
  addLocation: 'Add Location',
  listSuppliers: 'List Suppliers',
  addSupplier: 'Add Supplier',
  listRequisitions: 'List Requisitions',
  addRequisition: 'Add Requisition',
  allAssets: 'All Assets',
  byCategory: 'By Category',
  reports: 'Reports',
  restockHistory: 'Restock History',
  dispatchHistory: 'Dispatch History',
  exportAssets: 'Export Assets',
  stocktake: 'Stocktake',
};
