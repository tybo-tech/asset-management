# 📋 **Movable Asset Management - Frontend Documentation**

## 🏗️ **Frontend Architecture Overview**

The movable asset management system follows Angular best practices with a clean component-based architecture:

```
src/
├── models/
│   └── movable-assets.ts          # TypeScript interfaces
├── services/
│   └── movable-asset.service.ts   # HTTP service layer
└── app/movable-assets/asset-type/
    ├── asset-type-list/           # List component
    └── asset-type-form/           # Form component
```

---

## 🎯 **1. Data Models & Interfaces**

### **📁 `src/models/movable-assets.ts`**

```typescript
// 🎯 Master asset definition
export interface IAssetType {
  id?: number;
  name: string;
  category?: string;
  description?: string;
  default_value?: number;
  total_quantity?: number;
  metadata?: any;  // ⭐ Flexible object for custom properties
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

// 🔁 Movement of assets between locations
export interface IAssetTransfer {
  id?: number;
  asset_type_id: number;
  from_location_id?: number | null;
  to_location_id: number;
  quantity: number;
  reason?: string;
  date?: string;
  metadata?: any;
  
  // Optional expanded fields
  asset_type?: IAssetType;
  from_location?: ILocation;
  to_location?: ILocation;
}
```

---

## 🌐 **2. HTTP Service Layer**

### **📁 `src/services/movable-asset.service.ts`**

```typescript
@Injectable({
  providedIn: 'root',
})
export class MovableAssetService {
  private readonly base = `${API}/movable-asset`;

  constructor(private http: HttpClient) {}

  // 🚀 Asset Type CRUD Operations
  
  addAssetType(asset: IAssetType): Observable<IResponse<IAssetType>> {
    return this.http.post<IResponse<IAssetType>>(
      `${this.base}/addAssetType.php`,
      asset
    );
  }

  updateAssetType(asset: IAssetType): Observable<IAssetType> {
    return this.http.put<IAssetType>(`${this.base}/updateAssetType.php`, asset);
  }

  listAssetTypes(): Observable<IAssetType[]> {
    return this.http.get<IAssetType[]>(`${this.base}/listAssetTypes.php`);
  }

  getAssetTypeById(id: number): Observable<IAssetType> {
    return this.http.get<IAssetType>(
      `${this.base}/getAssetTypeById.php?id=${id}`
    );
  }

  // 🔁 Transfer Operations
  
  transferAsset(transfer: IAssetTransfer): Observable<any> {
    return this.http.post<any>(`${this.base}/transferAsset.php`, transfer);
  }

  getTransferLogs(asset_type_id?: number): Observable<IAssetTransfer[]> {
    const url = asset_type_id
      ? `${this.base}/getTransferLogs.php?asset_type_id=${asset_type_id}`
      : `${this.base}/getTransferLogs.php`;
    return this.http.get<IAssetTransfer[]>(url);
  }

  // 📍 Distribution View
  
  getLocationDistribution(asset_type_id: number): Observable<IAssetLocation[]> {
    return this.http.get<IAssetLocation[]>(
      `${this.base}/getLocationDistribution.php?asset_type_id=${asset_type_id}`
    );
  }
}
```

### **🔗 Service Features**
- **Type Safety**: All methods use TypeScript interfaces
- **Observable Pattern**: Reactive programming with RxJS
- **RESTful Design**: Consistent HTTP method usage
- **Error Handling**: Proper error propagation to components
- **Flexible Parameters**: Optional filtering parameters

---

## 📋 **3. Asset Type List Component**

### **📁 `src/app/movable-assets/asset-type/asset-type-list/asset-type-list.component.ts`**

#### **Component Structure**
```typescript
@Component({
  selector: 'app-asset-type-list',
  templateUrl: './asset-type-list.component.html',
  styleUrls: ['./asset-type-list.component.scss'],
})
export class AssetTypeListComponent implements OnInit {
  // 📊 Data Properties
  assetTypes: IAssetType[] = [];
  newItem?: IAssetType;
  
  // 🎛️ State Management
  showAddForm = false;
  showEditForm = false;
  itemToEdit?: IAssetType;
  loading = false;
  searchTerm = '';

  constructor(private movableAssetService: MovableAssetService) {}
}
```

#### **🔄 Lifecycle & Data Management**
```typescript
ngOnInit() {
  this.fetchAssetTypes();
}

fetchAssetTypes() {
  this.loading = true;
  this.movableAssetService.listAssetTypes().subscribe({
    next: (data) => {
      this.assetTypes = data || [];
      this.loading = false;
    },
    error: (err) => {
      console.error('Error fetching asset types:', err);
      this.loading = false;
    },
  });
}
```

