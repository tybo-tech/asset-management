import { Component, Input } from '@angular/core';
import { ICount, ICountResponse } from 'src/services/count.service';

@Component({
  selector: 'app-stat-card',
  templateUrl: './stat-card.component.html',
  styleUrls: ['./stat-card.component.scss'],
})
export class StatCardComponent {
  @Input() stat?: ICount;

  getIcon(item: ICount): any {
    return 'bi bi-arrow-up-right';
  }
}
