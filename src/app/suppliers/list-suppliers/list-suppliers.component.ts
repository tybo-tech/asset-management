import { Component } from '@angular/core';
import { ISupplier, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-list-suppliers',
  templateUrl: './list-suppliers.component.html',
  styleUrls: ['./list-suppliers.component.scss'],
})
export class ListSuppliersComponent {
  page = PAGES.supplier;
  suppliers: OtherInfo<ISupplier>[] = [];
  search = '';
  constructor(private supplierService: OtherInfoService<ISupplier>) {
    this.getSupppliers();
  }

  getSupppliers() {
    this.supplierService
      .search({ ItemType: OTHER_TYPES.Suppliers })
      .subscribe((data) => {
        this.suppliers = data || [];
      });
  }
}
