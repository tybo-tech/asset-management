import { Component, Input } from '@angular/core';
import { ILowStock } from 'src/services/count.service';

@Component({
  selector: 'app-low-stock-items',
  templateUrl: './low-stock-items.component.html',
  styleUrls: ['./low-stock-items.component.scss']
})
export class LowStockItemsComponent {
onRowClick(_t13: ILowStock) {
throw new Error('Method not implemented.');
}
@Input() list: ILowStock[] = [];
}
