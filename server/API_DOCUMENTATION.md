# 📋 **Asset Management API Documentation**

*Generated: August 12, 2025*

## 🎯 **Project Overview**

This is an Asset Management System backend API built with PHP. The system is currently undergoing a refactoring process to rename "Asset" to "StockItem" to better reflect the bulk stock management nature of the application, preparing for a future Phase 2 that will handle serialized assets.

---

## 📁 **Database Structure & Migration Status**

### **Current Tables (Pre-Migration)**
- `Asset` → **To be renamed to** `StockItem`
- `AssetType` → **To be renamed to** `StockType`
- `Transactions` → **Column `assetId` to be renamed to** `stockItemId`

### **Migration Script**
Location: `migrations/2025-08-11-asset-to-stockitem.sql`
- Renames tables and columns for better semantic clarity
- Prepares for future serialized asset management (Phase 2)

---

## 🏗️ **Models Architecture**

### **📦 Stock Management Models**

#### **StockItemRepository** *(NEW - Recommended)*
- **File**: `api/models/StockItemRepository.php`
- **Table**: `StockItem` (renamed from `Asset`)
- **Purpose**: Manages bulk stock items with quantities
- **Key Methods**:
  - `list($category, $orderBy, $order, $limit, $offset)` - Paginated stock listing
  - `getById($id)` - Get stock item with transactions
  - `getByIds($ids)` - Bulk retrieval
  - `getByCode($code)` - Find by code
  - `search($query)` - Text search
  - `add($model)` - Add new stock item
  - `addMany($models)` - Bulk insert (wrapped in transaction)
  - `update($model)` - Update stock item
  - `remove($id)` - Delete stock item
  - `adjustStock($stockItemId, $quantity)` - Stock adjustment
  - `counts()` - Status-based counts
  - `lowStock()` - Items below minimum threshold
  - `stockLevels()` - All stock levels with categories
  - `transactions($stockItemId)` - Get transaction history

#### **Asset** *(LEGACY - To be phased out)*
- **File**: `api/models/Asset.php`
- **Table**: `Asset` (to be renamed)
- **Status**: ⚠️ **Legacy class - should be replaced by StockItemRepository**
- **Same methods as StockItemRepository but uses old table names**

#### **StockType** *(NEW - Recommended)*
- **File**: `api/models/StockType.php`
- **Table**: `StockType`
- **Purpose**: Categories/types of stock items
- **Methods**:
  - `list()` - All stock types
  - `getById($id)` - Single stock type
  - `add($model)` - Create stock type
  - `update($model)` - Update stock type
  - `remove($id)` - Delete stock type

#### **AssetType** *(LEGACY)*
- **File**: `api/models/AssetType.php`
- **Table**: `AssetType`
- **Status**: ⚠️ **Legacy - will be used for future serialized assets**

#### **StockTransaction** *(NEW - Recommended)*
- **File**: `api/models/StockTransaction.php`
- **Table**: `Transactions` (with `stockItemId` column)
- **Purpose**: Stock movement transactions
- **Methods**:
  - `list()` - All transactions
  - `getById($id)` - Single transaction
  - `add($model)` - Record transaction
  - `update($model)` - Update transaction
  - `remove($id)` - Delete transaction

#### **Transaction** *(LEGACY)*
- **File**: `api/models/Transaction.php`
- **Status**: ⚠️ **Legacy - uses old `assetId` column**

---

### **🏢 Supporting Models**

#### **Category**
- **File**: `api/models/Category.php`
- **Table**: `Category`
- **Purpose**: Organizational categories for stock items
- **Methods**: `list()`, `getById()`, `add()`, `update()`, `getByStatus()`, `getByCode()`, `remove()`

#### **User**
- **File**: `api/models/User.php`
- **Table**: `user`
- **Purpose**: User management and authentication
- **Key Methods**: `add()`, `update()`, `getByEmail()`, `getById()`, `list()`, `remove()`, `getUserWithFeatures()`

#### **Roles**
- **File**: `api/models/Roles.php`
- **Table**: `roles`, `role_features`
- **Purpose**: Role-based access control
- **Methods**: `list()`, `add()`, `addFeatureToRole()`, `addFeature()`, `listFeatures()`, `getById()`, `deleteRole()`

#### **Requisition**
- **File**: `api/models/Requisition.php`
- **Table**: `requisitions`
- **Purpose**: Stock request management
- **Methods**: `list()`, `getById()`, `add()`, `update()`, `updateStatus()`, `updateQuantity()`, `updateItem()`, `getByStatus()`

#### **Statistics**
- **File**: `api/models/Statistics.php`
- **Purpose**: Dashboard and reporting statistics
- **Methods**: `getCounts()`, `getTransactionsByMonth()`, `getTransactionsByDay()`

#### **UserStatistics**
- **File**: `api/models/UserStatistics.php`
- **Purpose**: User-specific statistics and metrics

---

### **🏭 Movable Assets (Separate Module)**