#### **🔍 Search & Filtering**
```typescript
// Computed property for real-time filtering
get filteredAssetTypes(): IAssetType[] {
  if (!this.searchTerm.trim()) {
    return this.assetTypes;
  }

  const term = this.searchTerm.toLowerCase();
  return this.assetTypes.filter(asset =>
    asset.name.toLowerCase().includes(term) ||
    asset.category?.toLowerCase().includes(term) ||
    asset.description?.toLowerCase().includes(term)
  );
}
```

#### **🏷️ Metadata Display Logic**
```typescript
// Convert metadata object to display tags
getMetadataTags(metadata: any): string[] {
  if (!metadata) return [];

  try {
    const parsed = typeof metadata === 'string' ? JSON.parse(metadata) : metadata;
    return Object.entries(parsed).map(([key, value]) => `${key}: ${value}`);
  } catch {
    return [];
  }
}
```

#### **📤 CSV Export Functionality**
```typescript
exportToCsv() {
  const csvData = this.filteredAssetTypes.map(asset => ({
    Name: asset.name,
    Category: asset.category,
    Description: asset.description,
    'Default Value': asset.default_value,
    'Total Quantity': asset.total_quantity,
    'Created Date': asset.created_at
  }));

  if (csvData.length === 0) return;

  // Generate CSV content
  const headers = Object.keys(csvData[0]);
  const csvContent = [
    headers.join(','),
    ...csvData.map(row =>
      headers.map(header => {
        const value = (row as any)[header];
        return `"${value || ''}"`;
      }).join(',')
    )
  ].join('\n');

  // Download file
  const blob = new Blob([csvContent], { type: 'text/csv' });
  const url = window.URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `asset-types-${new Date().toISOString().split('T')[0]}.csv`;
  a.click();
  window.URL.revokeObjectURL(url);
}
```

#### **🎛️ Form State Management**
```typescript
// Initialize new item creation
initNewItem() {
  this.showAddForm = true;
  this.showEditForm = false;
  this.itemToEdit = undefined;
  this.newItem = {
    name: '',
    category: '',
    description: '',
    default_value: 0,
    total_quantity: 0,
    metadata: {},
  };
}

// Prepare item for editing
selectItemToEdit(item: IAssetType) {
  this.itemToEdit = { ...item };  // ⭐ Deep copy to avoid mutations
  this.showEditForm = true;
  this.showAddForm = false;
}

// Close form and reset state
closeForm() {
  this.showAddForm = false;
  this.showEditForm = false;
  this.newItem = undefined;
  this.itemToEdit = undefined;
}

// Handle successful save operations
onAssetTypeSaved(assetType: IAssetType) {
  this.fetchAssetTypes();  // Refresh list
  this.closeForm();        // Close form
}
```

### **📁 `asset-type-list.component.html`** - Template Structure

#### **🏗️ Main Container**
```html
<div class="list-container">
  <!-- 📋 Header Section -->
  <div class="title-section">
    <h5 class="w-fit">
      Asset Types
      <span *ngIf="assetTypes.length" class="badge bg-dark">
        {{ assetTypes.length }}
      </span>
    </h5>

    <!-- 🔍 Search & Actions -->
    <div class="d-flex align-items-center">
      <input
        type="text"
        class="form-control me-2"
        placeholder="Search asset types..."
        [(ngModel)]="searchTerm"
        style="width: 250px;"
      />
      <button class="btn btn-primary me-2" (click)="initNewItem()">
        <i class="bi bi-plus-circle"></i>
        Add Asset Type
      </button>
      <button class="btn btn-dark" (click)="exportToCsv()">
        <i class="bi bi-download"></i>
        Export CSV
      </button>
    </div>
  </div>
```

