import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { toast } from 'src/app/functions';
import { initLocation, initOtherInfo, initSupplier, ISupplier, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-supplier',
  templateUrl: './supplier.component.html',
  styleUrls: ['./supplier.component.scss']
})
export class SupplierComponent {
 page = PAGES.supplier
  data?: OtherInfo<ISupplier>;
  id = '';
  constructor(
    private supplierService: OtherInfoService<ISupplier>,
    private activatedRoute: ActivatedRoute,
    private router: Router
  ) {
    activatedRoute.params.subscribe((params) => {
      this.id = params['id'];
      this.get();
    });
  }
  get() {
    if ('add' === this.id) {
      this.data = initOtherInfo<ISupplier>(
        OTHER_TYPES.Suppliers,
        '1',
        initSupplier()
      );
      return;
    }

    this.supplierService.get(this.id).subscribe((data) => {
      this.data = data;
      if(this.data && this.data.ItemValue){
        this.data.ItemValue = data.ItemValue;
      }
    });
  }

  save(){
    if(!this.data) return;
    this.data.Name = this.data.ItemValue.Name;
    this.data.Status = 'Active';
   this.supplierService.save(this.data).subscribe((data) => {
      if(data && data.Id){
        toast('Saved');
        this.router.navigate(['/suppliers']);
      }else{
        toast('Error saving');
      }
    });
  }
}
