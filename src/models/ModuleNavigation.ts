// Module-based Navigation Architecture
// This file defines the new modular navigation system

export interface Module {
  id: string;
  name: string;
  icon: string;
  description: string;
  isActive?: boolean;
}

export interface ModuleFeature {
  id: string;
  name: string;
  description: string;
  moduleId: string;
  url: string;
  icon: string;
  requiredPermissions?: string[];
}

export interface ModuleSideNavGroup {
  id: string;
  name: string;
  icon: string;
  moduleId: string;
  items: ModuleFeature[];
  order: number;
  open?: boolean;
}

// Available Modules
export const MODULES: Module[] = [
  {
    id: 'stock-management',
    name: 'Stock Management',
    icon: 'bi bi-boxes',
    description: 'Manage inventory, quantities, and stock movements'
  },
  {
    id: 'asset-management',
    name: 'Asset Management', 
    icon: 'bi bi-archive',
    description: 'Track movable assets, locations, and transfers'
  }
];

// Module Features
export const MODULE_FEATURES: ModuleFeature[] = [
  // Stock Management Features
  {
    id: 'stock-overview',
    name: 'Overview',
    description: 'Stock management dashboard',
    moduleId: 'stock-management',
    url: '/dashboard',
    icon: 'bi bi-grid',
    requiredPermissions: ['view_stock_overview']
  },
  {
    id: 'list-stock',
    name: 'List Stock Items',
    description: 'View all stock items',
    moduleId: 'stock-management',
    url: '/list-stock',
    icon: 'bi bi-list',
    requiredPermissions: ['view_stock_items']
  },
  {
    id: 'add-stock',
    name: 'Add Stock Item',
    description: 'Add new stock item',
    moduleId: 'stock-management',
    url: '/stock/add',
    icon: 'bi bi-plus-circle',
    requiredPermissions: ['create_stock_items']
  },
  {
    id: 'stock-transactions',
    name: 'Stock Transactions',
    description: 'View stock movements',
    moduleId: 'stock-management',
    url: '/transactions/restock',
    icon: 'bi bi-arrow-left-right',
    requiredPermissions: ['view_stock_transactions']
  },
  {
    id: 'requisitions',
    name: 'Requisitions',
    description: 'Stock requests and approvals',
    moduleId: 'stock-management',
    url: '/list-requisitions',
    icon: 'bi bi-cart',
    requiredPermissions: ['view_requisitions']
  },
  {
    id: 'stocktake',
    name: 'Stock Take',
    description: 'Inventory counting and reconciliation',
    moduleId: 'stock-management',
    url: '/stocktake/all-assets',
    icon: 'bi bi-list-check',
    requiredPermissions: ['perform_stocktake']
  },

  // Asset Management Features
  {
    id: 'asset-overview',
    name: 'Asset Overview',
    description: 'Asset management dashboard',
    moduleId: 'asset-management',
    url: '/asset-dashboard',
    icon: 'bi bi-grid',
    requiredPermissions: ['view_asset_overview']
  },
  {
    id: 'list-assets',
    name: 'List Assets',
    description: 'View all movable assets',
    moduleId: 'asset-management',
    url: '/assets',
    icon: 'bi bi-list',
    requiredPermissions: ['view_assets']
  },
  {
    id: 'add-asset',
    name: 'Add Asset',
    description: 'Register new asset',
    moduleId: 'asset-management',
    url: '/asset/add',
    icon: 'bi bi-plus-circle',
    requiredPermissions: ['create_assets']
  },
  {
    id: 'asset-transfers',
    name: 'Asset Transfers',
    description: 'Track asset movements between locations',
    moduleId: 'asset-management',
    url: '/asset-transfers',
    icon: 'bi bi-arrow-left-right',
    requiredPermissions: ['manage_asset_transfers']
  },
  {
    id: 'asset-distribution',
    name: 'Asset Distribution',
    description: 'View asset distribution by location',
    moduleId: 'asset-management',
    url: '/asset-distribution',
    icon: 'bi bi-geo-alt',
    requiredPermissions: ['view_asset_distribution']
  }
];