#### **📊 Data Table**
```html
  <!-- 📋 Table Structure -->
  <div class="data-table">
    <!-- Desktop Headers -->
    <div class="table-header" style="grid-template-columns: 2fr 1.5fr 1fr 1fr 1fr 1fr;">
      <div>Name & Description</div>
      <div>Category</div>
      <div>Total Qty</div>
      <div>Default Value</div>
      <div>Status</div>
      <div>Actions</div>
    </div>

    <!-- Data Rows -->
    <div
      class="table-row"
      style="grid-template-columns: 2fr 1.5fr 1fr 1fr 1fr 1fr;"
      *ngFor="let assetType of filteredAssetTypes"
    >
      <!-- Name & Description Column -->
      <div class="mobile-header">Name</div>
      <div>
        <div class="fw-bold">{{ assetType.name }}</div>
        <div class="text-muted" style="font-size: 0.7rem; margin-top: 0.2rem;">
          {{ assetType.description }}
        </div>
        <!-- Metadata Tags -->
        <div *ngIf="assetType.metadata" class="metadata-tags mt-1">
          <span 
            *ngFor="let tag of getMetadataTags(assetType.metadata)" 
            class="badge bg-secondary me-1"
            style="font-size: 0.6rem;">
            {{ tag }}
          </span>
        </div>
      </div>

      <!-- Other columns... -->
      <!-- Actions Column -->
      <div class="action-buttons">
        <button 
          class="btn btn-sm btn-outline-primary me-1" 
          (click)="selectItemToEdit(assetType)"
          title="Edit Asset Type">
          <i class="bi bi-pencil"></i>
        </button>
        <button 
          class="btn btn-sm btn-outline-info me-1" 
          (click)="viewDistribution(assetType)"
          title="View Distribution">
          <i class="bi bi-geo-alt"></i>
        </button>
        <button 
          class="btn btn-sm btn-outline-success" 
          (click)="transferAsset(assetType)"
          title="Transfer Assets">
          <i class="bi bi-arrow-left-right"></i>
        </button>
      </div>
    </div>
  </div>

  <!-- 🚫 Empty State -->
  <div class="text-center mt-3" *ngIf="filteredAssetTypes.length === 0 && !loading">
    <div class="empty-state">
      <i class="bi bi-box-seam" style="font-size: 3rem; color: var(--grey);"></i>
      <p class="mt-2">No asset types found.</p>
      <button class="btn btn-primary" (click)="initNewItem()">
        <i class="bi bi-plus-circle"></i>
        Create First Asset Type
      </button>
    </div>
  </div>
</div>

<!-- 📝 Inline Form Integration -->
<app-asset-type-form
  *ngIf="showAddForm || showEditForm"
  [asset]="showEditForm ? itemToEdit! : newItem!"
  (formSubmitted)="onAssetTypeSaved($event)"
  (onClose)="closeForm()"
/>

<app-loader *ngIf="loading"></app-loader>
```

### **📁 `asset-type-list.component.scss`** - Professional Styling

#### **🎨 Professional Badges & Visual Elements**
```scss
.category-badge {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 0.25rem 0.75rem;
  border-radius: 12px;
  font-size: 0.7rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.quantity-badge {
  background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
  color: white;
  padding: 0.25rem 0.75rem;
  border-radius: 50px;
  font-weight: 700;
  min-width: 40px;
  text-align: center;
  display: inline-block;
}

.value-display {
  color: #27ae60;
  font-weight: 700;
  font-family: 'Courier New', monospace;
}

.status-indicator {
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.7rem;
  font-weight: 600;
  text-transform: uppercase;

  &.status-active {
    background: rgba(39, 174, 96, 0.2);
    color: #27ae60;
    border: 1px solid #27ae60;
  }
}
```

#### **⚡ Interactive Elements**
```scss
.action-buttons {
  display: flex;
  gap: 0.25rem;
  justify-content: flex-end;

  .btn {
    border-radius: 6px;
    padding: 0.375rem 0.5rem;
    transition: all 0.2s ease;

    &:hover {
      transform: translateY(-1px);
      box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    }
  }
}

.table-row {
  transition: all 0.2s ease;
  border-left: 3px solid transparent;

  &:hover {
    background: rgba(116, 75, 162, 0.05) !important;
    border-left-color: #764ba2;
    transform: translateX(2px);
  }
}
```

---

## 📝 **4. Asset Type Form Component**

### **📁 `asset-type-form.component.ts`** - Form Logic

#### **Component Structure**
```typescript
interface MetadataEntry {
  key: string;
  value: string;
}

@Component({
  selector: 'app-asset-type-form',
  templateUrl: './asset-type-form.component.html',
  styleUrls: ['./asset-type-form.component.scss'],
})
export class AssetTypeFormComponent implements OnInit {
  @Input({ required: true }) asset!: IAssetType;
  @Output() formSubmitted = new EventEmitter<IAssetType>();
  @Output() onClose = new EventEmitter<void>();
  
  saving = false;
  metadataEntries: MetadataEntry[] = [];
}
```

