import { Component } from '@angular/core';
import { toast } from 'src/app/functions';
import { Category } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { CategoryService } from 'src/services/CategoryService';
import { DataService } from 'src/services/DataService';

@Component({
  selector: 'app-list-category',
  templateUrl: './list-category.component.html',
  styleUrls: ['./list-category.component.scss'],
})
export class ListCategoryComponent {
  list: Category[] = [];
  page = PAGES.category;
  search = '';
  constructor(private dataService: CategoryService) {
    this.getCategories();
  }
  getCategories() {
    this.dataService.getAll().subscribe((data) => {
      this.list = data || [];
    });
  }
  delete(_t24: Category) {
    if (!confirm('Are you sure you want to delete this category?')) return;
    this.dataService.remove(_t24.id).subscribe(() => {
      toast('Deleted successfully', 'success');
      this.getCategories();
    });
  }
}
