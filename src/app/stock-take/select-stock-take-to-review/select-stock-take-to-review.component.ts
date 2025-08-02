import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { IKeyValue } from 'src/models/IKeyValue';
import { IStockTake, OTHER_TYPES } from 'src/models/other-info.model';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-select-stock-take-to-review',
  templateUrl: './select-stock-take-to-review.component.html',
  styleUrls: ['./select-stock-take-to-review.component.scss'],
})
export class SelectStockTakeToReviewComponent {
  items: string[] = [];
  columns: IKeyValue[] = [
    {
      value: 'Name',
      key: 'name',
    },
  ];
  dataList: any[] = [];
  constructor(
    private stockTakeService: OtherInfoService<IStockTake>,
    private router: Router
  ) {
    this.distinctByName();
  }

  distinctByName() {
    this.stockTakeService
      .distinctByName(OTHER_TYPES.StockTake)
      .subscribe((data) => {
        this.items = data || [];
        this.dataList = this.items.map((item) => {
          const i = {
            name: item,
          };
          return i;
        });
      });
  }

  rowClick($event: any) {
    if ($event && $event.name) {
      this.router.navigate(['/review-stock-take'], {
        queryParams: { name: $event.name },
      });
    }
  }
}