#### **🔄 Metadata Management**
```typescript
ngOnInit() {
  this.initializeMetadata();
}

// Convert metadata object to editable entries
initializeMetadata() {
  if (this.asset.metadata) {
    try {
      const metadata = typeof this.asset.metadata === 'string' 
        ? JSON.parse(this.asset.metadata) 
        : this.asset.metadata;
      
      this.metadataEntries = Object.entries(metadata).map(([key, value]) => ({
        key,
        value: String(value)
      }));
    } catch (e) {
      this.metadataEntries = [];
    }
  } else {
    this.metadataEntries = [];
  }
}

// Dynamic metadata manipulation
addMetadataEntry() {
  this.metadataEntries.push({ key: '', value: '' });
}

removeMetadataEntry(index: number) {
  this.metadataEntries.splice(index, 1);
  this.updateMetadata();
}

// Convert entries back to object
updateMetadata() {
  const metadata: any = {};
  this.metadataEntries
    .filter(entry => entry.key.trim() && entry.value.trim())
    .forEach(entry => {
      metadata[entry.key.trim()] = entry.value.trim();
    });
  
  this.asset.metadata = metadata;
}
```

#### **💾 Save Operations**
```typescript
save() {
  this.updateMetadata(); // Ensure metadata is current
  this.saving = true;

  if (this.asset.id) {
    // Update existing
    this.movableAssetService.updateAssetType(this.asset).subscribe({
      next: (data) => {
        if (data) {
          this.formSubmitted.emit(data);
          this.saving = false;
          this.closeForm();
        }
      },
      error: (err) => {
        console.error('Error updating asset type:', err);
        this.saving = false;
      },
    });
  } else {
    // Create new
    this.movableAssetService.addAssetType(this.asset).subscribe({
      next: (data) => {
        if (data && data.item) {
          this.formSubmitted.emit(data.item);
          this.saving = false;
          this.closeForm();
        }
      },
      error: (err) => {
        console.error('Error adding asset type:', err);
        this.saving = false;
      },
    });
  }
}
```

---

## 🎯 **5. Key Features & Patterns**

### **🔄 State Management**
- **Reactive Updates**: Observable pattern for data flow
- **Immutable Operations**: Deep copying to prevent mutations
- **Loading States**: User feedback during async operations
- **Error Handling**: Graceful degradation and user feedback

### **🔍 Search & Filtering**
- **Real-time Search**: Computed properties for instant filtering
- **Multi-field Search**: Search across name, category, and description
- **Case-insensitive**: User-friendly search experience

### **🎨 UI/UX Excellence**
- **Responsive Design**: Mobile-first approach with adaptive layouts
- **Professional Styling**: Gradient badges, hover effects, animations
- **Accessibility**: Proper ARIA labels and semantic HTML
- **Visual Feedback**: Loading spinners, hover states, status indicators

### **📊 Data Handling**
- **JSON Metadata**: Flexible custom properties system
- **Type Safety**: Full TypeScript integration
- **CSV Export**: Data portability and reporting
- **Inline Editing**: No navigation required for CRUD operations

### **🏗️ Component Architecture**
- **Separation of Concerns**: Clear division between list and form
- **Reusable Components**: Modular, composable design
- **Event-driven Communication**: Parent-child communication via events
- **Service Layer**: Centralized HTTP operations

---

## 🚀 **Usage Examples**

### **Creating a New Asset Type**
```typescript
// User clicks "Add Asset Type"
initNewItem() {
  this.showAddForm = true;
  this.newItem = {
    name: '',
    category: '',
    description: '',
    default_value: 0,
    total_quantity: 0,
    metadata: {},
  };
}

// Form saves successfully
onAssetTypeSaved(assetType: IAssetType) {
  this.fetchAssetTypes(); // Refresh list
  this.closeForm();       // Close modal
}
```

### **Searching Asset Types**
```html
<!-- Real-time search -->
<input [(ngModel)]="searchTerm" placeholder="Search..." />

<!-- Filtered results -->
<div *ngFor="let asset of filteredAssetTypes">
  {{ asset.name }}
</div>
```

### **Displaying Metadata**
```html
<!-- Dynamic metadata tags -->
<span *ngFor="let tag of getMetadataTags(asset.metadata)" 
      class="badge">
  {{ tag }}
</span>
```

This frontend architecture provides a robust, user-friendly, and maintainable solution for movable asset management with excellent performance and user experience.
