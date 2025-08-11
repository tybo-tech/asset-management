import { Component, Input, Output, EventEmitter } from '@angular/core';

export interface SortEvent {
  field: string;
  direction: 'asc' | 'desc';
}

@Component({
  selector: 'app-asset-type-filters',
  templateUrl: './asset-type-filters.component.html',
  styleUrls: ['./asset-type-filters.component.scss']
})
export class AssetTypeFiltersComponent {
  @Input() searchTerm: string = '';
  @Input() filterCategory: string = '';
  @Input() availableCategories: string[] = [];
  @Input() loading: boolean = false;
  @Input() sortField: string = '';
  @Input() sortDirection: 'asc' | 'desc' = 'asc';

  @Output() searchTermChange = new EventEmitter<string>();
  @Output() filterCategoryChange = new EventEmitter<string>();
  @Output() clearFilters = new EventEmitter<void>();
  @Output() exportToCsv = new EventEmitter<void>();
  @Output() addNew = new EventEmitter<void>();
  @Output() sortChange = new EventEmitter<SortEvent>();

  onSearchTermChange(value: string) {
    this.searchTermChange.emit(value);
  }

  onFilterCategoryChange(value: string) {
    this.filterCategoryChange.emit(value);
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

  onSort(field: string, direction: 'asc' | 'desc') {
    this.sortChange.emit({ field, direction });
  }
}