// Shared/Common Features (available in both modules)
export const SHARED_FEATURES: ModuleFeature[] = [
  {
    id: 'categories',
    name: 'Categories',
    description: 'Manage item categories',
    moduleId: 'shared',
    url: '/categories',
    icon: 'bi bi-tags',
    requiredPermissions: ['manage_categories']
  },
  {
    id: 'asset-types',
    name: 'Types',
    description: 'Manage item types',
    moduleId: 'shared',
    url: '/asset-types',
    icon: 'bi bi-tag',
    requiredPermissions: ['manage_types']
  },
  {
    id: 'locations',
    name: 'Locations',
    description: 'Manage locations',
    moduleId: 'shared',
    url: '/locations',
    icon: 'bi bi-geo-alt',
    requiredPermissions: ['manage_locations']
  },
  {
    id: 'suppliers',
    name: 'Suppliers',
    description: 'Manage suppliers',
    moduleId: 'shared',
    url: '/suppliers',
    icon: 'bi bi-truck',
    requiredPermissions: ['manage_suppliers']
  },
  {
    id: 'users',
    name: 'Users',
    description: 'User management',
    moduleId: 'shared',
    url: '/users',
    icon: 'bi bi-people',
    requiredPermissions: ['manage_users']
  },
  {
    id: 'roles',
    name: 'Roles',
    description: 'Role and permission management',
    moduleId: 'shared',
    url: '/roles',
    icon: 'bi bi-lock',
    requiredPermissions: ['manage_roles']
  }
];

// Module Navigation Groups
export const MODULE_NAV_GROUPS: ModuleSideNavGroup[] = [
  // Stock Management Groups
  {
    id: 'stock-operations',
    name: 'Stock Operations',
    icon: 'bi bi-boxes',
    moduleId: 'stock-management',
    order: 1,
    items: [
      MODULE_FEATURES.find(f => f.id === 'stock-overview')!,
      MODULE_FEATURES.find(f => f.id === 'list-stock')!,
      MODULE_FEATURES.find(f => f.id === 'add-stock')!,
    ]
  },
  {
    id: 'stock-movements',
    name: 'Stock Movements',
    icon: 'bi bi-arrow-repeat',
    moduleId: 'stock-management',
    order: 2,
    items: [
      MODULE_FEATURES.find(f => f.id === 'stock-transactions')!,
      MODULE_FEATURES.find(f => f.id === 'requisitions')!,
      MODULE_FEATURES.find(f => f.id === 'stocktake')!,
    ]
  },

  // Asset Management Groups
  {
    id: 'asset-operations',
    name: 'Asset Operations',
    icon: 'bi bi-archive',
    moduleId: 'asset-management',
    order: 1,
    items: [
      MODULE_FEATURES.find(f => f.id === 'asset-overview')!,
      MODULE_FEATURES.find(f => f.id === 'list-assets')!,
      MODULE_FEATURES.find(f => f.id === 'add-asset')!,
    ]
  },
  {
    id: 'asset-tracking',
    name: 'Asset Tracking',
    icon: 'bi bi-geo-alt-fill',
    moduleId: 'asset-management',
    order: 2,
    items: [
      MODULE_FEATURES.find(f => f.id === 'asset-transfers')!,
      MODULE_FEATURES.find(f => f.id === 'asset-distribution')!,
    ]
  },

  // Shared Groups (appears in both modules)
  {
    id: 'configuration',
    name: 'Configuration',
    icon: 'bi bi-gear',
    moduleId: 'shared',
    order: 8,
    items: [
      SHARED_FEATURES.find(f => f.id === 'categories')!,
      SHARED_FEATURES.find(f => f.id === 'asset-types')!,
      SHARED_FEATURES.find(f => f.id === 'locations')!,
      SHARED_FEATURES.find(f => f.id === 'suppliers')!,
    ]
  },
  {
    id: 'administration',
    name: 'Administration',
    icon: 'bi bi-shield-lock',
    moduleId: 'shared',
    order: 9,
    items: [
      SHARED_FEATURES.find(f => f.id === 'users')!,
      SHARED_FEATURES.find(f => f.id === 'roles')!,
    ]
  }
];

// User Module Permissions Interface
export interface UserModuleAccess {
  userId: number;
  moduleId: string;
  isEnabled: boolean;
  permissions: string[];
}

// Module Context Interface for components
export interface ModuleContext {
  currentModule: Module;
  availableModules: Module[];
  navigationGroups: ModuleSideNavGroup[];
  userPermissions: string[];
}
