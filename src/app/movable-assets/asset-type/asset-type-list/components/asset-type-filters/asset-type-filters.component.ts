import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-asset-type-filters',
  templateUrl: './asset-type-filters.component.html',
  styleUrls: ['./asset-type-filters.component.scss']
})
export class AssetTypeFiltersComponent {
  @Input() searchTerm = '';
  @Input() filterCategory = '';
  @Input() availableCategories: string[] = [];
  @Input() loading = false;
  @Input() sortField = 'name';
  @Input() sortDirection: 'asc' | 'desc' = 'asc';

  @Output() searchTermChange = new EventEmitter<string>();
  @Output() filterCategoryChange = new EventEmitter<string>();
  @Output() clearFilters = new EventEmitter<void>();
  @Output() exportToCsv = new EventEmitter<void>();
  @Output() addNew = new EventEmitter<void>();
  @Output() sortChange = new EventEmitter<{field: string, direction: 'asc' | 'desc'}>();

  onSearchChange(value: string) {
    this.searchTermChange.emit(value);
  }

  onCategoryChange(value: string) {
    this.filterCategoryChange.emit(value);
  }

  onClearSearch() {
    this.searchTermChange.emit('');
  }

  onClearFilters() {
    this.clearFilters.emit();
  }

  onExportToCsv() {
    this.exportToCsv.emit();
  }

  onAddNew() {
    this.addNew.emit();
  }

  onSortBy(field: string) {
    const direction = this.sortField === field && this.sortDirection === 'asc' ? 'desc' : 'asc';
    this.sortChange.emit({ field, direction });
  }

  getSortIcon(field: string): string {
    if (this.sortField !== field) return 'bi-arrow-down-up';
    return this.sortDirection === 'asc' ? 'bi-arrow-up' : 'bi-arrow-down';
  }
}
