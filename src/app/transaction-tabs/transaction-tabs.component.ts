import { Component } from '@angular/core';

@Component({
  selector: 'app-transaction-tabs',
  templateUrl: './transaction-tabs.component.html',
  styleUrls: ['./transaction-tabs.component.scss']
})
export class TransactionTabsComponent {
//  'restock' | 'usage'
tabs = [
  {
    label: 'Restock',
    url: '/transactions/restock',
    icon: 'bi bi-arrow-repeat',
  },
  {
    label: 'Dispatched Items',
    url: '/transactions/usage',
    icon: 'bi bi-arrow-down',
  }
]
}
