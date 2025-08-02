import { Component } from '@angular/core';
import { ITenant, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-list-tanants',
  templateUrl: './list-tanants.component.html',
  styleUrls: ['./list-tanants.component.scss'],
})
export class ListTanantsComponent {
  page = PAGES.tanant;
  tanants: OtherInfo<ITenant>[] = [];
  search = '';
  constructor(private tenantService: OtherInfoService<ITenant>) {
    this.getTanants();
  }

  getTanants() {
    this.tenantService.search({ ItemType: OTHER_TYPES.Tanants }).subscribe((data) => {
      this.tanants = data || [];
    });
  }
}
