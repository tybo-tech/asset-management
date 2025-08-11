import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-asset-type-header',
  templateUrl: './asset-type-header.component.html',
  styleUrls: ['./asset-type-header.component.scss']
})
export class AssetTypeHeaderComponent {
  @Input() totalTypes: number = 0;
  @Input() totalAssets: number = 0;
  @Input() activeCategories: number = 0;
}
