import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IKeyValue } from 'src/models/IKeyValue';
import { CategoryService } from 'src/services/CategoryService';

@Component({
  selector: 'app-init-stock-take',
  templateUrl: './init-stock-take.component.html',
  styleUrls: ['./init-stock-take.component.scss'],
})
export class InitStockTakeComponent {
  id = '';
  options: any[] = [];
  columns: IKeyValue[] = [
    {
      value: 'Code',
      key: 'code',
    },
    {
      value: 'Name',
      key: 'name',
    },
  ];
  constructor(
    private activedRoute: ActivatedRoute,
    private categoryService: CategoryService,
    private router: Router
  ) {
    this.activedRoute.params.subscribe((params) => {
      this.id = params['id'] || '';
      this.load();
    });
  }
  load() {
    if (this.id === 'category') {
      this.categoryService.getAll().subscribe((data) => {
        if (data && data.length > 0) {
          this.options = data;
        }
      });
    }
  }
  onRowClick($event: any) {
    if ($event && $event.id) {
      this.router.navigate([`/stocktake/${this.id}`], {
        queryParams: { id: $event.id },
      });
    }
  }
}
