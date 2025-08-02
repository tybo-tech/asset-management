import { Component, EventEmitter, Output } from '@angular/core';
import { ITransactionFilter } from 'src/models/Transaction';

@Component({
  selector: 'app-filters',
  templateUrl: './filters.component.html',
  styleUrls: ['./filters.component.scss'],
})
export class FiltersComponent {
  @Output() filtersApplied = new EventEmitter<ITransactionFilter>();

  isModalOpen = false; // Track modal state

  selectedCategory = '';
  selectedLocation= '';
  selectedStatus= '';

  categories = ['Stationary', 'Plumbing', 'Kitchenary', 'Elitric'];
  locations = ['Sea board office', 'G1 001', '1104', '212'];
  statuses = ['Pending', 'Completed'];
  selectedDateRangeStart = '';
  selectedDateRangeEnd = '';

  // Open modal
  openModal() {
    this.isModalOpen = true;
  }

  // Close modal
  closeModal() {
    this.isModalOpen = false;
  }

  get selectedDateRange(): string {
    if (!this.selectedDateRangeStart) return 'All';
    if (this.selectedDateRangeStart && !this.selectedDateRangeEnd)
      return this.selectedDateRangeStart;

    return `${this.selectedDateRangeStart} - ${this.selectedDateRangeEnd}`;
  }
  // Apply filters
  applyFilters() {
    const filters: ITransactionFilter = {
      startDate: this.selectedDateRangeStart,
      endDate: this.selectedDateRangeEnd,
      category: this.selectedCategory,
      location: this.selectedLocation,
      status: this.selectedStatus,
    };
    this.filtersApplied.emit(filters);
    this.closeModal();
  }
}