#### **MovableAsset**
- **File**: `api/models/MovableAsset.php`
- **Purpose**: Handles location-based asset tracking (different from stock items)
- **Key Methods**:
  - `addAssetType()`, `updateAssetType()`, `listAssetTypes()`, `getAssetTypeById()`
  - `getLocations()`, `getLocationDistribution()`
  - `transferAsset()`, `getTransferLogs()`
  - `reconcileDistribution()`, `validateConsistency()`

---

### **📊 Other Info Management**

#### **BaseOtherInfo**
- **File**: `api/models/BaseOtherInfo.php`
- **Purpose**: Base class for flexible data management

#### **QueryOtherInfo**
- **File**: `api/models/QueryOtherInfo.php`
- **Purpose**: Query operations for other info data
- **Includes**: `SearchModel` and `Filter` classes

#### **MutateOtherInfo**
- **File**: `api/models/MutateOtherInfo.php`
- **Purpose**: Create/Update operations for other info data

#### **OtherInfoStatistics**
- **File**: `api/models/OtherInfoStatistics.php`
- **Purpose**: Statistics for other info data

---

## 🌐 **API Endpoints Structure**

### **📦 Stock Management APIs**

#### **`/api/asset/`** *(Legacy - To be renamed to `/api/stock-items/`)*
- `list.php` - GET - List stock items with pagination
- `getById.php` - GET - Single stock item with transactions
- `getByIds.php` - POST - Multiple stock items
- `getByCode.php` - GET - Find by code
- `getByStatus.php` - GET - Filter by status
- `search.php` - GET - Search stock items
- `add.php` - POST - Create stock item
- `add-many.php` - POST - Bulk create
- `update.php` - PUT - Update stock item
- `remove.php` - DELETE - Delete stock item
- `adjustStock.php` - POST - Adjust stock levels
- `load.php` - POST - Data loading utility
- `ready.json` - Sample data

#### **`/api/asset-types/`** *(Legacy - To be renamed to `/api/stock-types/`)*
- `list.php` - GET - List stock types
- `getById.php` - GET - Single stock type
- `getByCode.php` - GET - Find by code
- `getByStatus.php` - GET - Filter by status
- `add.php` - POST - Create stock type
- `add-many.php` - POST - Bulk create
- `update.php` - PUT - Update stock type
- `remove.php` - DELETE - Delete stock type

#### **`/api/transaction/`**
- Transaction management endpoints
- **Note**: Should be updated to use `stockItemId` instead of `assetId`

---

### **🏢 Supporting APIs**

#### **`/api/category/`**
- `list.php`, `getById.php`, `getByCode.php`, `getByStatus.php`
- `add.php`, `update.php`, `remove.php`

#### **`/api/user/`**
- User management endpoints
- Authentication and authorization

#### **`/api/roles/`**
- Role-based access control
- Feature management

#### **`/api/requisition/`**
- Stock request management
- Status tracking

#### **`/api/counts/`**
- `all.php` - System-wide counts
- `data.php` - Data statistics
- `user.php` - User-specific counts

#### **`/api/other_info/`**
- Flexible data management
- Locations, suppliers, rooms, tenants

#### **`/api/movable-asset/`**
- Location-based asset tracking
- Transfer management
- Distribution reconciliation

---

## 🔄 **Migration Checklist**

### **✅ Completed**
1. Created new `StockItemRepository` class
2. Created new `StockType` class
3. Created new `StockTransaction` class
4. Created migration SQL script

### **🔄 In Progress**
1. Database migration execution
2. API endpoint updates

### **⏳ Pending**
1. Update all API endpoints to use new classes
2. Rename API endpoint folders
3. Update frontend integration
4. Add `X-Module: stock` headers
5. Test migration in staging
6. Phase out legacy classes

### **🚀 Future (Phase 2)**
1. Create dedicated serialized asset tables
2. Implement asset lifecycle tracking
3. Add asset condition management
4. Location and movement history

---

## 📝 **Naming Convention Standards**

### **Database Tables**
- `StockItem` (bulk quantities)
- `StockType` (stock categories)
- `StockTransactions` (stock movements)

### **PHP Classes**
- `StockItemRepository` (main stock operations)
- `StockType` (stock type management)
- `StockTransaction` (transaction management)

### **API Endpoints**
- `/api/stock-items/` (recommended)
- `/api/stock-types/` (recommended)
- `/api/stock-transactions/` (recommended)

### **Column Names**
- `stockItemId` (instead of `assetId`)
- `stockTypeId` (instead of `assetTypeId`)

---

## 🔧 **Configuration Files**

- **Connection**: `api/config/Connection.php`
- **Headers**: `api/config/headers.php`
- **Schema**: `api/schema.sql`
- **Migration**: `migrations/2025-08-11-asset-to-stockitem.sql`

---

## 📋 **Notes**

1. **Legacy Support**: Old `Asset` class still exists for backward compatibility
2. **Transaction Safety**: New `addMany()` methods use database transactions
3. **Error Handling**: Improved null safety in `parseData()` methods
4. **Future-Proof**: Clear separation between stock (bulk) and assets (serialized)
5. **API Versioning**: Consider adding version headers during transition

---

*This documentation reflects the current state during the Stock → Asset refactoring process. Update as migration progresses.*
